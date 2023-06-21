SELECT *
FROM Siasgnet_irp_VBL.irp 					i
	JOIN Siasgnet_irp_VBL.irpitem 			ii ON ii.codigoirp = i.codigoirp
	JOIN Siasgnet_irp_VBL.minteresseitem 	mi ON ii.codigoirpitem = mi.codigoirpitem
--	JOIN Siasgnet_irp_VBL.catalogoitem		ci ON ii.codigocatitem = ci.codigocatitem
WHERE i.numeroirp LIKE '201057%';
______________________________________________________________________________________

SELECT DISTINCT l.codigolicitacaosrp,numeroirp,anoirp,numerolicitacao,anolicitacao,codigomodalidadecompra,modalidadecompradetalhada,numeroprocesso,objeto,quantidadeitensincluidos,codigosituacaolicitacao,situacaolicitacaodetalhada,numerouasggerenciadora,numerouasgorigem,numerouasgorigemirp,codigotipoevento,comcontagemprazo,motivoevento,numeroversaolicitacao,compranacional --,internacional,contratacaompsetic,codigomododisputa
FROM Siasgnet_atasrp_VBL.licitacaosrp l
JOIN Siasgnet_atasrp_VBL.itematasrp i ON i.codigolicitacaosrp = l.codigolicitacaosrp
JOIN Siasgnet_atasrp_VBL.fornecedor f ON f.codigoitematasrp = i.codigoitematasrp
WHERE l.anoirp >= '2018'

SELECT DISTINCT i.codigolicitacaosrp,i.codigoitematasrp,codigoitemcatalogo,descricao,descricaodetalhada,numeroitem,quantidademaximaparaadesoes,quantidadepublicada,quantidadeaguardautorizacao,quantidadeautorizada,dataassinaturaata,datafimvigenciaata,datainiciovigenciaata,codigosituacaoitem,codigotipoitem,unidadefornecimento, codigofornecedor,classificacao,identificacao,marca,nomerazaosocial,quantidadehomologada,valorhomologadounitario,valorrenegociadounitario,valido --,itemreferesetic,servicovinculadobemsetic,tipoobjetoitem,criteriovalor,tiporeducao,valorcaratersigiloso
FROM Siasgnet_atasrp_VBL.itematasrp i
JOIN Siasgnet_atasrp_VBL.fornecedor f ON i.codigoitematasrp = f.codigoitematasrp
JOIN Siasgnet_atasrp_VBL.licitacaosrp l ON l.codigolicitacaosrp = i.codigolicitacaosrp
WHERE l.anoirp >= '2018' AND classificacao = 1 AND valido = 'T'

SELECT DISTINCT l.codigolicitacaosrp,l.numeroirp,anoirp,numerolicitacao,anolicitacao,codigomodalidadecompra,modalidadecompradetalhada,numeroprocesso,objeto,quantidadeitensincluidos,codigosituacaolicitacao,situacaolicitacaodetalhada,numerouasggerenciadora,numerouasgorigem,numerouasgorigemirp,codigoirp,codigolicmod,codigolictipo,codigoirpsit,datainclusao,dataalteracao,datacancelamentoirp,municipiouasg,descricaoobjeto,numerouasg --,internacional,contratacaompsetic,codigomododisputa,l.compranacional,codigotipoevento,comcontagemprazo,motivoevento,numeroversaolicitacao
FROM Siasgnet_atasrp_VBL.licitacaosrp l
JOIN Siasgnet_atasrp_VBL.itematasrp i ON i.codigolicitacaosrp = l.codigolicitacaosrp
JOIN Siasgnet_atasrp_VBL.fornecedor f ON f.codigoitematasrp = i.codigoitematasrp
LEFT JOIN Siasgnet_irp_VBL.irp irp ON UPPER(irp.numeroirp) = UPPER(l.numerouasgorigemirp||l.anoirp||l.numeroirp) 
WHERE l.anoirp >= '2018'

SELECT codigoirpitem,codigoirp,codigocritjulg,codigoirpitemsit,codigocatitem,valorestimado,numeroordemitem,datainclusao,unidadefornecimento,descricaodetalhada,tipoobjetoitem,criteriovalor,valorcaratersigiloso -- usuarioinclusao,usuarioalteracao,datalimiteenvio,servicovinculadobemsetic,itemreferesetic,ajuste,dataalteracao,avisointeresseenviado,descricaocomplementar,itemsustentavel,
FROM Siasgnet_irp_VBL.irpitem
WHERE datainclusao BETWEEN '2019-00-00 00:00:00' AND '2020-00-00 00:00:00'
ORDER BY codigoirpitem DESC;

SELECT codigomiitem,codigomi,codigoirpitem,codigomiitemsit,valorunitarioestimado,datainclusao -- dataalteracao,aceitealteracao,descricaoproposta,usuarioinclusao,usuarioalteracao,
FROM Siasgnet_irp_VBL.minteresseitem
WHERE datainclusao > '2018-00-00 00:00:00'
ORDER BY datainclusao DESC;

SELECT codigocatitem,tipo,categoria,codigo,siglaunidadefornecimento,siglaunidademedida,capacidadeunidadefornecimento,nomeunidadefornecimento,unidademedida,codigogrupo,codigoclassematerial,codigoitemmaterial,nome,descricao,nomeunidademedida,datahoraregistro
FROM Siasgnet_irp_VBL.catalogoitem
WHERE datahoraregistro > '2018-00-00 00:00:00'
ORDER BY datahoraregistro DESC;
______________________________________________________________________________________


SELECT mi.codigomiitem,codigomi,codigoirpitem,quantidade,valorunitarioestimado,mi.datainclusao -- dataalteracao,aceitealteracao,descricaoproposta,usuarioinclusao,usuarioalteracao,
FROM Siasgnet_irp_VBL.minteresseitem mi
JOIN Siasgnet_irp_VBL.minteresseitemmentrega mie ON mi.codigomiitem = mie.codigomiitem
JOIN 
WHERE mi.datainclusao > '2018-00-00 00:00:00'
ORDER BY mi.datainclusao DESC;




SELECT ii.datainclusao,ii.codigoirp,ii.codigoirpitem,mi.codigomi,mi.codigomiitem,i.numerouasg uasggeren,numerouasgorigemirp uasgorig, i.numerouasg=numerouasgorigemirp ,m.numerouasg uasgmi,ie.quantidade quantidadegeren,mie.quantidade quantidadelocal,valorestimado,quantidadehomologada,valorhomologadounitario,valorrenegociadounitario,numeroordemitem,ia.unidadefornecimento,ii.unidadefornecimento,codigocatitem,ia.descricao pdm,ia.descricaodetalhada,ii.descricaodetalhada 
FROM Siasgnet_irp_VBL.irpitem 					ii
JOIN Siasgnet_irp_VBL.irpitemmentrega			ie	ON ie.codigoirpitem = ii.codigoirpitem
JOIN Siasgnet_irp_VBL.minteresseitem 			mi 	ON mi.codigoirpitem = ii.codigoirpitem
JOIN Siasgnet_irp_VBL.minteresseitemmentrega 	mie ON mie.codigomiitem = mi.codigomiitem
JOIN Siasgnet_irp_VBL.minteresse 				m 	ON m.codigomi = mi.codigomi
JOIN Siasgnet_irp_VBL.irp 						i 	ON i.codigoirp = ii.codigoirp
JOIN Siasgnet_atasrp_VBL.licitacaosrp 			l 	ON UPPER(numerouasgorigem||anoirp||l.numeroirp) = UPPER(i.numeroirp)
JOIN Siasgnet_atasrp_VBL.itematasrp 			ia 	ON UPPER(ia.codigolicitacaosrp||ia.numeroitem) = UPPER(l.codigolicitacaosrp||ii.numeroordemitem)
JOIN Siasgnet_atasrp_VBL.fornecedor 			f 	ON f.codigoitematasrp = ia.codigoitematasrp
WHERE ii.datainclusao BETWEEN '2021-00-00 00:00:00' AND '2022-00-00 00:00:00' AND classificacao = 1 AND valido = 'T' AND mi.codigomiitemsit = 3
--ORDER BY ii.datainclusao DESC;

_______________________________________________________

SELECT DISTINCT 
	ii.datainclusao,i.numeroirp||LPAD(ii.numeroordemitem,5,0) codirpitem,
	ii.numeroordemitem numeroordemitem,
	i.numerouasg uasggeren,
	COUNT(DISTINCT ie.numerouasg) contagerenpartic,
	SUM(CASE WHEN ie.numerouasg = i.numerouasg THEN ie.quantidade END) + 0 quantgeren,
	SUM(ie.quantidade) quanttotal,
	SUM(ie.quantidade)/SUM(CASE WHEN ie.numerouasg = i.numerouasg THEN ie.quantidade END) + 0 razaoquant,
	f.quantidadehomologada quanthomolog,
	ii.valorestimado valorunitgeren,
	f.valorhomologadounitario valorunithomol,
	(ii.valorestimado-f.valorhomologadounitario)/ii.valorestimado valorreducperc,
	ii.unidadefornecimento unidadefornec,
	ii.codigocatitem codigocatitem,
	ii.descricaodetalhada descricaodetal
FROM Siasgnet_irp_VBL.irpitem ii
	JOIN Siasgnet_irp_VBL.irpitemmentrega ie ON ie.codigoirpitem = ii.codigoirpitem
	JOIN Siasgnet_irp_VBL.minteresseitem mi ON mi.codigoirpitem = ii.codigoirpitem
	JOIN Siasgnet_irp_VBL.minteresse m ON m.codigomi = mi.codigomi
	JOIN Siasgnet_irp_VBL.irp i ON i.codigoirp = ii.codigoirp
	JOIN Siasgnet_atasrp_VBL.licitacaosrp l ON UPPER(l.numerouasggerenciadora||l.anoirp||l.numeroirp) = i.numeroirp
	JOIN Siasgnet_atasrp_VBL.itematasrp ia ON UPPER(ia.codigolicitacaosrp||ia.numeroitem) = UPPER(l.codigolicitacaosrp||ii.numeroordemitem) --ia.codigolicitacaosrp = l.codigolicitacaosrp AND ia.numeroitem = ii.numeroordemitem
	JOIN Siasgnet_atasrp_VBL.fornecedor f ON f.codigoitematasrp = ia.codigoitematasrp
WHERE ii.datainclusao > '2021-00-00 00:00:00' 
	AND codigoirpsit = 6 
	AND mi.codigomiitemsit = 3
	AND f.valido = 'T'
	AND f.classificacao = 1
GROUP BY
	ii.datainclusao,
	i.numeroirp,
	ii.numeroordemitem,
	ii.codigoirp,
	ii.codigoirpitem,
	ii.numeroordemitem,
	i.numerouasg,
	ii.valorestimado,
	m.numerouasg,
	ii.unidadefornecimento,
	ii.codigocatitem,
	ii.descricaodetalhada,
	ii.descricaocomplementar,
	ia.numeroitem,
	f.quantidadehomologada,
	f.valorhomologadounitario,
	l.numerouasggerenciadora,
	l.anoirp,
	l.numeroirp;


SELECT l.codigolicitacaosrp,numerouasggerenciadora,numerouasgorigem,numerouasgorigemirp,anoirp,numeroirp,anolicitacao,numerolicitacao,codigomodalidadecompra,quantidadeitensincluidos,codigosituacaolicitacao,situacaolicitacaodetalhada,quantidadehomologada,valorhomologadounitario,valorrenegociadounitario,numeroitem,ia.unidadefornecimento,ia.descricao,ia.descricaodetalhada 
FROM Siasgnet_atasrp_VBL.licitacaosrp  	l
JOIN Siasgnet_atasrp_VBL.itematasrp 			ia 	ON ia.codigolicitacaosrp = l.codigolicitacaosrp
JOIN Siasgnet_atasrp_VBL.fornecedor 			f 	ON f.codigoitematasrp = ia.codigoitematasrp
WHERE anoirp >= '2021' AND classificacao = 1 AND valido = 'T'





SELECT numerouasgorigemirp||anoirp||l.numeroirp
FROM 



SELECT DISTINCT codigoirp,codigolicmod,codigolictipo,codigoirpsit,datainclusao,dataalteracao,datacancelamentoirp,municipiouasg,descricaoobjeto,numerouasg -- codigogestor,codigogestorsub,numeroirp,numeroirpanual,usuarioinclusao,usuarioalteracao,prazoestimadovalidadeata,dataprovlicitacao,datalimiteparticipacao,dddtelefonegestor,dddtelefonegestorsub,dddfaxgestor,dddfaxgestorsub,telefonegestor,faxgestor,telefonegestorsub,faxgestorsub,cepuasg,endnumerouasg,complementouasg,emailgestor,emailgestorsub,bairrouasg,logradourouasg,justificativasrp,observacao,contratacaompsetic,codigomododisputa,i.compranacional
FROM Siasgnet_irp_VBL.irp i
JOIN Siasgnet_atasrp_VBL.licitacaosrp l ON UPPER(i.numeroirp) = UPPER(numerouasgorigemirp||anoirp||l.numeroirp) 
WHERE l.anoirp >= '2018'
--ORDER BY datacancelamentoirp DESC;












______________________________________________________________________________________
SELECT
    LPAD(l.numerouasgorigem,6,'0')||LPAD(l.codigomodalidadecompra,2,'0')||LPAD(l.numerolicitacao,5,'0')||LPAD(l.anolicitacao,4,'0') AS CHAVECOMPRA_COMPRA
,    LPAD(l.numerouasgorigem,6,'0')||LPAD(l.codigomodalidadecompra,2,'0')||LPAD(l.numerolicitacao,5,'0')||LPAD(l.anolicitacao,4,'0')||LPAD(i.numeroitem,5,'0') AS CHAVE_COMPRA_ITEM
,    l.numerouasgorigem AS UASG_GERENCIADORA
,    l.numerolicitacao||l.anolicitacao AS licitacao
,    l.codigolicitacaosrp
,    m.uf AS UF
,    i.numeroitem AS N_ITEM
,    ug.hierarquianivel3
,    ug.hierarquianivel2
,    ug.hierarquianivel1
,    i.descricao AS DESCRICAO_DO_ITEM
,    f.marca AS MARCA
,    f.valorhomologadounitario AS VALOR_UNITARIO
,    i.quantidadepublicada AS QTD_HOMOLOGADA
,    i.quantidademaximaparaadesoes AS QTD_MAX_ADESAO
,    i.quantidadeautorizada AS QTD_AUTORIZADA
,    i.quantidademaximaparaadesoes - i.quantidadeautorizada AS QTD_DISPONIVEL
,    i.datainiciovigenciaata AS INICIO_DE_VIGENCIA
,    i.datafimvigenciaata AS FINAL_DE_VIGENCIA
,    f.identificacao AS CNPJ
,    f.nomerazaosocial AS RAZAO_SOCIAL
    FROM Siasgnet_atasrp_VBL.licitacaosrp l
    INNER JOIN Siasgnet_atasrp_VBL.itematasrp i
        ON l.codigolicitacaosrp = i.codigolicitacaosrp
    INNER JOIN Siasgnet_VBL.uasg ug
        ON l.numerouasgorigem = ug.numerouasg
    INNER JOIN Siasgnet_VBL.orgao org
        ON ug.numeroorgaouasg = org.numeroorgao
    INNER JOIN Siasgnet_VBL.municipio m
        ON ug.codigomunicipio = m.codigomunicipio
    INNER JOIN Siasgnet_atasrp_VBL.fornecedor f
        ON i.codigoitematasrp = f.codigoitematasrp
    WHERE i.datainiciovigenciaata  BETWEEN '20180000' AND '20190000'    
    AND l.numerouasgorigem  = '201057';

