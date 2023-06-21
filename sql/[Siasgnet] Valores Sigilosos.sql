SELECT
	codigomodalidadecompra,numerocompra,anocompra,numerouasgresponsavel,codigocaracteristicalicitacao,dataaberturaproposta,valorunitarioestimado,valortotalestimado,criteriovalor,valorcaratersigiloso
FROM Siasgnet_dc_VBL.versaocompraitemcompra vci
	INNER JOIN Siasgnet_dc_VBL.itemlicitacao il
		ON vci.codigoitemcompra = il.codigoitemlicitacao
	INNER JOIN Siasgnet_dc_VBL.versaocompracomlicitacao vcl
		ON vci.codigoversaocompra = vcl.codigoversaocompracomlicitacao
	INNER JOIN Siasgnet_dc_VBL.versaocompra vc
		ON vci.codigoversaocompra = vc.codigoversaocompra
	INNER JOIN Siasgnet_dc_VBL.compra c
		ON vc.codigocompra = c.codigocompra
WHERE valorcaratersigiloso = 1
	AND codigomodalidadecompra = 5