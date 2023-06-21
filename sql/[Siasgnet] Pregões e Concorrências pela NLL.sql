SELECT m.descricao, COUNT(c.codigocompra) contacodigocompra --c.codigocompra, c.numerocompra, c.anocompra, c.numerouasgorigem
FROM Siasgnet_dc_VBL.compra c
JOIN Siasgnet_VBL.lei l ON c.codigolei = l.codigolei
JOIN Siasgnet_VBL.modalidadecompra m ON c.codigomodalidadecompra = m.codigomodalidadecompra
WHERE c.codigomodalidadecompra IN (3,5) AND c.codigolei = 20
GROUP BY m.descricao
;

--------------------------------------------------------------------------

SELECT m.descricao, COUNT(DISTINCT c.codigocompra) contacodigocompra 
FROM Siasgnet_dc_VBL.compra c
--JOIN Siasgnet_dc_VBL.versaocompra vc ON c.codigocompra = vc.codigocompra
--JOIN Siasgnet_dc_VBL.versaocompracomlicitacao vcl ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao
--JOIN Siasgnet_VBL.lei l ON c.codigolei = l.codigolei
JOIN Siasgnet_VBL.modalidadecompra m ON c.codigomodalidadecompra = m.codigomodalidadecompra
WHERE c.codigomodalidadecompra IN (3,5) AND c.codigolei IN (20)
GROUP BY m.descricao
;

--------------------------------------------------------------------------

SELECT l.descricaocurta, m.descricao, COUNT(DISTINCT c.codigocompra) contacodigocompra 
FROM Siasgnet_dc_VBL.compra c
JOIN Siasgnet_VBL.lei l ON c.codigolei = l.codigolei
JOIN Siasgnet_VBL.modalidadecompra m ON c.codigomodalidadecompra = m.codigomodalidadecompra
WHERE c.codigomodalidadecompra IN (3,5) AND c.codigolei IN (20)
GROUP BY l.descricaocurta, m.descricao
;
SELECT l.descricaocurta, m.descricao, c.codigocompra,numerouasgorigem,numerocompra,anocompra
FROM Siasgnet_dc_VBL.compra c
JOIN Siasgnet_VBL.lei l ON c.codigolei = l.codigolei
JOIN Siasgnet_VBL.modalidadecompra m ON c.codigomodalidadecompra = m.codigomodalidadecompra
JOIN Siasgnet_dc_VBL.versaocompra vc ON c.codigocompra = vc.codigocompra
WHERE c.codigomodalidadecompra IN (3,5) AND c.codigolei IN (20) AND vc.codigosituacaocompra = 0
--GROUP BY l.descricaocurta, m.descricao
;
