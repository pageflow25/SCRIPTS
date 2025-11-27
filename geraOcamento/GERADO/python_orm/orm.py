"""
ORM Query - Geração de Orçamento PageFlow
==========================================
Converte o SQL de orçamento em queries ORM usando SQLAlchemy.

Parâmetros:
- unidade_escolar_id: ID da unidade escolar
"""

from sqlalchemy import (
    select, func, case, literal, and_, or_, cast, String, Integer,
    JSON
)
from sqlalchemy.orm import aliased
from typing import Optional


def gerar_orcamento_orm(session, unidade_escolar_id: int):
    """
    Gera o JSON de orçamento para uma unidade escolar usando ORM.
    
    Args:
        session: SQLAlchemy session
        unidade_escolar_id: ID da unidade escolar
        
    Returns:
        dict: JSON no formato PageFlow
    """
    from models import (
        UnidadeEscolar, DistribuicaoMaterial, EspecificacaoForm,
        ArquivoPdf, BremenItem, BremenComponente, BremenPergunta,
        BremenResposta, BremenEspecificacaoDetalhe
    )
    
    # ========================================
    # CTE: unidade
    # ========================================
    unidade_cte = (
        select(
            UnidadeEscolar.id.label('id'),
            UnidadeEscolar.cliente_id.label('cliente_id'),
            UnidadeEscolar.forma_pagamento.label('forma_pagamento')
        )
        .where(UnidadeEscolar.id == unidade_escolar_id)
        .cte('unidade')
    )
    
    # ========================================
    # CTE: itens_produto
    # ========================================
    # Alias para joins
    dm = aliased(DistribuicaoMaterial)
    ef = aliased(EspecificacaoForm)
    ap = aliased(ArquivoPdf)
    
    # Subquery para priorizar CAPA sobre MIOLO
    tipo_ordem = case(
        (func.lower(ap.tipo_arquivo) == 'capa', 1),
        else_=2
    )
    
    itens_produto_cte = (
        select(
            ap.pares.label('pares'),
            ap.item_pedido_id.label('item_pedido_id'),
            ef.id.label('especificacao_id'),
            ef.id_produto.label('id_produto'),
            func.replace(func.lower(ap.nome), '.pdf', '').label('nome_arquivo'),
            ef.altura.label('altura'),
            ef.largura.label('largura'),
            ef.gramatura_miolo.label('gramatura_miolo'),
            func.coalesce(dm.quantidade, 0).label('quantidade_total')
        )
        .select_from(unidade_cte)
        .join(dm, dm.unidade_escolar_id == unidade_cte.c.id)
        .join(ef, ef.id == dm.especificacao_form_id)
        .join(
            ap,
            and_(
                ap.formulario_id == ef.formulario_id,
                ap.item_pedido_id == ef.id
            )
        )
        .where(dm.quantidade > 0)
        .order_by(ap.pares, tipo_ordem)
        .distinct(ap.pares)
        .cte('itens_produto')
    )
    
    # ========================================
    # CTE: itens
    # ========================================
    ef2 = aliased(EspecificacaoForm)
    bi = aliased(BremenItem)
    dm2 = aliased(DistribuicaoMaterial)
    
    itens_cte = (
        select(
            ef2.id.label('especificacao_id'),
            ef2.id_produto.label('id_produto'),
            bi.descricao.label('descricao'),
            ef2.altura.label('altura'),
            ef2.largura.label('largura'),
            ef2.gramatura_miolo.label('gramatura_miolo')
        )
        .select_from(unidade_cte)
        .join(dm2, dm2.unidade_escolar_id == unidade_cte.c.id)
        .join(ef2, ef2.id == dm2.especificacao_form_id)
        .join(bi, bi.id_produto == ef2.id_produto)
        .cte('itens')
    )
    
    # ========================================
    # CTE: componentes
    # ========================================
    bc = aliased(BremenComponente)
    ap2 = aliased(ArquivoPdf)
    
    # Subquery para buscar páginas
    paginas_subq = (
        select(ap2.paginas)
        .where(
            and_(
                ap2.item_pedido_id == itens_cte.c.especificacao_id,
                ap2.id_componente == bc.id_componente
            )
        )
        .order_by(ap2.criado_em.desc())
        .limit(1)
        .scalar_subquery()
    )
    
    componentes_cte = (
        select(
            itens_cte.c.especificacao_id.label('especificacao_id'),
            itens_cte.c.id_produto.label('id_produto'),
            bc.id.label('componente_id'),
            bc.id_componente.label('id_componente'),
            bc.descricao.label('descricao'),
            func.round(cast(itens_cte.c.altura, Integer) / 10, 2).label('altura'),
            func.round(cast(itens_cte.c.largura, Integer) / 10, 2).label('largura'),
            itens_cte.c.gramatura_miolo.label('gramatura_miolo'),
            paginas_subq.label('quantidade_paginas')
        )
        .select_from(itens_cte)
        .join(bc, bc.id_produto == itens_cte.c.id_produto)
        .cte('componentes')
    )
    
    # ========================================
    # CTE: respostas_componentes
    # ========================================
    bp = aliased(BremenPergunta)
    bed = aliased(BremenEspecificacaoDetalhe)
    br = aliased(BremenResposta)
    
    respostas_componentes_cte = (
        select(
            componentes_cte.c.especificacao_id.label('especificacao_id'),
            componentes_cte.c.id_produto.label('id_produto'),
            componentes_cte.c.id_componente.label('id_componente'),
            bp.id.label('pergunta_id'),
            br.valor.label('resposta')
        )
        .select_from(componentes_cte)
        .join(bp, bp.id_componente == componentes_cte.c.id_componente)
        .outerjoin(
            bed,
            and_(
                bed.pergunta_id == bp.id,
                bed.especificacao_id == componentes_cte.c.especificacao_id
            )
        )
        .outerjoin(br, br.id == bed.resposta_id)
        .where(br.valor.isnot(None))
        .distinct(componentes_cte.c.especificacao_id, componentes_cte.c.id_componente, bp.id)
        .order_by(componentes_cte.c.especificacao_id, componentes_cte.c.id_componente, bp.id)
        .cte('respostas_componentes')
    )
    
    # ========================================
    # CTE: respostas_gerais
    # ========================================
    bp2 = aliased(BremenPergunta)
    bed2 = aliased(BremenEspecificacaoDetalhe)
    br2 = aliased(BremenResposta)
    
    respostas_gerais_cte = (
        select(
            itens_cte.c.especificacao_id.label('especificacao_id'),
            itens_cte.c.id_produto.label('id_produto'),
            bp2.id.label('pergunta_id'),
            br2.valor.label('resposta')
        )
        .select_from(itens_cte)
        .join(bp2, bp2.id_geral == itens_cte.c.id_produto)
        .outerjoin(
            bed2,
            and_(
                bed2.pergunta_id == bp2.id,
                bed2.especificacao_id == itens_cte.c.especificacao_id
            )
        )
        .outerjoin(br2, br2.id == bed2.resposta_id)
        .where(br2.valor.isnot(None))
        .distinct(itens_cte.c.especificacao_id, bp2.id)
        .order_by(itens_cte.c.especificacao_id, bp2.id)
        .cte('respostas_gerais')
    )
    
    # ========================================
    # Query Principal - Construção do JSON
    # ========================================
    # Nota: A construção completa do JSON aninhado com json_agg é complexa em ORM.
    # Esta é uma implementação simplificada que retorna os dados estruturados.
    # O JSON final pode ser montado em Python.
    
    # Buscar dados da unidade
    unidade_result = session.execute(
        select(unidade_cte)
    ).first()
    
    if not unidade_result:
        return None
    
    # Buscar itens produto
    itens_produto_result = session.execute(
        select(itens_produto_cte).order_by(itens_produto_cte.c.especificacao_id)
    ).all()
    
    # Buscar componentes
    componentes_result = session.execute(
        select(componentes_cte)
    ).all()
    
    # Buscar respostas de componentes
    respostas_comp_result = session.execute(
        select(respostas_componentes_cte)
    ).all()
    
    # Buscar respostas gerais
    respostas_gerais_result = session.execute(
        select(respostas_gerais_cte)
    ).all()
    
    # Buscar perguntas de componentes
    bp_comp = aliased(BremenPergunta)
    perguntas_comp_result = session.execute(
        select(
            bp_comp.id.label('id'),
            bp_comp.id_componente.label('id_componente'),
            bp_comp.nome.label('nome'),
            bp_comp.tipo.label('tipo')
        )
    ).all()
    
    # Buscar perguntas gerais
    bp_geral = aliased(BremenPergunta)
    perguntas_gerais_result = session.execute(
        select(
            bp_geral.id.label('id'),
            bp_geral.id_geral.label('id_geral'),
            bp_geral.nome.label('nome'),
            bp_geral.tipo.label('tipo')
        )
        .where(bp_geral.id_geral.isnot(None))
    ).all()
    
    # ========================================
    # Montagem do JSON em Python
    # ========================================
    # Criar dicionários de lookup
    componentes_dict = {}
    for comp in componentes_result:
        spec_id = comp.especificacao_id
        if spec_id not in componentes_dict:
            componentes_dict[spec_id] = []
        componentes_dict[spec_id].append(comp)
    
    respostas_comp_dict = {}
    for resp in respostas_comp_result:
        key = (resp.especificacao_id, resp.id_componente, resp.pergunta_id)
        respostas_comp_dict[key] = resp.resposta
    
    respostas_gerais_dict = {}
    for resp in respostas_gerais_result:
        key = (resp.especificacao_id, resp.pergunta_id)
        respostas_gerais_dict[key] = resp.resposta
    
    perguntas_comp_dict = {}
    for perg in perguntas_comp_result:
        id_comp = perg.id_componente
        if id_comp not in perguntas_comp_dict:
            perguntas_comp_dict[id_comp] = []
        perguntas_comp_dict[id_comp].append(perg)
    
    perguntas_gerais_dict = {}
    for perg in perguntas_gerais_result:
        id_geral = perg.id_geral
        if id_geral not in perguntas_gerais_dict:
            perguntas_gerais_dict[id_geral] = []
        perguntas_gerais_dict[id_geral].append(perg)
    
    # Montar estrutura de itens
    itens = []
    for item in itens_produto_result:
        spec_id = item.especificacao_id
        id_produto = item.id_produto
        
        # Montar componentes do item
        componentes = []
        for comp in componentes_dict.get(spec_id, []):
            # Montar perguntas do componente
            perguntas_componente = []
            for perg in perguntas_comp_dict.get(comp.id_componente, []):
                key = (spec_id, comp.id_componente, perg.id)
                resposta = respostas_comp_dict.get(key)
                if resposta:
                    perguntas_componente.append({
                        'id_pergunta': perg.id,
                        'pergunta': perg.nome,
                        'tipo': perg.tipo,
                        'resposta': resposta
                    })
            
            componentes.append({
                'id': comp.componente_id,
                'descricao': comp.descricao,
                'altura': float(comp.altura) if comp.altura else None,
                'largura': float(comp.largura) if comp.largura else None,
                'quantidade_paginas': comp.quantidade_paginas,
                'gramaturasubstratoimpressao': comp.gramatura_miolo,
                'perguntas_componente': perguntas_componente if perguntas_componente else []
            })
        
        # Montar perguntas gerais do item
        perguntas_gerais = []
        for perg in perguntas_gerais_dict.get(id_produto, []):
            key = (spec_id, perg.id)
            resposta = respostas_gerais_dict.get(key)
            if resposta:
                perguntas_gerais.append({
                    'id_pergunta': perg.id,
                    'pergunta': perg.nome,
                    'tipo': perg.tipo,
                    'resposta': resposta
                })
        
        itens.append({
            'id': id_produto,
            'descricao': item.nome_arquivo,
            'quantidade': item.quantidade_total,
            'componentes': componentes,
            'perguntas_gerais': perguntas_gerais if perguntas_gerais else []
        })
    
    # Montar JSON final
    resultado = {
        'identifier': 'PageFlow',
        'data': {
            'id_cliente': unidade_result.cliente_id,
            'id_vendedor': 3,
            'id_forma_pagamento': str(unidade_result.forma_pagamento) if unidade_result.forma_pagamento else '1',
            'itens': itens
        }
    }
    
    return resultado


# ========================================
# Exemplo de uso
# ========================================
if __name__ == '__main__':
    from sqlalchemy import create_engine
    from sqlalchemy.orm import sessionmaker
    import json
    
    # Configurar conexão
    DATABASE_URL = "postgresql://usuario:senha@localhost:5432/database"
    engine = create_engine(DATABASE_URL)
    Session = sessionmaker(bind=engine)
    session = Session()
    
    try:
        # Executar query
        unidade_escolar_id = 2511
        resultado = gerar_orcamento_orm(session, unidade_escolar_id)
        
        # Exibir resultado
        print(json.dumps(resultado, indent=2, ensure_ascii=False))
        
    finally:
        session.close()
