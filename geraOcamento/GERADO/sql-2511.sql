-- ========================================
-- SQL FINAL CORRIGIDO - Baseado no exemplo fornecido
-- ========================================
-- Este SQL retorna o formato EXATO mostrado no exemplo
-- Corrigido para listar TODOS os itens individualmente
-- ========================================

WITH unidade AS (
    SELECT
        ue.id,
        ue.cliente_id,
        ue.forma_pagamento
    FROM unidades_escolares ue
    WHERE ue.id = :unidade_escolar_id
),

-- ✅ CORRIGIDO: Lista cada arquivo/item individualmente baseado em arquivo_pdfs
-- Agrupa por "pares" para pegar capa OU miolo (prioriza capa)
itens_produto AS (
    SELECT DISTINCT ON (ap.pares)
        ap.pares,
        ap.item_pedido_id,
        ef.id AS especificacao_id,
        ef.id_produto,
        -- Nome do arquivo (prioriza capa, senão miolo)
        REPLACE(LOWER(ap.nome), '.pdf', '') AS nome_arquivo,
        ef.altura,
        ef.largura,
        ef.gramatura_miolo,
        COALESCE(dm.quantidade, 0) AS quantidade_total
    FROM unidade u
    JOIN distribuicao_materiais dm
        ON dm.unidade_escolar_id = u.id
    JOIN especificacoes_form ef
        ON ef.id = dm.especificacao_form_id
    JOIN arquivo_pdfs ap
        ON ap.formulario_id = ef.formulario_id
        AND ap.item_pedido_id = ef.id
    WHERE dm.quantidade > 0
    ORDER BY ap.pares, 
        CASE WHEN LOWER(ap.tipo_arquivo) = 'capa' THEN 1 ELSE 2 END
),

-- Mantém referência das especificações individuais para buscar componentes

itens AS (
    SELECT
        ef.id AS especificacao_id,
        ef.id_produto,
        bi.descricao,
        ef.altura,
        ef.largura,
        ef.gramatura_miolo
    FROM unidade u
    JOIN distribuicao_materiais dm
        ON dm.unidade_escolar_id = u.id
    JOIN especificacoes_form ef
        ON ef.id = dm.especificacao_form_id
    JOIN bremen_itens bi
        ON bi.id_produto = ef.id_produto
),

componentes AS (
    SELECT
        i.especificacao_id,
        i.id_produto,
        bc.id AS componente_id,
        bc.id_componente,
        bc.descricao,
        ROUND(i.altura::numeric / 10, 2) AS altura,
        ROUND(i.largura::numeric / 10, 2) AS largura,
        i.gramatura_miolo,
        -- Busca páginas do arquivo vinculado a ESTA especificação e componente
        (
            SELECT ap.paginas
            FROM arquivo_pdfs ap
            WHERE ap.item_pedido_id = i.especificacao_id
              AND ap.id_componente = bc.id_componente
            ORDER BY ap.criado_em DESC
            LIMIT 1
        ) AS quantidade_paginas
    FROM itens i
    JOIN bremen_componentes bc
        ON bc.id_produto = i.id_produto
),

-- Respostas de componentes (por especificação individual)
respostas_componentes AS (
    SELECT DISTINCT ON (c.especificacao_id, c.id_componente, bp.id)
        c.especificacao_id,
        c.id_produto,
        c.id_componente,
        bp.id AS pergunta_id,
        br.valor AS resposta
    FROM componentes c
    JOIN bremen_perguntas bp ON bp.id_componente = c.id_componente
    LEFT JOIN bremen_especificacao_detalhes bed 
        ON bed.pergunta_id = bp.id
        AND bed.especificacao_id = c.especificacao_id
    LEFT JOIN bremen_respostas br ON br.id = bed.resposta_id
    WHERE br.valor IS NOT NULL
    ORDER BY c.especificacao_id, c.id_componente, bp.id
),

-- Respostas gerais (por especificação individual)
respostas_gerais AS (
    SELECT DISTINCT ON (i.especificacao_id, bp.id)
        i.especificacao_id,
        i.id_produto,
        bp.id AS pergunta_id,
        br.valor AS resposta
    FROM itens i
    JOIN bremen_perguntas bp ON bp.id_geral = i.id_produto
    LEFT JOIN bremen_especificacao_detalhes bed 
        ON bed.pergunta_id = bp.id
        AND bed.especificacao_id = i.especificacao_id
    LEFT JOIN bremen_respostas br ON br.id = bed.resposta_id
    WHERE br.valor IS NOT NULL
    ORDER BY i.especificacao_id, bp.id
)


SELECT json_build_object(
    'identifier', 'PageFlow',
    'data', json_build_object(
        'id_cliente', u.cliente_id,
        'id_vendedor', 3,
        'id_forma_pagamento', COALESCE(u.forma_pagamento::text, '1'),

        'itens', COALESCE((
            SELECT json_agg(
                json_build_object(
                    'id', ip.id_produto,
                    'descricao', ip.nome_arquivo,
                    'quantidade', ip.quantidade_total,

                    'componentes', COALESCE((
                        SELECT json_agg(
                            json_build_object(
                                'id', comp_unico.componente_id,
                                'descricao', comp_unico.descricao,
                                'altura', comp_unico.altura,
                                'largura', comp_unico.largura,
                                'quantidade_paginas', comp_unico.quantidade_paginas,
                                'gramaturasubstratoimpressao', comp_unico.gramatura_miolo,
                                'perguntas_componente', COALESCE((
                                    SELECT json_agg(
                                        json_build_object(
                                            'id_pergunta', bp.id,
                                            'pergunta', bp.nome,
                                            'tipo', bp.tipo,
                                            'resposta', rc.resposta
                                        )
                                        ORDER BY bp.id
                                    )
                                    FROM bremen_perguntas bp
                                    INNER JOIN respostas_componentes rc
                                        ON rc.pergunta_id = bp.id
                                        AND rc.especificacao_id = ip.especificacao_id
                                        AND rc.id_componente = comp_unico.id_componente
                                    WHERE bp.id_componente = comp_unico.id_componente
                                ), '[]'::json)
                            )
                            ORDER BY comp_unico.componente_id
                        )
                        FROM (
                            SELECT DISTINCT ON (comp.componente_id)
                                comp.componente_id,
                                comp.id_componente,
                                comp.descricao,
                                comp.altura,
                                comp.largura,
                                comp.gramatura_miolo,
                                comp.quantidade_paginas
                            FROM componentes comp
                            WHERE comp.especificacao_id = ip.especificacao_id
                            ORDER BY comp.componente_id
                        ) comp_unico
                    ), '[]'::json),

                    'perguntas_gerais', COALESCE((
                        SELECT json_agg(
                            json_build_object(
                                'id_pergunta', bp.id,
                                'pergunta', bp.nome,
                                'tipo', bp.tipo,
                                'resposta', rg.resposta
                            )
                            ORDER BY bp.id
                        )
                        FROM bremen_perguntas bp
                        INNER JOIN respostas_gerais rg
                            ON rg.pergunta_id = bp.id
                            AND rg.especificacao_id = ip.especificacao_id
                        WHERE bp.id_geral = ip.id_produto
                    ), '[]'::json)
                )
                ORDER BY ip.especificacao_id
            )
            FROM itens_produto ip
        ), '[]'::json)
    )
)
FROM unidade u;