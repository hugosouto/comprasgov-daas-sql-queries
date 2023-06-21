-- Situa��o do item (i.e., se a compra/leil�o foi homologada e para qual CNPJ/CPF);
--Hist�rico completo de lances por item, incluindo valor do lance, CNPJ/CPF e data/hora de registro;
-- Informa��es completas sobre abertura e encerramento; i.e., data/hora de abertura, data/hora de imin�ncia e data/hora encerramento.

-- Com tabela temporária para ordenação --------
WITH temp AS (
	SELECT 
	lanCod,
	l.ipgCod,
	l.cliente_id,
	l.lanData,
	l.lanValor,
	l.lanStatus,
--	l.lanDataExclui,
--	l.lanIndExclPreg,
--	l.lanIndExclLances,
	l.lanClassif,
	l.lanIndConvocacao,
	l.lanIndConvocacao7174,
--	l.dataInclusao,
--	l.dataAlteracao
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o ON o.CodOrgao = u.CodOrgao
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2015-02-01 00:00:00' AND o2.CodOrgao IN (95430)
	UNION
SELECT 
	lanCod,
	l.ipgCod,
	l.cliente_id,
	l.lanData,
	l.lanValor,
	l.lanStatus,
--	l.lanDataExclui,
--	l.lanIndExclPreg,
--	l.lanIndExclLances,
	l.lanClassif,
	l.lanIndConvocacao,
	l.lanIndConvocacao7174,
--	l.dataInclusao,
--	l.dataAlteracao
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances_encerrados l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o ON o.CodOrgao = u.CodOrgao
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2015-02-01 00:00:00' AND o2.CodOrgao IN (95430)
)
SELECT *
FROM temp p
--ORDER BY lanCod
;
-- Apenas tabela Lances ------------------------
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
LEFT JOIN Stg_Comprasnet.dbo.tb_orgao o ON o.CodOrgao = u.CodOrgao
WHERE l.lanData BETWEEN '2017-01-01 00:00:00' AND '2017-01-02 00:00:00'
;

-- Sem tabela temporária -----------------------
SELECT 
	lanCod,
--	l.ipgCod,
--	l.cliente_id,
--	l.lanData,
--	l.lanValor,
--	l.lanStatus,
--	l.lanDataExclui,
--	l.lanIndExclPreg,
--	l.lanIndExclLances,
--	l.lanClassif,
--	l.lanIndConvocacao,
--	l.lanIndConvocacao7174,
--	l.dataInclusao,
--	l.dataAlteracao,
	o2.CodOrgao,
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
JOIN Stg_Comprasnet.dbo.tb_orgao o ON o.CodOrgao = u.CodOrgao
JOIN Stg_Comprasnet.dbo.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2015-02-01 00:00:00' AND o2.CodOrgao IN (95430)
UNION
SELECT 
	lanCod,
--	l.ipgCod,
--	l.cliente_id,
--	l.lanData,
--	l.lanValor,
--	l.lanStatus,
--	'' AS lanDataExclui,
--	'' AS l.lanIndExclPreg,
--	'' AS l.lanIndExclLances,
--	l.lanClassif,
--	l.lanIndConvocacao,
--	l.lanIndConvocacao7174,
--	l.dataInclusao,
--	l.dataAlteracao,
	o2.CodOrgao,
	o.CodOrgao,
	o.NomeOrgao
FROM Stg_Comprasnet.dbo.tbl_lances_encerrados l
JOIN Stg_Comprasnet.dbo.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Stg_Comprasnet.dbo.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Stg_Comprasnet.dbo.tb_uasg u ON u.coduasg = p.coduasg
JOIN Stg_Comprasnet.dbo.tb_orgao o ON o.CodOrgao = u.CodOrgao
JOIN Stg_Comprasnet.dbo.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2015-02-01 00:00:00' AND o2.CodOrgao IN (95430)