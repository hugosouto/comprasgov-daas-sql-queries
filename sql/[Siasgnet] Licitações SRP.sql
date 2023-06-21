SELECT m.descricao, cl.descricao, COUNT(DISTINCT c.codigocompra) compras 
FROM Siasgnet_dc_VBL.compra c 
	JOIN Siasgnet_dc_VBL.versaocompra vc ON c.codigocompra = vc.codigocompra 
	JOIN Siasgnet_dc_VBL.versaocompracomlicitacao vcl ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao 
	JOIN Siasgnet_VBL.modalidadecompra m ON m.codigomodalidadecompra = c.codigomodalidadecompra 
	JOIN Siasgnet_VBL.caracteristicalicitacao cl ON cl.codigocaracteristicalicitacao = vcl.codigocaracteristicalicitacao 
WHERE c.codigolei = 20 
GROUP BY cl.descricao, m.descricao
ORDER BY m.descricao
;
SELECT LPAD(c.numerouasgresponsavel,6,'0')||LPAD(c.codigomodalidadecompra,2,'0')||LPAD(c.numerocompra,5,'0')||LPAD(c.anocompra,4,'0') codcompra, m.descricao, cl.descricao 
FROM Siasgnet_dc_VBL.compra c 
	JOIN Siasgnet_dc_VBL.versaocompra vc ON c.codigocompra = vc.codigocompra 
	JOIN Siasgnet_dc_VBL.versaocompracomlicitacao vcl ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao 
	JOIN Siasgnet_VBL.modalidadecompra m ON m.codigomodalidadecompra = c.codigomodalidadecompra 
	JOIN Siasgnet_VBL.caracteristicalicitacao cl ON cl.codigocaracteristicalicitacao = vcl.codigocaracteristicalicitacao 
WHERE codigolei = 20 
ORDER BY m.descricao, codcompra
;
SELECT m.descricao, cl.descricao, COUNT(DISTINCT c.codigocompra) compras 
FROM Siasgnet_dc_VBL.compra c 
JOIN Siasgnet_dc_VBL.versaocompra vc ON c.codigocompra = vc.codigocompra 
JOIN Siasgnet_dc_VBL.versaocompracomlicitacao vcl ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao 
JOIN Siasgnet_VBL.modalidadecompra m ON m.codigomodalidadecompra = c.codigomodalidadecompra 
JOIN Siasgnet_VBL.caracteristicalicitacao cl ON cl.codigocaracteristicalicitacao = vcl.codigocaracteristicalicitacao 
WHERE codigolei = 20 
GROUP BY cl.descricao, m.descricao 
ORDER BY m.descricao;
