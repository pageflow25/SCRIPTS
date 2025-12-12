INSERT INTO public.permissoes_usuario_campo 
(id, usuario_id, campo_id, id_turma, id_unidade_escolar, pode_visualizar)
SELECT 
    nextval('permissoes_usuario_campo_id_seq'::regclass), 
    33,      -- TROQUE PELO ID DO USUÁRIO
    NULL,               -- campo_id
    gs,                 -- O valor da série (22 ao 46) entra aqui no id_turma
    238,                -- id_unidade_escolar
    true                -- pode_visualizar
FROM generate_series(22, 46) AS gs;
