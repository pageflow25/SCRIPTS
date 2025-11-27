
SELECT json_build_object(
    'id', bi.id_produto,
    'descricao', bi.descricao,

    'componentes', (
        SELECT json_agg(
            json_build_object(
                'id', bc.id,
                'descricao', bc.descricao,

                'perguntas_componente', (
                    SELECT json_agg(
                        json_build_object(
                            'id_pergunta', p.id,
                            'pergunta', p.nome,
                            'tipo', p.tipo,

                            -- 1 resposta selecionada
                            'resposta', (
                                SELECT r.valor
                                FROM bremen_respostas r
                                WHERE r.pergunta_id = p.id
                                ORDER BY r.id LIMIT 1
                            ),

                            -- todas as opções da pergunta
                            'opcoes_resposta', (
                                SELECT json_agg(
                                    json_build_object(
                                        'valor', o.valor,
                                        'descricao_opcao', o.descricao_opcao
                                    )
                                )
                                FROM bremen_respostas o
                                WHERE o.pergunta_id = p.id
                            )
                        )
                    )
                    FROM (
                        SELECT DISTINCT ON (id) *
                        FROM bremen_perguntas
                        WHERE id_componente = bc.id_componente
                    ) AS p
                )
            )
        )
        FROM bremen_componentes bc
        WHERE bc.id_produto = bi.id_produto
    ),

    'perguntas_gerais', (
        SELECT json_agg(
            json_build_object(
                'id_pergunta', p.id,
                'pergunta', p.nome,
                'tipo', p.tipo,

                'resposta', (
                    SELECT r.valor
                    FROM bremen_respostas r
                    WHERE r.pergunta_id = p.id
                    ORDER BY r.id LIMIT 1
                ),

                'opcoes_resposta', (
                    SELECT json_agg(
                        json_build_object(
                            'valor', o.valor,
                            'descricao_opcao', o.descricao_opcao
                        )
                    )
                    FROM bremen_respostas o
                    WHERE o.pergunta_id = p.id
                )
            )
        )
        FROM (
            SELECT DISTINCT ON (id) *
            FROM bremen_perguntas
            WHERE id_geral = bi.id_produto
        ) AS p
    )
)
FROM bremen_itens bi
WHERE bi.id_produto = 145;

