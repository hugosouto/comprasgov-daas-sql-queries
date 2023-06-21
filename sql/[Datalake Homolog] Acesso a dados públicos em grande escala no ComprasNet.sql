SELECT COUNT(*)
FROM Stg_Comprasnet.dbo.tbl_lances
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2018-01-01 00:00:00'
;
SELECT COUNT(*)
FROM Stg_Comprasnet.dbo.tbl_lances_encerrados
--WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2022-01-01 00:00:00'
WHERE lanData BETWEEN '2010-01-01 00:00:00' AND '2018-01-01 00:00:00'
;
WITH temp AS (
	SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(l.lanCod) Lances
	FROM Stg_Comprasnet.dbo.tbl_lances l
	JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
	JOIN seges_delog_cgscg_stage.Stg_Comprasnet.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN seges_delog_cgscg_stage.Stg_Comprasnet.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2021-02-01 00:00:00'
	GROUP BY o2.CodOrgao,o2.NomeOrgao
	UNION
	SELECT o2.CodOrgao,o2.NomeOrgao,COUNT(l.lanCod) Lances
	FROM Stg_Comprasnet.dbo.tbl_Lances_Encerrados l
	JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
	JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
	JOIN seges_delog_cgscg_stage.Stg_Comprasnet.tb_orgao o ON o.CodOrgao = u.CodOrgao
	JOIN seges_delog_cgscg_stage.Stg_Comprasnet.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
	WHERE l.lanData BETWEEN '2010-01-01 00:00:00' AND '2021-01-01 00:00:00'
	GROUP BY o2.CodOrgao,o2.NomeOrgao
)
SELECT CodOrgao,NomeOrgao,SUM(Lances) Lances
FROM temp p
GROUP BY CodOrgao,NomeOrgao
ORDER BY SUM(Lances) DESC
;
