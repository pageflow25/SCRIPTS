-- GERA RELATORIO

SELECT
    f.id AS formulario_id,
    f.nome AS responsavel_nome,
    f.email AS responsavel_email,
    f.tipo_formulario,
    f.titulo,
    f.data_saida,
    ap.id AS pdf_id,
    ap.nome AS nome_pdf,
    ap.tipo_arquivo,
    ap.tamanho,
    ap.paginas,
    ap.dimensao,
    ap.pares AS par_id,
    ef.formato_final,
    ef.gramatura,
    ef.cor_impressao,
    ef.impressao,
    ef.grampos,
    ue.nome AS unidade,
    d.quantidade
FROM formularios f
LEFT JOIN arquivo_pdfs ap ON ap.formulario_id = f.id
LEFT JOIN especificacoes_form ef ON ef.id = ap.item_pedido_id
LEFT JOIN distribuicao_materiais d ON d.arquivo_pdf_id = ap.id
LEFT JOIN unidades_escolares ue ON ue.id = d.unidade_escolar_id
WHERE f.id IN (98, 97, 96, 95, 94, 93, 92, 91, 90, 89, 88, 87, 86)
ORDER BY ap.id, ue.nome;