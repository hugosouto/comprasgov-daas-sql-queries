SELECT COUNT(*)
FROM Comprasnet_VBL.tbl_pregaoitem
WHERE dataInclusao > '2010-01-01 00:00:00'
;
SELECT COUNT(*)
FROM Comprasnet_VBL.tbl_Lances
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
WHERE lanData BETWEEN '2013-01-01 00:00:00' AND '2023-01-01 00:00:00'
;
SELECT COUNT(*)
FROM Comprasnet_VBL.tbl_Lances_Encerrados
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
WHERE lanData BETWEEN '2013-01-01 00:00:00' AND '2023-01-01 00:00:00'
;
SELECT COUNT(*)
FROM Comprasnet_VBL.tbl_lances l
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao 
WHERE lanData BETWEEN '2013-01-01 00:00:00' AND '2023-01-01 00:00:00'
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2018-01-01 00:00:00'
--	AND CodOrgaoVinculado = 26000
--	AND CodOrgaoVinculado = 95420
--	AND CodOrgaoVinculado = 95320
	AND Esfera='F' -- AND TipoAdm=1 
;
SELECT COUNT(*)
FROM Comprasnet_VBL.tbl_Lances_Encerrados l
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao 
WHERE lanData BETWEEN '2013-01-01 00:00:00' AND '2023-01-01 00:00:00'
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2018-01-01 00:00:00'
--	AND CodOrgaoVinculado = 26000
--	AND CodOrgaoVinculado = 95420
--	AND CodOrgaoVinculado = 95320
	AND Esfera='F' -- AND TipoAdm=1 

-----------------------------------------------------------------------
SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(l.lanCod) Lances
FROM Comprasnet_VBL.tbl_lances l
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2018-01-01 00:00:00'
--	AND CodOrgaoVinculado = 26000
--	AND CodOrgaoVinculado = 95420
--	AND CodOrgaoVinculado = 95320
--	AND TipoAdm=1 AND Esfera='F'
GROUP BY o2.CodOrgao,o2.NomeOrgao
ORDER BY COUNT(l.lanCod) DESC
;
SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(l.lanCod) Lances
FROM Comprasnet_VBL.tbl_Lances_Encerrados l
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2018-01-01 00:00:00'
--	AND CodOrgaoVinculado = 26000
--	AND CodOrgaoVinculado = 95420
--	AND CodOrgaoVinculado = 95320
--	AND TipoAdm=1 AND Esfera='F'
GROUP BY o2.CodOrgao,o2.NomeOrgao
ORDER BY COUNT(l.lanCod) DESC
----------------------------------------------------------------------- 
WITH temp AS (
	SELECT COUNT(l.lanCod) Lances
	FROM Comprasnet_VBL.tbl_lances l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
--	GROUP BY o2.CodOrgao,o2.NomeOrgao
	UNION
	SELECT COUNT(l.lanCod) Lances
	FROM Comprasnet_VBL.tbl_Lances_Encerrados l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
--	GROUP BY o2.CodOrgao,o2.NomeOrgao
)
SELECT SUM(Lances) Lances
FROM temp p
;
-----------------------------------------------------------------------
WITH temp AS (
	SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(*) Lances
	FROM Comprasnet_VBL.tbl_lances l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
	GROUP BY o2.CodOrgao,o2.NomeOrgao
	UNION
	SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(*) Lances
	FROM Comprasnet_VBL.tbl_Lances_Encerrados l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2021-01-01 00:00:00' AND '2022-01-01 00:00:00'
	GROUP BY o2.CodOrgao,o2.NomeOrgao
)
SELECT CodOrgao,NomeOrgao,SUM(Lances) Lances
FROM temp p
GROUP BY CodOrgao,NomeOrgao
ORDER BY SUM(Lances) DESC
;
-----------------------------------------------------------------------
WITH temp AS (
	SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(l.lanCod) Lances
	FROM Comprasnet_VBL.tbl_lances l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00' AND o2.CodOrgao NOT IN (52000, 26000, 93000, 94000, 96000, 95000, 97000, )
	GROUP BY o2.CodOrgao,o2.NomeOrgao
	UNION
	SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(l.lanCod) Lances
	FROM Comprasnet_VBL.tbl_Lances_Encerrados l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00' AND o2.CodOrgao NOT IN (52000, 26000, 93000, 94000, 96000, 95000, 97000, 
	GROUP BY o2.CodOrgao,o2.NomeOrgao
)
SELECT CodOrgao,NomeOrgao,SUM(Lances) Lances
FROM temp p
GROUP BY CodOrgao,NomeOrgao
ORDER BY SUM(Lances) DESC
;
-----------------------------------------------------------------------
WITH temp AS (
	SELECT 
		lanCod,
		l.ipgCod,
		cliente_id,
		lanData,
		lanValor,
		lanStatus,
--		lanDataExclui,
--		lanIndExclPreg,
--		lanIndExclLances,
		lanClassif,
		lanIndConvocacao,
		lanIndConvocacao7174,
--		dataInclusao,
--		dataAlteracao
		o.CodOrgao,
		o.NomeOrgao
	FROM Comprasnet_VBL.tbl_lances l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2010-02-01 00:00:00' AND o2.CodOrgao NOT IN (52000, 26000, 93000, 94000, 96000, 95000, 97000)
UNION
	SELECT
		lanCod,
		l.ipgCod,
		cliente_id,
		lanData,
		lanValor,
		lanStatus,
--		lanDataExclui,
--		lanIndExclPreg,
--		lanIndExclLances,
		lanClassif,
		lanIndConvocacao,
		lanIndConvocacao7174,
--		dataInclusao,
--		dataAlteracao
		o.CodOrgao,
		o.NomeOrgao
	FROM Comprasnet_VBL.tbl_Lances_Encerrados l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2010-02-01 00:00:00' AND o2.CodOrgao NOT IN (52000, 26000, 93000, 94000, 96000, 95000, 97000)
)
SELECT *
FROM temp p
;