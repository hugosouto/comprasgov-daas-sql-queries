-- Situação do item (i.e., se a compra/leilão foi homologada e para qual CNPJ/CPF);
--Histórico completo de lances por item, incluindo valor do lance, CNPJ/CPF e data/hora de registro;
-- Informações completas sobre abertura e encerramento; i.e., data/hora de abertura, data/hora de iminência e data/hora encerramento.


WITH temp AS (
	SELECT 
	lanCod,
	l.ipgCod,
	cliente_id,
	lanData,
	lanValor,
	lanStatus,
--	lanDataExclui,
--	lanIndExclPreg,
--	lanIndExclLances,
	lanClassif,
	lanIndConvocacao,
	lanIndConvocacao7174,
--	dataInclusao,
--	dataAlteracao
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
LEFT JOIN  seges_delog_cgscg_stage.Stg_Comprasnet.tb_Orgao o ON o.CodOrgao = u.CodOrgao
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2016-01-01 00:00:00' AND o2.CodOrgao IN (95430)
	UNION
SELECT 
	lanCod,
	l.ipgCod,
	cliente_id,
	lanData,
	lanValor,
	lanStatus,
--	lanDataExclui,
--	lanIndExclPreg,
--	lanIndExclLances,
	lanClassif,
	lanIndConvocacao,
	lanIndConvocacao7174,
--	dataInclusao,
--	dataAlteracao
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances_encerrados l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
LEFT JOIN  seges_delog_cgscg_stage.Stg_Comprasnet.tb_Orgao o ON o.CodOrgao = u.CodOrgao
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2016-01-01 00:00:00' AND o2.CodOrgao IN (95430)
)
SELECT *
FROM temp p
--ORDER BY lanCod
;
------------------------------------------
SELECT 
	lanCod,
	l.ipgCod,
	cliente_id,
	lanData,
	lanValor,
	lanStatus,
	lanDataExclui,
	lanIndExclPreg,
	lanIndExclLances,
	lanClassif,
	lanIndConvocacao,
	lanIndConvocacao7174,
--	dataInclusao,
--	dataAlteracao
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
LEFT JOIN  seges_delog_cgscg_stage.Stg_Comprasnet.tb_Orgao o ON o.CodOrgao = u.CodOrgao
WHERE l.lanData BETWEEN '2017-01-01 00:00:00' AND '2017-01-02 00:00:00'