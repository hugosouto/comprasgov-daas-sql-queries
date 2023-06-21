WITH temp AS (
	SELECT YEAR(prgDataEntregaProp) ano, MONTH(prgDataEntregaProp) mes, COUNT(DISTINCT prpi.ipgCod) AS conta, 'antes' AS lei
	FROM Comprasnet_VBL.tbl_PropostaItem prpi
		JOIN Comprasnet_VBL.tbl_Proposta prp ON prp.prpCod = prpi.prpCod
		JOIN Comprasnet_VBL.tbl_Pregao p ON p.prgCod = prp.prgCod
--	WHERE p.prgDataEntregaProp < '2019-10-28 00:00:00' AND prpSequencial = 1 AND ippIndHabilitado = 'I' AND prgDataHom IS NOT NULL
	WHERE p.prgDataEntregaProp BETWEEN '2016-01-01 00:00:00' AND '2018-06-30 00:00:00' AND prpSequencial = 1 AND ippIndHabilitado = 'I' AND prgDataHom IS NOT NULL
	GROUP BY YEAR(prgDataEntregaProp), MONTH(prgDataEntregaProp)
	HAVING COUNT(DISTINCT prpi.ipgCod) > 100
	UNION
	SELECT YEAR(prgDataEntregaProp) ano, MONTH(prgDataEntregaProp) mes, COUNT(DISTINCT prpi.ipgCod) AS conta, 'depois' AS lei
	FROM Comprasnet_VBL.tbl_PropostaItem prpi
		JOIN Comprasnet_VBL.tbl_Proposta prp ON prp.prpCod = prpi.prpCod
		JOIN Comprasnet_VBL.tbl_Pregao p ON p.prgCod = prp.prgCod
	WHERE p.prgDataEntregaProp > '2019-10-28 00:00:00' AND prpSequencial = 1 AND ippIndHabilitado = 'I' AND prgDataHom IS NOT NULL
	GROUP BY YEAR(prgDataEntregaProp), MONTH(prgDataEntregaProp)
	HAVING COUNT(DISTINCT prpi.ipgCod) > 100
--	UNION
--	SELECT YEAR(prgDataEntregaProp) ano, MONTH(prgDataEntregaProp) mes, COUNT(DISTINCT prpi.ipgCod) AS conta, 'depois' AS lei
--	FROM Comprasnet_VBL.tbl_PropostaItem prpi
--		JOIN Comprasnet_VBL.tbl_Proposta prp ON prp.prpCod = prpi.prpCod
--		JOIN Comprasnet_VBL.tbl_Pregao p ON p.prgCod = prp.prgCod
--	WHERE p.prgDataEntregaProp > '2019-10-28 00:00:00' AND prpSequencial = 1 AND ippIndHabilitado = 'I' AND prgDataHom IS NOT NULL
--	GROUP BY YEAR(prgDataEntregaProp), MONTH(prgDataEntregaProp)
--	HAVING COUNT(DISTINCT prpi.ipgCod) > 100
)
SELECT DISTINCT
	(SELECT AVG(conta) FROM temp WHERE lei = 'antes') AS mediaantigo,
	(SELECT AVG(conta) FROM temp WHERE lei = 'depois') AS medianovo
FROM temp

--WHERE p.prgDataEntregaProp BETWEEN '2016-01-01 00:00:00' AND '2018-06-30 00:00:00' AND prpSequencial = 1 AND ippIndHabilitado = 'I'
--GROUP BY MONTH(prgDataEntregaProp)
