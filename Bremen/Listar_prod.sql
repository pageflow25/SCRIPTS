SELECT 
    table_name, 
    column_name
FROM information_schema.columns
WHERE table_name IN (
    'modmodeloproduto',
    'modcomponente',
    'modcomponentegraf',
    'modcomponentegrafmedida',
    'estitemestoquesubstrato',
    'estitemestoque',
    'grupoitemestoque',
    'estitemsubstratoimpressao',
    'modtarefaauxiliar',
    'modtarefaauxiliarcomponente',
    'tartarefaauxiliar',
    'tartarefa'
)
ORDER BY table_name, ordinal_position;


select * from caracteristicaproduto;

SELECT id, idmodmodeloproduto, data_alteracao, user_alteracao, descricao, fatorcomponente, quantidademodelos, observacaocomponente, idtipocomponente, quantidadepaginas, idcomponentebase
FROM wingraph50.modcomponente;

SELECT id, data_alteracao, user_alteracao, descricao, apelido, desativado, percmargemlucro, percmargemlucrominima, usarlistapreco, usarfsc, unidademedida, ididentificadorop1, ididentificadorop2, idtipoprodutofsc, idqualidadeperfil, observacao, idregracalcdescricaoautomatica, idregracalcvalidacaogeral, unidadenegociacaocomercial, unidadeorcamento, tipovariacaocomissao, codexterno, considerarmargemlucrominmodelo, ncm, idncmexcecao, publicacaoobrigatoria, idmodeloprodutoorigem, datacadastro, altura, largura, comprimento, idgrupoitemestoque, qtdiasprazoentrega, disponivelapiclientes, disponivelapivendedores, fatornegociacao
FROM wingraph50.modmodeloproduto;


SELECT 
    c.id AS id_componente,
    c.idmodmodeloproduto,
    c.data_alteracao AS data_alteracao_componente,
    c.user_alteracao AS user_alteracao_componente,
    c.descricao AS descricao_componente,
    c.fatorcomponente,
    c.quantidademodelos,
    c.observacaocomponente,
    c.idtipocomponente,
    c.quantidadepaginas,
    c.idcomponentebase,
    m.id AS id_modelo,
    m.data_alteracao AS data_alteracao_modelo,
    m.user_alteracao AS user_alteracao_modelo,
    m.descricao AS descricao_modelo,
    m.apelido,
    m.desativado,
    m.percmargemlucro,
    m.percmargemlucrominima,
    m.usarlistapreco,
    m.usarfsc,
    m.unidademedida,
    m.ididentificadorop1,
    m.ididentificadorop2,
    m.idtipoprodutofsc,
    m.idqualidadeperfil,
    m.observacao,
    m.idregracalcdescricaoautomatica,
    m.idregracalcvalidacaogeral,
    m.unidadenegociacaocomercial,
    m.unidadeorcamento,
    m.tipovariacaocomissao,
    m.codexterno,
    m.considerarmargemlucrominmodelo,
    m.ncm,
    m.idncmexcecao,
    m.publicacaoobrigatoria,
    m.idmodeloprodutoorigem,
    m.datacadastro,
    m.altura,
    m.largura,
    m.comprimento,
    m.idgrupoitemestoque,
    m.qtdiasprazoentrega,
    m.disponivelapiclientes,
    m.disponivelapivendedores,
    m.fatornegociacao
FROM wingraph50.modcomponente c
JOIN wingraph50.modmodeloproduto m
    ON c.idmodmodeloproduto = m.id;




SELECT id, idestitemestoquesubstrato, data_alteracao, user_alteracao, tiposubstrato, fatorabsorcao, gramatura, espessura, unidadeperda, facesdiferentes, medidarefile, medidalargurafolha, medidaalturafolha, perccobrarfolhainteira, unidadelargurabobina, largurabobina, qtdmetrosbobina, peraprovimpressosmaiorquefolha, fatorconversaokg, bobinapermitelargurasmenores, microondulado, medidabordabobina, codigo_dif
FROM wingraph50.estitemsubstratoimpressao;
