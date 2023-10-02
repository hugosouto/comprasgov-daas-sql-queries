SELECT DISTINCT 
	 CASE codigomododisputa
	 	WHEN 1 THEN 'Aberto'
	 	WHEN 2 THEN 'Fechado'
	 	WHEN 3 THEN 'Aberto/Fechado'
	 	WHEN 4 THEN 'Fechado/Aberto'
	 	ELSE codigomododisputa END mododisputa, 
	COUNT(codigolicitacao) contagem
FROM Siasgnet_rdc_dc_VBL.licitacao l
GROUP BY codigomododisputa
ORDER BY 2;



SELECT DISTINCT 
	 CASE codigomododisputa
	 	WHEN 1 THEN 'Aberto'
	 	WHEN 2 THEN 'Fechado'
	 	WHEN 3 THEN 'Aberto/Fechado'
	 	WHEN 4 THEN 'Fechado/Aberto'
	 	ELSE codigomododisputa END mododisputa,
-- 	codigomododisputa, 
	COUNT(codigolicitacao) contagem
FROM Siasgnet_rdc_dc_VBL.licitacao l
	JOIN Siasgnet_VBL.criteriojulgamento cj ON l.codigocriteriojulgamento = cj.codigocriteriojulgamento
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacaoitemlicitacao vli ON l.codigolicitacao = vli.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.itemlicitacao il ON vli.codigoitemlicitacao = il.codigoitemlicitacao
WHERE il.codigoitemcatalogo IN ('4553','1619','4545','1406','1414','1422','1430','1740','1767','1775','1783','1791','1805','1848','1856','1910','1929','1937','3425','4774','5622','13455','18376','22896','24481','24490','25445','25453')
GROUP BY codigomododisputa
ORDER BY 2;


SELECT '2013 a 2022: Todos' Filtro, COUNT(codigosituacaolicitacao) Contagem
FROM Siasgnet_rdc_dc_VBL.licitacao l
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacao vl ON l.codigolicitacao = vl.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacaoitemlicitacao vli ON l.codigolicitacao = vli.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.itemlicitacao il ON vli.codigoitemlicitacao = il.codigoitemlicitacao
	JOIN Siasgnet_VBL.criteriojulgamento cj ON l.codigocriteriojulgamento = cj.codigocriteriojulgamento
WHERE 1=1
	AND l.anolicitacao BETWEEN 2013 AND 2022
UNION
SELECT '2013 a 2022: Itens de obras' Filtro, COUNT(codigosituacaolicitacao) Contagem
FROM Siasgnet_rdc_dc_VBL.licitacao l
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacao vl ON l.codigolicitacao = vl.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacaoitemlicitacao vli ON l.codigolicitacao = vli.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.itemlicitacao il ON vli.codigoitemlicitacao = il.codigoitemlicitacao
	JOIN Siasgnet_VBL.criteriojulgamento cj ON l.codigocriteriojulgamento = cj.codigocriteriojulgamento
WHERE 1=1
	AND il.codigoitemcatalogo IN ('4553','1619','4545','1406','1414','1422','1430','1740','1767','1775','1783','1791','1805','1848','1856','1910','1929','1937','3425','4774','5622','13455','18376','22896','24481','24490','25445','25453')
	AND l.anolicitacao BETWEEN 2013 AND 2022
;

SELECT '2013 a 2022: Todos' Filtro, vl.codigosituacaolicitacao, COUNT(codigosituacaolicitacao) Contagem
FROM Siasgnet_rdc_dc_VBL.licitacao l
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacao vl ON l.codigolicitacao = vl.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacaoitemlicitacao vli ON l.codigolicitacao = vli.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.itemlicitacao il ON vli.codigoitemlicitacao = il.codigoitemlicitacao
	JOIN Siasgnet_VBL.criteriojulgamento cj ON l.codigocriteriojulgamento = cj.codigocriteriojulgamento
WHERE 1=1
	AND l.anolicitacao BETWEEN 2013 AND 2022
	AND vl.codigosituacaolicitacao = 1
GROUP BY vl.codigosituacaolicitacao
UNION
SELECT '2013 a 2022: Itens de obras' Filtro, vl.codigosituacaolicitacao, COUNT(codigosituacaolicitacao) Contagem
FROM Siasgnet_rdc_dc_VBL.licitacao l
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacao vl ON l.codigolicitacao = vl.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacaoitemlicitacao vli ON l.codigolicitacao = vli.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.itemlicitacao il ON vli.codigoitemlicitacao = il.codigoitemlicitacao
	JOIN Siasgnet_VBL.criteriojulgamento cj ON l.codigocriteriojulgamento = cj.codigocriteriojulgamento
WHERE 1=1
	AND il.codigoitemcatalogo IN ('4553','1619','4545','1406','1414','1422','1430','1740','1767','1775','1783','1791','1805','1848','1856','1910','1929','1937','3425','4774','5622','13455','18376','22896','24481','24490','25445','25453')
	AND l.anolicitacao BETWEEN 2013 AND 2022
	AND vl.codigosituacaolicitacao = 1
GROUP BY vl.codigosituacaolicitacao
ORDER BY 1, 2
;

	
SELECT
	'https://compras.dados.gov.br/licitacoes/doc/rdc/'||numerouasgorigem||'99'||LPAD(numerolicitacao, 5, 0)||anolicitacao link
	,LPAD(numerouasgorigem, 6 ,0)||'99'||LPAD(numerolicitacao, 5, 0)||LPAD(anolicitacao, 4, 0) codcompra
	,LPAD(numerouasgorigem, 6, 0)||'99'||LPAD(numerolicitacao, 5, 0)||LPAD(anolicitacao, 4, 0)||LPAD(il.numeroitem, 5, 0) coditem
	,l.codigolicitacao
	,il.codigoitemlicitacao
	,l.numerouasgorigem
	,l.numerouasgresponsavel
	,l.numerolicitacao
	,l.anolicitacao
	,CASE l.codigomododisputa
		WHEN 1 THEN 'Aberto'
		WHEN 2 THEN 'Fechado'
		WHEN 3 THEN 'Aberto/Fechado'
		WHEN 4 THEN 'Fechado/Aberto'
		ELSE codigomododisputa END mododisputa
	,cj.descricao criteriojulgamento
	,vl.codigosituacaolicitacao
--	,l.codigomododisputa
--	,l.codigocriteriojulgamento
	,l.inversaofases
	,l.participacaoconsorcio
	,il.codigoitemcatalogo
	,il.descricao
	,il.numeroitem
	,il.quantidade
	,il.quantidadeconsistente
	,il.codigosituacaoitemlicitacao
	,il.subcontratacao
	,il.codigotipoitem
	,il.utilizamargempreferencia
	,il.valorestimado
	,l.datahoraregistro datahoraregistrolicitacao
	,il.datahoraregistro datahoraregistroitem
--	,l.justificativainversaofases
--	,l.quantidademaximaconsorciados
--	,l.codigosistemaorigem
--	,il.beneficioconsistente
--	,il.descricaodetalhada
--	,il.equalizacaoicmsconsistente
--	,il.intervalominimoentrelances
--	,il.localentregaconsistente
--	,il.numerogrupo
--	,il.percentualmargempreferencianormal
--	,il.pesquisaconsistente
--	,il.capacidadeunidademedida
--	,il.nomeunidadefornecimento
--	,il.nomeunidademedida
--	,il.siglaunidadefornecimento
--	,il.siglaunidademedida
--	,il.unidadefornecimento
--	,il.codigobeneficio
--	,il.percentualmargempreferenciaadicional
--	,il.itemsustentavel 
FROM Siasgnet_rdc_dc_VBL.licitacao l
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacao vl ON l.codigolicitacao = vl.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.versaolicitacaoitemlicitacao vli ON l.codigolicitacao = vli.codigoversaolicitacao
	JOIN Siasgnet_rdc_dc_VBL.itemlicitacao il ON vli.codigoitemlicitacao = il.codigoitemlicitacao
	JOIN Siasgnet_VBL.criteriojulgamento cj ON l.codigocriteriojulgamento = cj.codigocriteriojulgamento
WHERE 1=1
--	AND il.codigoitemcatalogo IN ('4553','1619','4545','1406','1414','1422','1430','1740','1767','1775','1783','1791','1805','1848','1856','1910','1929','1937','3425','4774','5622','13455','18376','22896','24481','24490','25445','25453')
	AND l.anolicitacao BETWEEN 2013 AND 2022
--ORDER BY il.codigoitemlicitacao DESC
;	