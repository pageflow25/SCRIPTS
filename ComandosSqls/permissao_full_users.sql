-- Concede ao usuário 'admin' (id=2) permissão de visualização para todos os campos
-- em todas as turmas da unidade escolar de id=2.

INSERT INTO public.permissoes_usuario_campo (
    usuario_id,
    campo_id,
    id_turma,
    id_unidade_escolar,
    pode_visualizar
)
SELECT
    u.usuario_id,            -- cada usuário do array
    cf.id AS campo_id,
    t.id AS id_turma,
    28 AS id_unidade_escolar,
    true AS pode_visualizar
FROM
    public.campos_formulario AS cf
CROSS JOIN
    public.turmas AS t
CROSS JOIN (
    VALUES
        (1),  -- ID do usuário 'admin'
        (2),  -- ID do próximo usuário
        (3),   -- e assim por diante...
        (5) ,  -- e assim por diante...
        (12) ,  -- e assim por diante...
        (16) ,  -- e assim por diante...
        (18)  -- e assim por diante...
) AS u(usuario_id)
WHERE
    t.id_unidade_escolar = 28;
