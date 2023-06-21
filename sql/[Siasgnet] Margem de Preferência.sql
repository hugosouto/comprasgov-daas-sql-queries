todas as compras realizadas com margem de preferência enquanto os decretos estavam em vigor

SELECT --c.*, il.*
--	data da compra,
--	órgão responsável,
--	unidade responsável,
--	código,
--	classe do material,
--	descrição do material,
--	porte da empresa fornecedora,
--	CNPJ da empresa,
--	modalidade da compra,
--	-- *país fabricante do produto*,
--	micro, pequenas e médias empresas,
--	percentual de margem aplicado,
--	margem adicional,
--	valor da compra
--------------------------------------------
--	codigocompra,
	CASE WHEN codigomodalidadecompra = 1 THEN 'Convite'
		 WHEN codigomodalidadecompra = 2 THEN 'Tomada de Preços'
		 WHEN codigomodalidadecompra = 3 THEN 'Concorrência'
		 WHEN codigomodalidadecompra = 5 THEN 'Pregão'
		 WHEN codigomodalidadecompra = 6 THEN 'Dispensa de Licitação'
		 WHEN codigomodalidadecompra = 7 THEN 'Inexigibilidade de Licitação'
		 WHEN codigomodalidadecompra = 20 THEN 'Concurso' END AS modalidadecompra,
	numerocompra,
	anocompra,
--	numerouasgorigem,
	numerouasgresponsavel,
--	tipocompra,
--	cpfusuarioencerramento,
--	datahoraencerramento,
--	CASE WHEN codigopedidodispensaeletronica IS NULL THEN 'Não' 
--		 WHEN codigopedidodispensaeletronica IS NOT NULL THEN 'Sim' END AS indicadorcotacaodispensaeletronica,
--	codigosistemaorigem,
--	percentualparagrafounico,
--	c.codigolei,
	l.descricaocurta||' - '||l.nomelei lei,
--	outrashipotesesdispensa,
--	c.datahoraregistro,
--	codigoitemlicitacao,
	codigocriteriojulgamento,
	valorunitarioestimado,
	valortotalestimado,
--	pesquisaconsistente,
--	equalizacaoicmsconsistente,
	localentregaconsistente,
	beneficioconsistente,
	numerogrupo,
	codigobeneficio,
	utilizadecreto71742010,
	utilizamargempreferencia,
	percentualmargempreferencianormal,
	percentualmargempreferenciaadicional,
	intervalominimoentrelances,
	il.datahoraregistro,
	permiteadesaoata,
	quantidademaximaparaadesoesata,
--	itemreferesetic,
--	servicovinculadobemsetic,
	tipoobjetoitem,
	criteriovalor,
	tiporeducao,
	valorcaratersigiloso
FROM Siasgnet_dc_VBL.itemlicitacao il
	JOIN Siasgnet_dc_VBL.versaocompraitemcompra vic ON vic.codigoitemcompra = il.codigoitemlicitacao
	JOIN Siasgnet_dc_VBL.compra c ON c.codigocompra = vic.codigoversaocompra
	JOIN Siasgnet_VBL.lei l ON l.codigolei = c.codigolei
WHERE utilizamargempreferencia = 'T' AND codigomodalidadecompra = 6;

Gostaria também, se possível,  de um esclarecimento sobre como 
obter os dados de compras públicas totais por classe de material 
e porte da empresa fornecedora no API de compras governamentais