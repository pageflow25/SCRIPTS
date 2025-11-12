SELECT
  f.id AS formulario_id,
  f.nome AS responsavel_nome,
  f.tipo_formulario,
  f.titulo,
  -- INÍCIO DA ALTERAÇÃO --
  CASE 
    WHEN f.status_formulario_id = 2 THEN 'pedido recebido'
    when f.status_formulario_id = 5 THEN 'pedido cancelado'
    when f.status_formulario_id = 4 THEN 'pedido teste'
    ELSE CAST(f.status_formulario_id AS CHAR) -- Converte os outros IDs para texto para não dar erro
  END AS status_formulario_id,
  -- FIM DA ALTERAÇÃO --
  f.criado_em,
  ap.nome AS nome_pdf,
  ap.paginas,
  ef.formato_final,
  ef.gramatura,
  ef.cor_impressao,
  ef.impressao,
  ef.acabamento,
  ue.nome AS unidade,
  d.quantidade
FROM formularios f
LEFT JOIN arquivo_pdfs ap ON ap.formulario_id = f.id
LEFT JOIN especificacoes_form ef ON ef.id = ap.item_pedido_id
LEFT JOIN distribuicao_materiais d ON d.arquivo_pdf_id = ap.id
LEFT JOIN unidades_escolares ue ON ue.id = d.unidade_escolar_id
WHERE f.id IN 
(184,179,181,205,146,201,174,144,170,192,176,169,168,175,180,158,156,197,155,195,127,207,199,128,126,194,173,149,200,189,161,121,188,152,206,153,157,147,202,196,183,150,193,187,208,191,160,159,172,122,186,154,198,212,177,182,204,185,171,178,145,148,129,203,151)
ORDER BY ap.id, ue.nome