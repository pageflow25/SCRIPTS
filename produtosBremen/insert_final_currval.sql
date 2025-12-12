BEGIN;

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 86, 'Apostila 75/90g Capa Dura Wire-o (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 222, 'Capa', 86, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 222, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 222, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 223, 'Miolo', 86, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 224, 'Papelão', 86, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 225, 'Guarda', 86, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 86);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 86);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 88, 'Apostila 75/90g Capa Supremo Wire-o (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 230, 'Capa', 88, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 230, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 230, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 231, 'Miolo da Apostila', 88, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 88);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 88);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 112, 'Apostila 120/180g Capa Dura Wire-o (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 287, 'Capa', 112, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 287, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 287, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 288, 'Miolo', 112, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 289, 'Papelão', 112, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 290, 'Guarda', 112, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 112);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 112);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 118, 'Apostila 120/180g Capa Supremo Wire-o (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 305, 'Capa', 118, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 305, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 305, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 306, 'Miolo', 118, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 118);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 118);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 85, 'Apostila 75/90g Capa Dura Espiral (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 218, 'Capa', 85, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 218, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 218, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 219, 'Miolo', 85, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 220, 'Papelão', 85, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 221, 'Guarda', 85, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 85);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 85);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 87, 'Apostila 75/90g Capa Supremo Espiral (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 226, 'Capa', 87, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 226, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 226, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 227, 'Miolo da Apostila', 87, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 87);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 87);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 100, 'Apostila 75/90g Capa PP (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 255, 'Capa PP Frente', 100, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 256, 'Miolo da Apostila', 100, false, true);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 256, 'Cor do Espiral?', 'Opções', 21, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 256, 'Borda de Encadernação?', 'Opções', 37, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 261, 'Capa PP Verso', 100, true, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 101, 'Apostila 75/90g Capa PP + Folha de Rosto Colorida (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 257, 'Capa PP Frente', 101, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 258, 'Miolo da Apostila', 101, false, true);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 258, 'Cor do Espiral?', 'Opções', 21, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 258, 'Borda de Encadernação?', 'Opções', 37, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 259, 'Folha de Rosto', 101, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 260, 'Capa PP Verso', 101, true, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 111, 'Apostila 120/180g Capa Dura Espiral (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 283, 'Capa', 111, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 283, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 283, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 284, 'Miolo', 111, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 285, 'Papelão', 111, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 286, 'Guarda', 111, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 111);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 111);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 115, 'Apostila 120/180g Capa Supremo Espiral (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 299, 'Capa', 115, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 299, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 299, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 300, 'Miolo', 115, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 115);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 115);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 105, 'Apostila 75/90g Capa Dura Wire-o (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 268, 'Capa', 105, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 268, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 268, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 269, 'Miolo', 105, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 270, 'Papelão', 105, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 271, 'Guarda', 105, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 105);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 105);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 104, 'Apostila 75/90g Capa Supremo Wire-o (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 266, 'Capa', 104, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 266, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 266, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 267, 'Miolo da Apostila', 104, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 104);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 104);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 114, 'Apostila 120/180g Capa Dura Wire-o (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 295, 'Capa', 114, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 295, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 295, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 296, 'Miolo', 114, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 297, 'Papelão', 114, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 298, 'Guarda', 114, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 114);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 114);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 117, 'Apostila 120/180g Capa Supremo Wire-o (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 303, 'Capa', 117, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 303, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 303, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 304, 'Miolo', 117, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 117);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 117);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 107, 'Apostila 75/90g Capa Dura Espiral (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 274, 'Capa', 107, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 274, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 274, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 275, 'Miolo', 107, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 276, 'Papelão', 107, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 277, 'Guarda', 107, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 107);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 107);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 106, 'Apostila 75/90g Capa Supremo Espiral (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 272, 'Capa', 106, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 272, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 272, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 273, 'Miolo', 106, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 106);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 106);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 109, 'Apostila 75/90g Capa PP (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 279, 'Capa PP Frente', 109, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 280, 'Miolo', 109, false, true);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 280, 'Cor do Espiral?', 'Opções', 21, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 280, 'Borda de Encadernação?', 'Opções', 37, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 281, 'Capa PP Verso', 109, true, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 113, 'Apostila 120/180g Capa Dura Espiral (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 291, 'Capa', 113, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 291, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 291, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 292, 'Miolo', 113, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 293, 'Papelão', 113, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 294, 'Guarda', 113, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 113);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 113);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 116, 'Apostila 120/180g Capa Supremo Espiral (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 301, 'Capa', 116, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 301, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 301, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 302, 'Miolo', 116, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 116);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 116);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 120, 'Livreto 75/90g C/Capa Supremo (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 309, 'Capa', 120, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 309, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 309, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 310, 'Miolo', 120, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 110, 'Livreto 75/90g S/Capa (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 282, 'Capa + Miolo', 110, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 103, 'Livreto 75/90g C/Capa Colorida (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 263, 'Capa', 103, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 264, 'Miolo', 103, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 121, 'Livreto 120/180g C/Capa Supremo (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 311, 'Capa', 121, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 311, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 311, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 312, 'Miolo', 121, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 125, 'Livreto 120/180g S/Capa (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 319, 'Capa + Miolo', 125, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 144, 'Livreto 120/180g C/Capa Colorida (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 338, 'Capa', 144, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 339, 'Miolo', 144, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 119, 'Livreto 75/90g C/Capa Supremo (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 307, 'Capa', 119, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 307, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 307, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 308, 'Miolo', 119, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 92, 'Livreto 75/90g S/Capa (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 239, 'Capa + Miolo', 92, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 122, 'Livreto 120/180g C/Capa Supremo (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 313, 'Capa', 122, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 313, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 313, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 314, 'Miolo', 122, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 126, 'Livreto 120/180g S/Capa (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 320, 'Capa + Miolo', 126, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 93, 'Prova Simples 75/90g (Miolo PB)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 240, 'Miolo', 93, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 108, 'Prova Simples 75/90g (Miolo Colorido)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 278, 'Miolo', 108, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 89, 'Livro 75/90g Capa Supremo PUR C/ Orelha', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 232, 'Capa', 89, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 232, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 232, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 233, 'Miolo', 89, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 89);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 90, 'Livro 75/90g Capa Supremo PUR S/ Orelha', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 234, 'Capa', 90, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 234, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 234, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 235, 'Miolo', 90, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 90);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 124, 'Livro 120/180g Capa Supremo PUR C/ Orelha', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 317, 'Capa', 124, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 317, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 317, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 318, 'Miolo', 124, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 124);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 123, 'Livro 120/180g Capa Supremo PUR S/ Orelha', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 315, 'Capa', 123, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 315, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 315, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 316, 'Miolo', 123, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 123);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 131, 'Bloco 75/90g (PB SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 325, 'Miolo', 131, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 91, 'Caderno Brochurão 75/90g Capa Dura', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 236, 'Capa', 91, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 236, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 236, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 237, 'Miolo', 91, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 246, 'Papelão', 91, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 247, 'Guarda', 91, false, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 129, 'Avulso Offset 75/90g (PB SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 323, 'Miolo', 129, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 128, 'Avulso Offset 75/90g (Colorido SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 322, 'Miolo', 128, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 134, 'Avulso Offset 120/180g (PB SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 328, 'Miolo', 134, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 133, 'Avulso Offset 120/180g (Colorido SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 327, 'Miolo', 133, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 143, 'Avulso Offset 75/90g - Plastificado (PB SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 337, 'Miolo', 143, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 141, 'Avulso Offset 75/90g - Plastificado (Colorido SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 335, 'Miolo', 141, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 137, 'Avulso Offset 120/180g - Plastificado (PB SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 331, 'Miolo', 137, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 138, 'Avulso Offset 120/180g - Plastificado (Colorido SF)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 332, 'Miolo', 138, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 130, 'Avulso Offset 75/90g (PB FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 324, 'Miolo', 130, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 127, 'Avulso Offset 75/90g (Colorido FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 321, 'Miolo', 127, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 135, 'Avulso Offset 120/180g (PB FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 329, 'Miolo', 135, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 132, 'Avulso Offset 120/180g (Colorido FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 326, 'Miolo', 132, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 142, 'Avulso Offset 75/90g - Plastificado (PB FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 336, 'Miolo', 142, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 140, 'Avulso Offset 75/90g - Plastificado (Colorido FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 334, 'Miolo', 140, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 136, 'Avulso Offset 120/180g - Plastificado (PB FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 330, 'Miolo', 136, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 139, 'Avulso Offset 120/180g - Plastificado (Colorido FV)', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 333, 'Miolo', 139, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 145, 'Apostila 75/90g Capa Dura Wire-o (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 340, 'Capa', 145, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 340, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 340, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 341, 'Miolo', 145, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 342, 'Papelão', 145, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 343, 'Guarda', 145, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 145);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 145);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 146, 'Apostila 75/90g Capa Supremo Wire-o (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 344, 'Capa', 146, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 344, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 344, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 345, 'Miolo da Apostila', 146, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 146);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 146);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 147, 'Apostila 120/180g Capa Dura Wire-o (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 346, 'Capa', 147, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 346, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 346, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 347, 'Miolo', 147, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 348, 'Papelão', 147, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 349, 'Guarda', 147, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 147);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 147);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 148, 'Apostila 120/180g Capa Supremo Wire-o (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 350, 'Capa', 148, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 350, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 350, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 351, 'Miolo', 148, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 148);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 148);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 149, 'Apostila 75/90g Capa Dura Espiral (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 352, 'Capa', 149, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 352, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 352, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 353, 'Miolo', 149, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 354, 'Papelão', 149, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 355, 'Guarda', 149, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 149);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 149);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 150, 'Apostila 75/90g Capa Supremo Espiral (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 356, 'Capa', 150, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 356, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 356, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 357, 'Miolo da Apostila', 150, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 150);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 150);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 151, 'Apostila 75/90g Capa PP (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 358, 'Capa PP Frente', 151, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 359, 'Miolo da Apostila', 151, false, true);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 359, 'Cor do Espiral?', 'Opções', 21, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 359, 'Borda de Encadernação?', 'Opções', 37, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 360, 'Capa PP Verso', 151, true, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 152, 'Apostila 75/90g Capa PP + Folha de Rosto Colorida (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 361, 'Capa PP Frente', 152, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 362, 'Miolo da Apostila', 152, false, true);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 362, 'Cor do Espiral?', 'Opções', 21, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 362, 'Borda de Encadernação?', 'Opções', 37, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 363, 'Folha de Rosto', 152, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 364, 'Capa PP Verso', 152, true, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 155, 'Apostila 120/180g Capa Dura Espiral (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 373, 'Capa', 155, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 373, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 373, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 374, 'Miolo', 155, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 375, 'Papelão', 155, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 376, 'Guarda', 155, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 155);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 155);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 156, 'Apostila 120/180g Capa Supremo Espiral (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 377, 'Capa', 156, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 377, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 377, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 378, 'Miolo', 156, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 156);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 156);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 157, 'Apostila 75/90g Capa Dura Wire-o (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 379, 'Capa', 157, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 379, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 379, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 380, 'Miolo', 157, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 381, 'Papelão', 157, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 382, 'Guarda', 157, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 157);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 157);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 158, 'Apostila 75/90g Capa Supremo Wire-o (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 383, 'Capa', 158, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 383, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 383, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 384, 'Miolo da Apostila', 158, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 158);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 158);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 159, 'Apostila 120/180g Capa Dura Wire-o (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 385, 'Capa', 159, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 385, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 385, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 386, 'Miolo', 159, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 387, 'Papelão', 159, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 388, 'Guarda', 159, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 159);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 159);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 160, 'Apostila 120/180g Capa Supremo Wire-o (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 389, 'Capa', 160, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 389, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 389, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 390, 'Miolo', 160, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 160);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Wire-o?', 'Opções', 0, 160);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Branco');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Prata');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 161, 'Apostila 75/90g Capa Dura Espiral (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 391, 'Capa', 161, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 391, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 391, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 392, 'Miolo', 161, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 393, 'Papelão', 161, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 394, 'Guarda', 161, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 161);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 161);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 162, 'Apostila 75/90g Capa Supremo Espiral (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 395, 'Capa', 162, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 395, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 395, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 396, 'Miolo', 162, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 162);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 162);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 163, 'Apostila 75/90g Capa PP (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 397, 'Capa PP Frente', 163, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 398, 'Miolo', 163, false, true);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 398, 'Cor do Espiral?', 'Opções', 21, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 398, 'Borda de Encadernação?', 'Opções', 37, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 399, 'Capa PP Verso', 163, true, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 164, 'Apostila 120/180g Capa Dura Espiral (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 400, 'Capa', 164, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 400, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 400, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 401, 'Miolo', 164, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 402, 'Papelão', 164, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 403, 'Guarda', 164, false, false);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 164);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 164);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 165, 'Apostila 120/180g Capa Supremo Espiral (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 404, 'Capa', 165, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 404, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 404, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 405, 'Miolo', 165, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Cor do Espiral?', 'Opções', 0, 165);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Preto');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'I', 0, 'Incolor');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'C', 0, 'Branco');
                        

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Borda de Encadernação?', 'Opções', 0, 165);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Borda Maior');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Borda Menor');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 166, 'Livreto 75/90g C/Capa Supremo (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 406, 'Capa', 166, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 406, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 406, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 407, 'Miolo', 166, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 167, 'Livreto 75/90g S/Capa (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 408, 'Capa + Miolo', 167, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 168, 'Livreto 75/90g C/Capa Colorida (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 409, 'Capa', 168, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 410, 'Miolo', 168, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 169, 'Livreto 120/180g C/Capa Supremo (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 411, 'Capa', 169, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 411, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 411, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 412, 'Miolo', 169, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 170, 'Livreto 120/180g S/Capa (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 413, 'Capa + Miolo', 170, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 171, 'Livreto 120/180g C/Capa Colorida (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 414, 'Capa', 171, true, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 415, 'Miolo', 171, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 172, 'Livreto 75/90g C/Capa Supremo (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 416, 'Capa', 172, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 416, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 416, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 417, 'Miolo', 172, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 173, 'Livreto 75/90g S/Capa (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 418, 'Capa + Miolo', 173, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 174, 'Livreto 120/180g C/Capa Supremo (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 419, 'Capa', 174, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 419, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 419, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 420, 'Miolo', 174, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 175, 'Livreto 120/180g S/Capa (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 421, 'Capa + Miolo', 175, true, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 176, 'Prova Simples 75/90g (Miolo PB) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 422, 'Miolo', 176, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 177, 'Prova Simples 75/90g (Miolo Colorido) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 423, 'Miolo', 177, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 178, 'Livro 75/90g Capa Supremo PUR C/ Orelha - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 424, 'Capa', 178, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 424, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 424, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 425, 'Miolo', 178, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 178);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 179, 'Livro 75/90g Capa Supremo PUR S/ Orelha - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 426, 'Capa', 179, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 426, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 426, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 427, 'Miolo', 179, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 179);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 180, 'Livro 120/180g Capa Supremo PUR C/ Orelha - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 428, 'Capa', 180, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 428, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 428, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 429, 'Miolo', 180, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 180);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 181, 'Livro 120/180g Capa Supremo PUR S/ Orelha - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 430, 'Capa', 181, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 430, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 430, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 431, 'Miolo', 181, false, true);
                    

                    INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                    VALUES (nextval('bremen_perguntas_id_seq'::regclass), NULL, 'Orelha ?', 'Opções', 0, 181);
                    

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '1', 0, 'Com Orelha');
                        

                        INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                        VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), '2', 0, 'Sem Orelha');
                        

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 182, 'Bloco 75/90g (PB SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 432, 'Miolo', 182, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 183, 'Caderno Brochurão 75/90g Capa Dura - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 433, 'Capa', 183, true, false);
                    

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 433, 'Laminação ?', 'Opções', 3, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'FV', 0, 'Frente/Verso');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Frente');
                            

                        INSERT INTO public.bremen_perguntas (id, id_componente, nome, tipo, id_pergunta, id_geral)
                        VALUES (nextval('bremen_perguntas_id_seq'::regclass), 433, 'Tipo BOPP?', 'Opções', 4, NULL);
                        

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'B', 0, 'Brilho');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'F', 0, 'Fosco');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'P', 0, 'Prata');
                            

                            INSERT INTO public.bremen_respostas (id, pergunta_id, valor, id_resposta, descricao_opcao)
                            VALUES (nextval('bremen_respostas_id_seq'::regclass), currval('bremen_perguntas_id_seq'::regclass), 'S', 0, 'Soft Touch');
                            

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 434, 'Miolo', 183, false, true);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 435, 'Papelão', 183, false, false);
                    

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 436, 'Guarda', 183, false, false);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 184, 'Avulso Offset 75/90g (PB SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 437, 'Miolo', 184, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 185, 'Avulso Offset 75/90g (Colorido SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 438, 'Miolo', 185, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 186, 'Avulso Offset 120/180g (PB SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 439, 'Miolo', 186, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 187, 'Avulso Offset 120/180g (Colorido SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 440, 'Miolo', 187, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 188, 'Avulso Offset 75/90g - Plastificado (PB SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 441, 'Miolo', 188, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 189, 'Avulso Offset 75/90g - Plastificado (Colorido SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 442, 'Miolo', 189, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 190, 'Avulso Offset 120/180g - Plastificado (PB SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 443, 'Miolo', 190, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 191, 'Avulso Offset 120/180g - Plastificado (Colorido SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 444, 'Miolo', 191, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 192, 'Avulso Offset 75/90g (PB FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 445, 'Miolo', 192, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 193, 'Avulso Offset 75/90g (Colorido FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 446, 'Miolo', 193, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 194, 'Avulso Offset 120/180g (PB FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 447, 'Miolo', 194, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 195, 'Avulso Offset 120/180g (Colorido FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 448, 'Miolo', 195, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 196, 'Avulso Offset 75/90g - Plastificado (PB FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 449, 'Miolo', 196, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 197, 'Avulso Offset 75/90g - Plastificado (Colorido FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 450, 'Miolo', 197, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 198, 'Avulso Offset 120/180g - Plastificado (PB FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 451, 'Miolo', 198, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 199, 'Avulso Offset 120/180g - Plastificado (Colorido FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 452, 'Miolo', 199, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 202, 'Avulso Couchê (Colorido SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 456, 'Miolo', 202, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 203, 'Avulso Couchê (Colorido FV) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 457, 'Miolo', 203, false, true);
                    

                INSERT INTO public.bremen_itens (id, id_produto, descricao, "categoria_Prod", sub_grupo)
                VALUES (nextval('bremen_itens_id_seq'::regclass), 204, 'Avulso Adesivo 173g (Colorido SF) - Conveniado', '', '');
                

                    INSERT INTO public.bremen_componentes (id, id_componente, descricao, id_produto, is_capa, is_miolo)
                    VALUES (nextval('bremen_componentes_id_seq'::regclass), 458, 'Miolo', 204, false, true);
                    
COMMIT;