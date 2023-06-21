SELECT
	LPAD(a.numerouasg,6,0)||'06'||a.numeropedidodispensaeletronica||a.anopedidodispensaeletronica AS id_compra,
	a.dataencerramentocotacaodispensaeletronica AS dataencerramento,
	d.descricao AS lei,
	c.descricao AS artigo,
	b.descricao AS inciso,
	a.valortotal AS valortotalestimado,
	g.valortotalcompra AS valortotalcompra
FROM Siasgnet_dc_VBL.pedidodispensaeletronica a
	JOIN Siasgnet_VBL.incisoparagrafo b ON b.codigoincisoparagrafo = a.codigoincisoparagrafo
	JOIN Siasgnet_VBL.artigo c ON c.codigoartigo = b.codigoartigo
	JOIN Siasgnet_VBL.lei d ON d.codigolei = c.codigolei
	LEFT JOIN Siasgnet_dc_VBL.compra e ON e.codigopedidodispensaeletronica = a.codigopedidodispensaeletronica 
	LEFT JOIN Siasgnet_dc_VBL.versaocompra f ON f.codigocompra = e.codigocompra
	LEFT JOIN Siasgnet_dc_VBL.versaocomprasemlicitacao g ON g.codigoversaocomprasemlicitacao = f.codigoversaocompra
WHERE a.codigoincisoparagrafo IN (428)
ORDER BY id_compra;


------------------------------- Código inicial -------------------------------


SELECT
	SUBSTRING(c.datadeclaracao,1,4)||SUBSTRING(c.datadeclaracao,6,2) AS meshomologacao,
	LPAD(a.numerouasgorigem, 6, 0)||LPAD(a.codigomodalidadecompra, 2, 0)||a.numerocompra||a.anocompra AS id_compra,
--	c.datadeclaracao AS datahomologacao,
	c.fundamentolegaldescricao AS fundamentolegal,
	f.descricao AS lei,
	d.descricao AS artigo,
	e.descricao AS inciso,
	c.valortotalcompra
FROM Siasgnet_dc_VBL.compra AS a
	JOIN Siasgnet_dc_VBL.versaocompra AS b ON a.codigocompra = b.codigocompra
	JOIN Siasgnet_dc_VBL.versaocomprasemlicitacao AS c ON b.codigoversaocompra = c.codigoversaocomprasemlicitacao
	JOIN Siasgnet_VBL.artigo AS d	ON c.codigoartigo = d.codigoartigo
	JOIN Siasgnet_VBL.incisoparagrafo AS e ON c.codigoincisoparagrafo = e.codigoincisoparagrafo
	JOIN Siasgnet_VBL.lei AS f ON a.codigolei = f.codigolei 
WHERE a.codigolei IN (20)
	AND a.codigomodalidadecompra = 6
	AND a.codigopedidodispensaeletronica IS NOT NULL
--	AND C.codigoartigo IN (22)
--	AND c.datadeclaracao > '2021'
--	AND a.anocompra = '2021'
ORDER BY id_compra;