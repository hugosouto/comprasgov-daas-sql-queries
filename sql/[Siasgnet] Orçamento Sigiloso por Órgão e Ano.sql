SELECT * 
FROM Siasgnet_dc_VBL.versaocompracomlicitacao 	vcl
	JOIN Siasgnet_dc_VBL.versaocompra			vc	ON vcl.codigoversaocompracomlicitacao = vc.codigoversaocompra
	JOIN Siasgnet_dc_VBL.versaocompraitemcompra vci ON vcl.codigoversaocompracomlicitacao = vci.codigoversaocompra
	LEFT JOIN Siasgnet_dc_VBL.itemcompra		ic 	ON vci.codigoitemcompra = ic.codigoitemcompra 
	JOIN Siasgnet_dc_VBL.itemlicitacao			il	ON ic.codigoitemcompra = il.codigoitemlicitacao
	
	
SELECT
	o.numeroorgao,
	o.nome,
	c.anocompra,
	COUNT(DISTINCT c.codigocompra) licit_com_item_orcamento_sigiloso,
	COUNT(DISTINCT ic.codigoitemcompra) itens_orcamento_sigiloso
FROM Siasgnet_dc_VBL.versaocompra						AS vc
	LEFT JOIN  Siasgnet_dc_VBL.versaocompracomlicitacao AS vcl 	ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao
	INNER JOIN Siasgnet_dc_VBL.compra 					AS c	ON vc.codigocompra = c.codigocompra
	LEFT JOIN Siasgnet_dc_VBL.versaocompraitemcompra 	AS vci 	ON vcl.codigoversaocompracomlicitacao = vci.codigoversaocompra
	INNER JOIN Siasgnet_dc_VBL.itemlicitacao			AS il	ON vci.codigoitemcompra = il.codigoitemlicitacao
	INNER JOIN Siasgnet_dc_VBL.itemcompra				AS ic	ON vci.codigoitemcompra = ic.codigoitemcompra
	INNER JOIN Siasgnet_VBL.uasg 						AS u	ON c.numerouasgresponsavel = u.numerouasg
	INNER JOIN Siasgnet_VBL.orgao 						AS o	ON u.numeroorgaouasg = o.numeroorgao
WHERE il.valorcaratersigiloso = 1
GROUP BY
	o.numeroorgao,
	o.nome,
	c.anocompra
	
SELECT
	o.numeroorgao,
	o.nome,
	c.anocompra,
	COUNT(DISTINCT c.codigocompra) licit_com_item_sigiloso
FROM
	Siasgnet_dc_VBL.versaocompra						AS vc
	LEFT JOIN  Siasgnet_dc_VBL.versaocompracomlicitacao AS vcl 	ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao
	INNER JOIN Siasgnet_dc_VBL.compra 					AS c	ON vc.codigocompra = c.codigocompra
	LEFT JOIN Siasgnet_dc_VBL.versaocompraitemcompra 	AS vci 	ON vcl.codigoversaocompracomlicitacao = vci.codigoversaocompra
	INNER JOIN Siasgnet_dc_VBL.itemlicitacao			AS il	ON vci.codigoitemcompra = il.codigoitemlicitacao
	INNER JOIN Siasgnet_VBL.uasg 						AS u	ON c.numerouasgresponsavel = u.numerouasg
	INNER JOIN Siasgnet_VBL.orgao 						AS o	ON u.numeroorgaouasg = o.numeroorgao
WHERE il.valorcaratersigiloso = 1
GROUP BY
	o.numeroorgao,
	o.nome,
	c.anocompra
	
	
SELECT *
FROM Siasgnet_dc_VBL.versaocompra						AS vc
	LEFT JOIN  Siasgnet_dc_VBL.versaocompracomlicitacao AS vcl 	ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao
	INNER JOIN Siasgnet_dc_VBL.compra 					AS c	ON vc.codigocompra = c.codigocompra
	LEFT JOIN Siasgnet_dc_VBL.versaocompraitemcompra 	AS vci 	ON vcl.codigoversaocompracomlicitacao = vci.codigoversaocompra
	INNER JOIN Siasgnet_dc_VBL.itemlicitacao			AS il	ON vci.codigoitemcompra = il.codigoitemlicitacao
	INNER JOIN Siasgnet_dc_VBL.itemcompra				AS ic	ON vci.codigoitemcompra = ic.codigoitemcompra
	INNER JOIN Siasgnet_VBL.uasg 						AS u	ON c.numerouasgresponsavel = u.numerouasg
	INNER JOIN Siasgnet_VBL.orgao 						AS o	ON u.numeroorgaouasg = o.numeroorgao
WHERE il.valorcaratersigiloso = 1
	