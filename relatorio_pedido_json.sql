WITH formulario_base AS (
    SELECT
        f.id,
        f.nome,
        f.email,
        f.tipo_formulario,
        f.titulo,
        f.data_entrega,
        f.observacoes
    FROM formularios f
    WHERE f.id IN (78, 79)   -- <<< aqui você pode colocar mais de um id
),
pdfs AS (
    SELECT
        ap.id,
        ap.formulario_id,
        ap.nome AS nome_item,
        ap.tamanho,
        ap.paginas,
        ap.dimensao,
        ap.tipo_arquivo AS categoria,
        ap.pares AS par_id,
        jsonb_build_object(
            'formatoFinal', ef.formato_final,
            'gramatura', ef.gramatura,
            'corImpressao', ef.cor_impressao,
            'impressao', ef.impressao,
            'grampos', ef.grampos
        ) AS especificacoes,
        (
            SELECT jsonb_agg(
                jsonb_build_object(
                    'unidade', ue.nome,
                    'quantidade', d.quantidade
                )
            )
            FROM distribuicao_materiais d
            LEFT JOIN unidades_escolares ue ON ue.id = d.unidade_escolar_id
            WHERE d.arquivo_pdf_id = ap.id
        ) AS distribuicaoPorUnidade,
        (
            SELECT COALESCE(SUM(d.quantidade), 0)
            FROM distribuicao_materiais d
            WHERE d.arquivo_pdf_id = ap.id
        ) AS quantidade,
        ap.criado_em
    FROM arquivo_pdfs ap
    LEFT JOIN especificacoes_form ef ON ef.id = ap.item_pedido_id
    WHERE ap.formulario_id IN (78, 79)   -- <<< idem
)
SELECT jsonb_build_object(
    'pdf_info', (
        SELECT jsonb_build_object(
            'nome_arquivo', p.nome_item,
            'tipo_arquivo', p.categoria,
            'tamanho', p.tamanho,
            'paginas', p.paginas,
            'data_upload', p.criado_em,
            'par_id', p.par_id
        )
        FROM pdfs p
        ORDER BY p.criado_em ASC
        LIMIT 1
    ),
    'formulario_dados', jsonb_build_object(
        'nome', fb.nome,
        'email', fb.email,
        'tipo_formulario', fb.tipo_formulario,
        'titulo', fb.titulo,
        'dataEntrega', fb.data_entrega,
        'observacoes', fb.observacoes,
        'origemDados', 'excel',
        'pdfs', (
            SELECT jsonb_agg(
                jsonb_build_object(
                    'nome_item', p.nome_item,
                    'size', p.tamanho,
                    'paginas', p.paginas,
                    'dimensao', p.dimensao,
                    'categoria', p.categoria,
                    'parId', p.par_id,
                    'especificacoes', p.especificacoes,
                    'distribuicaoPorUnidade', p.distribuicaoPorUnidade,
                    'quantidade', p.quantidade,
                    'file', '{}'::jsonb
                )
            )
            FROM pdfs p
            WHERE p.formulario_id = fb.id
        )
    ),
    'especificacoes_arquivo', jsonb_build_object(
        'formatoFinalArquivo', '',
        'tipoPapel', '',
        'corImpressao', '',
        'tipoCapa', '',
        'acabamento', '',
        'laminacao', ''
    )
) AS resultado
FROM formulario_base fb;
