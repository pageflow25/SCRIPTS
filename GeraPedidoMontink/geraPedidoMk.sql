SELECT 
    p.id, 
    p.etiqueta_envio, 
    pp.nome ,
    pp.arquivo_pdf,
    pp.design_capa_frente,
    pp.design_capa_verso,
    pp.mockup_capa_frente,
    pp.mockup_capa_costas, 
    pp.descricao 
FROM pedidos p
INNER JOIN pedido_produtos pp 
    ON p.id = pp.pedido_id
WHERE p.id IN (969,970,971);
