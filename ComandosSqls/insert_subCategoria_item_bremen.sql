UPDATE public.bremen_itens AS t
SET sub_grupo = v.sub_grupo
FROM (VALUES
    -- APOSTILAS WIRE-O
    (88, 'Wire-o'), (112, 'Wire-o'), (105, 'Wire-o'), (114, 'Wire-o'), 
    (117, 'Wire-o'), (86, 'Wire-o'), (118, 'Wire-o'), (104, 'Wire-o'), 
    (145, 'Wire-o'), (146, 'Wire-o'), (147, 'Wire-o'), (148, 'Wire-o'), 
    (157, 'Wire-o'), (158, 'Wire-o'), (159, 'Wire-o'), (160, 'Wire-o'),

    -- APOSTILAS ESPIRAL
    (85, 'Espiral'), (87, 'Espiral'), (111, 'Espiral'), (115, 'Espiral'), 
    (107, 'Espiral'), (106, 'Espiral'), (113, 'Espiral'), (116, 'Espiral'), 
    (149, 'Espiral'), (150, 'Espiral'), (155, 'Espiral'), (156, 'Espiral'), 
    (161, 'Espiral'), (162, 'Espiral'), (164, 'Espiral'), (165, 'Espiral'),

    -- APOSTILAS CAPA PP
    (100, 'Encadernação PP'), (101, 'Encadernação PP'), (109, 'Encadernação PP'), 
    (151, 'Encadernação PP'), (152, 'Encadernação PP'), (163, 'Encadernação PP'),

    -- LIVROS (PUR)
    (89, 'PUR c/ Orelha'), (178, 'PUR c/ Orelha'), (180, 'PUR c/ Orelha'), (124, 'PUR c/ Orelha'),
    (90, 'PUR s/ Orelha'), (179, 'PUR s/ Orelha'), (181, 'PUR s/ Orelha'), (123, 'PUR s/ Orelha'),

    -- LIVRETOS
    (120, 'Livreto c/ Capa'), (121, 'Livreto c/ Capa'), (144, 'Livreto c/ Capa'), 
    (119, 'Livreto c/ Capa'), (122, 'Livreto c/ Capa'), (103, 'Livreto c/ Capa'),
    (166, 'Livreto c/ Capa'), (168, 'Livreto c/ Capa'), (169, 'Livreto c/ Capa'), 
    (171, 'Livreto c/ Capa'), (172, 'Livreto c/ Capa'), (174, 'Livreto c/ Capa'),

    (110, 'Livreto s/ Capa'), (125, 'Livreto s/ Capa'), (92, 'Livreto s/ Capa'), 
    (126, 'Livreto s/ Capa'), (167, 'Livreto s/ Capa'), (170, 'Livreto s/ Capa'), 
    (173, 'Livreto s/ Capa'), (175, 'Livreto s/ Capa'),

    -- PROVAS
    (93, 'Grampo/Simples'), (108, 'Grampo/Simples'), (176, 'Grampo/Simples'), (177, 'Grampo/Simples'),

    -- OUTROS (BLOCO E CADERNO)
    (131, 'Blocagem'), (182, 'Blocagem'),
    (91, 'Brochura'), (183, 'Brochura'),

    -- AVULSOS (COUCHÊ E ADESIVO)
    (202, 'Papel Couchê'), (203, 'Papel Couchê'),
    (204, 'Adesivo'),

    -- AVULSOS PLASTIFICADOS
    (143, 'Plastificado'), (141, 'Plastificado'), (137, 'Plastificado'), (138, 'Plastificado'),
    (142, 'Plastificado'), (140, 'Plastificado'), (136, 'Plastificado'), (139, 'Plastificado'),
    (188, 'Plastificado'), (189, 'Plastificado'), (190, 'Plastificado'), (191, 'Plastificado'),
    (196, 'Plastificado'), (197, 'Plastificado'), (198, 'Plastificado'), (199, 'Plastificado'),

    -- AVULSOS OFFSET (PADRÃO)
    (129, 'Papel Offset'), (128, 'Papel Offset'), (133, 'Papel Offset'), (134, 'Papel Offset'),
    (130, 'Papel Offset'), (127, 'Papel Offset'), (135, 'Papel Offset'), (132, 'Papel Offset'),
    (184, 'Papel Offset'), (185, 'Papel Offset'), (186, 'Papel Offset'), (187, 'Papel Offset'),
    (192, 'Papel Offset'), (193, 'Papel Offset'), (194, 'Papel Offset'), (195, 'Papel Offset')

) AS v(id_produto, sub_grupo)
WHERE t.id_produto = v.id_produto;
