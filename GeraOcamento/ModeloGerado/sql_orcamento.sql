-- ========================================
-- SQL FINAL - CORREÇÃO GRAMATURA SOMENTE NO MIOLO
-- ========================================

WITH parametros AS (
    SELECT
		14 AS escola_id,                 
        91 AS id_produto,              
        ARRAY[]::date[] AS datas_saida
),

unidades_filtradas AS (
    SELECT
        ue.id,
        ue.cliente_id, 
        ue.forma_pagamento,
        ue.escola_id
    FROM unidades_escolares ue
    CROSS JOIN parametros p
    WHERE ue.escola_id = p.escola_id
),

especificacoes_unidade AS (
    SELECT DISTINCT
        uf.cliente_id,
        ef.id AS especificacao_id,
        ef.id_produto,
        COALESCE(bt.altura, NULLIF(ef.altura, '')::numeric) AS altura_mm,
        COALESCE(bt.largura, NULLIF(ef.largura, '')::numeric) AS largura_mm,
        NULLIF(ef.gramatura_miolo, '') AS gramatura_miolo,
        bg.gramatura AS gramatura_catalogo,
        bg.unidade_medida AS unidade_gramatura,
        dm.quantidade,
        dm.data_saida,
        ap.pares,
        ap.formulario_id,
        ap.nome AS arquivo_nome,
        ap.tipo_arquivo,
        ap.id_componente,
        ap.paginas, 
        bi.frente_verso,
        bi."categoria_Prod"
    FROM unidades_filtradas uf
    CROSS JOIN parametros p
    JOIN distribuicao_materiais dm ON dm.unidade_escolar_id = uf.id
    JOIN especificacoes_form ef ON ef.id = dm.especificacao_form_id
    LEFT JOIN bremen_gramatura bg ON bg.id = ef.id_gramatura
    LEFT JOIN bremen_tamanho_papel bt ON bt.id = ef.id_papel
    LEFT JOIN arquivo_pdfs ap ON ap.item_pedido_id = ef.id
    LEFT JOIN bremen_itens bi ON bi.id_produto = ef.id_produto 
	WHERE dm.quantidade > 0
   	 	AND (p.id_produto IS NULL OR ef.id_produto = p.id_produto)
    	AND (
        	p.datas_saida IS NULL
        	OR NULLIF(dm.data_saida, '')::date = ANY(p.datas_saida)
        	OR NULLIF(dm.data_saida, '') IS NULL
    	)
),

itens_produto AS (
    SELECT
        eu.cliente_id, 
        COALESCE(eu.pares::text, eu.especificacao_id::text) AS chave_agrupamento,
        eu.pares,
        eu.formulario_id,
        MAX(eu.especificacao_id) AS especificacao_id,
        MAX(eu.id_produto) AS id_produto,
        COALESCE(
            MAX(CASE WHEN LOWER(eu.tipo_arquivo) = 'capa' THEN REPLACE(LOWER(eu.arquivo_nome), '.pdf', '') END),
            MAX(CASE WHEN LOWER(eu.tipo_arquivo) = 'miolo' THEN REPLACE(LOWER(eu.arquivo_nome), '.pdf', '') END),
            MAX(REPLACE(LOWER(eu.arquivo_nome), '.pdf', ''))
        ) AS nome_arquivo,
        MAX(eu.altura_mm) AS altura,
        MAX(eu.largura_mm) AS largura,
        MAX(eu.gramatura_miolo) AS gramatura_miolo,
        MAX(eu.quantidade) AS quantidade_total,
        
		CASE
    		WHEN (MAX(eu.paginas) > 2 AND UPPER(MAX(eu.frente_verso)) = 'FV' AND UPPER(MAX(eu."categoria_Prod")) = 'PROVA')
    		  OR (MAX(eu.paginas) > 1 AND UPPER(MAX(eu.frente_verso)) = 'SF' AND UPPER(MAX(eu."categoria_Prod")) = 'PROVA')
    		THEN 'normal'
    		ELSE 'separado'
		END AS tipo_agrupamento

    FROM especificacoes_unidade eu
    GROUP BY
        eu.cliente_id, 
        COALESCE(eu.pares::text, eu.especificacao_id::text),
        eu.pares,
        eu.formulario_id
),

itens AS (
    SELECT DISTINCT
        eu.pares,
        eu.formulario_id,
        eu.especificacao_id,
        eu.id_produto,
        bi.descricao,
        eu.altura_mm,
        eu.largura_mm,
        eu.gramatura_miolo,
        eu.gramatura_catalogo,
        eu.unidade_gramatura
    FROM especificacoes_unidade eu
    JOIN bremen_itens bi ON bi.id_produto = eu.id_produto
),

componentes AS (
    SELECT DISTINCT
        i.pares,
        i.formulario_id,
        i.especificacao_id,
        i.id_produto,
        bc.id AS componente_id,
        bc.id_componente,
        bc.descricao,
        ROUND(i.altura_mm::numeric / 10, 2) AS altura,
        ROUND(i.largura_mm::numeric / 10, 2) AS largura,
        i.gramatura_miolo,
        i.gramatura_catalogo,
        CASE
            WHEN LOWER(COALESCE(bc.descricao, '')) LIKE '%capa%' THEN 1
            WHEN LOWER(COALESCE(bc.descricao, '')) LIKE '%miolo%' THEN (
                SELECT COALESCE(ap_pag.paginas, 0)
                FROM arquivo_pdfs ap_pag
                WHERE ap_pag.id_componente = bc.id_componente
                  AND LOWER(COALESCE(ap_pag.tipo_arquivo, '')) = 'miolo'
                  AND (
                      (i.pares IS NOT NULL AND ap_pag.pares = i.pares AND ap_pag.formulario_id = i.formulario_id)
                      OR (i.pares IS NULL AND ap_pag.item_pedido_id = i.especificacao_id)
                  )
                ORDER BY ap_pag.criado_em DESC
                LIMIT 1
            )
            ELSE (
                SELECT ap_pag.paginas
                FROM arquivo_pdfs ap_pag
                WHERE ap_pag.id_componente = bc.id_componente
                  AND (
                      (i.pares IS NOT NULL AND ap_pag.pares = i.pares AND ap_pag.formulario_id = i.formulario_id)
                      OR (i.pares IS NULL AND ap_pag.item_pedido_id = i.especificacao_id)
                  )
                ORDER BY ap_pag.criado_em DESC
                LIMIT 1
            )
        END AS quantidade_paginas
    FROM itens i
    JOIN bremen_componentes bc ON bc.id_produto = i.id_produto
    LEFT JOIN arquivo_pdfs ap_sel
        ON ap_sel.item_pedido_id = i.especificacao_id
       AND ap_sel.id_componente = bc.id_componente
       AND (
            (i.pares IS NOT NULL AND ap_sel.pares = i.pares AND ap_sel.formulario_id = i.formulario_id)
            OR (i.pares IS NULL AND ap_sel.pares IS NULL AND (ap_sel.formulario_id = i.formulario_id OR ap_sel.formulario_id IS NULL))
       )
),

respostas_componentes AS (
    SELECT DISTINCT ON (c.especificacao_id, c.id_componente, bp.id)
        c.pares,
        c.formulario_id,
        c.especificacao_id,
        c.id_produto,
        c.id_componente,
        bp.id AS pergunta_id,
        br.descricao_opcao  AS resposta
    FROM componentes c
    JOIN bremen_perguntas bp ON bp.id_componente = c.id_componente
    LEFT JOIN bremen_especificacao_detalhes bed
        ON bed.pergunta_id = bp.id
        AND bed.especificacao_id = c.especificacao_id
    LEFT JOIN bremen_respostas br ON br.id = bed.resposta_id
    WHERE br.valor IS NOT NULL
    ORDER BY c.especificacao_id, c.id_componente, bp.id
),

respostas_gerais AS (
    SELECT DISTINCT ON (i.especificacao_id, bp.id)
        i.pares,
        i.formulario_id,
        i.especificacao_id,
        i.id_produto,
        bp.id AS pergunta_id,
        br.descricao_opcao  AS resposta
    FROM itens i
    JOIN bremen_perguntas bp ON bp.id_geral = i.id_produto
    LEFT JOIN bremen_especificacao_detalhes bed
        ON bed.pergunta_id = bp.id
        AND bed.especificacao_id = i.especificacao_id
    LEFT JOIN bremen_respostas br ON br.id = bed.resposta_id
    WHERE br.valor IS NOT NULL
    ORDER BY i.especificacao_id, bp.id
)

-- ====================================================================
-- SELECT FINAL
-- ====================================================================
SELECT json_build_object(
    'identifier', 'PageFlow',
    'data', json_build_object(
        'id_cliente', ip.cliente_id, 
        'id_vendedor', 3,
        'id_forma_pagamento', '1',
        'itens', COALESCE(
            json_agg(
                json_build_object(
                    'id_produto', ip.id_produto,
                    'descricao', ip.nome_arquivo,
                    'quantidade', ip.quantidade_total,
                    'usar_listapreco', 1,
                    'manter_estrutura_mod_produto', 1,
                    'componentes', COALESCE((
                        SELECT json_agg(
                            jsonb_strip_nulls(
                                CASE
                                    WHEN LOWER(COALESCE(comp_sel.descricao, '')) LIKE '%miolo%' THEN
                                        jsonb_build_object(
                                            'id', comp_sel.id_componente,
                                            'descricao', comp_sel.descricao,
                                            'altura', comp_sel.altura,
                                            'largura', comp_sel.largura,
                                            'quantidade_paginas', COALESCE(comp_sel.quantidade_paginas, 0),
                                            'gramaturasubstratoimpressao', COALESCE(
                                                comp_sel.gramatura_catalogo,
                                                NULLIF(replace(regexp_replace(comp_sel.gramatura_miolo::text, '[^0-9.,]', '', 'g'), ',', '.'), '')::numeric
                                            ),
                                            'perguntas_componente', COALESCE((
                                                SELECT json_agg(
                                                    json_build_object(
                                                        'id_pergunta', bp.id_pergunta,
                                                        'pergunta', bp.nome,
                                                        'tipo', bp.tipo,
                                                        'resposta', rc.resposta
                                                    )
                                                    ORDER BY bp.id_pergunta
                                                )::jsonb
                                                FROM bremen_perguntas bp
                                                INNER JOIN respostas_componentes rc
                                                    ON rc.pergunta_id = bp.id
                                                    AND rc.id_componente = comp_sel.id_componente
                                                    AND rc.especificacao_id = comp_sel.especificacao_id
                                                WHERE bp.id_componente = comp_sel.id_componente
                                            ), '[]'::jsonb)
                                        )
                                    ELSE
                                        jsonb_build_object(
                                            'id', comp_sel.id_componente,
                                            'descricao', comp_sel.descricao,
                                            'altura', comp_sel.altura,
                                            'largura', comp_sel.largura,
                                            'quantidade_paginas', comp_sel.quantidade_paginas,
                                            'gramaturasubstratoimpressao', CASE
                                                WHEN LOWER(COALESCE(comp_sel.descricao, '')) LIKE '%miolo%' THEN 
                                                    COALESCE(
                                                        comp_sel.gramatura_catalogo,
                                                        NULLIF(replace(regexp_replace(comp_sel.gramatura_miolo::text, '[^0-9.,]', '', 'g'), ',', '.'), '')::numeric
                                                    )
                                                ELSE NULL
                                            END,
                                            'perguntas_componente', COALESCE((
                                                SELECT json_agg(
                                                    json_build_object(
                                                        'id_pergunta', bp.id_pergunta,
                                                        'pergunta', bp.nome,
                                                        'tipo', bp.tipo,
                                                        'resposta', rc.resposta
                                                    )
                                                    ORDER BY bp.id_pergunta
                                                )::jsonb
                                                FROM bremen_perguntas bp
                                                INNER JOIN respostas_componentes rc
                                                    ON rc.pergunta_id = bp.id
                                                    AND rc.id_componente = comp_sel.id_componente
                                                    AND rc.especificacao_id = comp_sel.especificacao_id
                                                WHERE bp.id_componente = comp_sel.id_componente
                                            ), '[]'::jsonb)
                                        )
                                END
                            )::jsonb
                        )
                        FROM (
                            SELECT DISTINCT ON (comp.id_componente)
                                comp.componente_id, comp.id_componente, comp.descricao, comp.altura, comp.largura, comp.gramatura_miolo, comp.gramatura_catalogo, comp.quantidade_paginas, comp.especificacao_id
                            FROM componentes comp
                            WHERE (
                                (ip.pares IS NOT NULL AND comp.pares = ip.pares AND comp.formulario_id = ip.formulario_id)
                                OR (ip.pares IS NULL AND comp.especificacao_id = ip.especificacao_id)
                            )
                            ORDER BY comp.id_componente,
                                CASE WHEN EXISTS (SELECT 1 FROM respostas_componentes rc_pref WHERE rc_pref.id_componente = comp.id_componente AND rc_pref.especificacao_id = comp.especificacao_id) THEN 0 ELSE 1 END,
                                comp.especificacao_id
                        ) comp_sel
                    ), '[]'::json),
                    'perguntas_gerais', COALESCE((
                        SELECT json_agg(
							json_build_object(
							  'tipo', bp.tipo,
							  'pergunta', bp.nome,
							  'resposta', rg.resposta,
							  'id_pergunta', bp.id_pergunta
							)
                        )
                        FROM bremen_perguntas bp
                        INNER JOIN respostas_gerais rg ON rg.pergunta_id = bp.id AND rg.especificacao_id = ip.especificacao_id
                        WHERE bp.id_geral = ip.id_produto
                    ), '[]'::json)
                )
                ORDER BY ip.chave_agrupamento
            ), '[]'::json
        )
    )
)
FROM itens_produto ip
GROUP BY ip.cliente_id, ip.tipo_agrupamento
ORDER BY ip.cliente_id, ip.tipo_agrupamento DESC;