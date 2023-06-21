SELECT * FROM Siasgnet_dc_VBL.compra WHERE numerouasgorigem IN (928138,926683,926366,926382,926095,925012,925061,926346,925086,925063,926392,926361,926387,926728,926192) AND anocompra = '2023'

--------------------------------

SELECT u.numerouasg codigouasg, u.nome nomeuasg,
	COUNT(c.codigocompra) comprastotal,
	CASE WHEN (SELECT COUNT(c.codigocompra) FROM Siasgnet_dc_VBL.compra c JOIN Siasgnet_VBL.uasg u ON c.numerouasgresponsavel = u.numerouasg WHERE numerouasgresponsavel IN (928138,926683,926366,926382,926095,925012,925061,926346,925086,925063,926392,926361,926387,926728,926192) AND anocompra = '2023' GROUP BY u.numerouasg, u.nome) IS NULL THEN 0 
	ELSE (SELECT COUNT(c.codigocompra) FROM Siasgnet_dc_VBL.compra c JOIN Siasgnet_VBL.uasg u ON c.numerouasgresponsavel = u.numerouasg WHERE numerouasgresponsavel IN (928138,926683,926366,926382,926095,925012,925061,926346,925086,925063,926392,926361,926387,926728,926192) AND anocompra = '2023' GROUP BY u.numerouasg, u.nome) END compras2023
FROM Siasgnet_dc_VBL.compra c
JOIN Siasgnet_VBL.uasg u ON c.numerouasgresponsavel = u.numerouasg
WHERE numerouasgresponsavel IN (928138,926683,926366,926382,926095,925012,925061,926346,925086,925063,926392,926361,926387,926728,926192) -- AND anocompra = '2023'
GROUP BY u.numerouasg, u.nome

--------------------------------

SELECT
	DISTINCT u.numerouasg codigouasg,
	u.nome nomeuasg,
	LPAD(c.numerouasgorigem, 6, 0) || LPAD(c.codigomodalidadecompra, 2, 0) || c.numerocompra || c.anocompra AS compra,
	vc.codigosituacaocompra,
	MAX(vc.codigosituacaocompra) codigosituacaocompra,
	MAX(vc.datahoraregistro) datahoraregistro
--	CASE
--		vc.codigosituacaocompra
--		WHEN 0 THEN 'Divulgada'
--		WHEN 2 THEN 'Anulada'
--		ELSE vc.codigosituacaocompra
--	END situacaocompra
FROM
	Siasgnet_dc_VBL.compra c
	JOIN Siasgnet_VBL.uasg u ON c.numerouasgresponsavel = u.numerouasg
	JOIN Siasgnet_dc_VBL.versaocompra vc ON c.codigocompra = vc.codigocompra
WHERE
	c.numerouasgresponsavel IN (
		928138,
		926683,
		926366,
		926382,
		926095,
		925012,
		925061,
		926346,
		925086,
		925063,
		926392,
		926361,
		926387,
		926728,
		926192
	)
--	AND c.anocompra >= 2022
--	AND vc.codigosituacaocompra NOT IN (2)
GROUP BY
	u.numerouasg,
	u.nome,
	c.numerouasgorigem,
	c.codigomodalidadecompra,
	c.numerocompra,
	c.anocompra,
	vc.codigosituacaocompra