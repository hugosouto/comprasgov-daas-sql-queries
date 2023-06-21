SELECT c.*, ic.*
FROM Siasgnet_dc_VBL.itemcompra ic
	JOIN Siasgnet_dc_VBL.versaocompraitemcompra vci ON vci.codigoitemcompra = ic.codigoitemcompra
	JOIN Siasgnet_dc_VBL.versaocompra vc ON vc.codigoversaocompra = vci.codigoversaocompra
	JOIN Siasgnet_dc_VBL.compra c ON c.codigocompra = vc.codigocompra
WHERE c.codigomodalidadecompra||c.numerouasgorigem||CAST(c.numerocompra AS INTEGER)||c.anocompra = 5257035632019
ORDER BY ic.numeroitem