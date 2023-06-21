SELECT *
FROM 
	Siasgnet_dc_VBL.versaocompra AS vc
	INNER JOIN Siasgnet_dc_VBL.compra AS c 
		ON vc.codigocompra = c.codigocompra
WHERE vc.codigosituacaocompra = 0;

SELECT *
/*	
	a.codigosituacaoaviso,
	vc.codigosituacaocompra,
	c.codigomodalidadecompra,
	c.numerocompra,
	c.anocompra,
	c.numerouasgresponsavel,
	vc.objeto,
	vc.numeroversaocompra,
	a.datapublicacaodivulgacao,
	c.datahoraregistro
*/
FROM 
	Siasgnet_dc_VBL.compra AS c
	INNER JOIN Siasgnet_dc_VBL.versaocompra AS vc
		ON vc.codigocompra = c.codigocompra
	LEFT JOIN Siasgnet_dc_VBL.avisocompra AS ac 
		ON ac.codigocompra = c.codigocompra
	INNER JOIN Siasgnet_dc_VBL.aviso AS a
		ON a.codigoaviso = ac.codigoavisocompra
ORDER BY c.codigocompra DESC
