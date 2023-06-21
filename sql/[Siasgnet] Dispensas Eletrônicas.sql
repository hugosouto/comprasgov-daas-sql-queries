SELECT LPAD(numerouasgorigem,6,0)||LPAD(codigomodalidadecompra,2,0)||LPAD(numerocompra,5,0)||LPAD(anocompra,4,0) AS DS_CMPR_COMPRA
FROM Siasgnet_dc_VBL.compra
WHERE codigomodalidadecompra = 6 AND codigolei = 20
ORDER BY numerouasgorigem,codigomodalidadecompra,anocompra,numerocompra