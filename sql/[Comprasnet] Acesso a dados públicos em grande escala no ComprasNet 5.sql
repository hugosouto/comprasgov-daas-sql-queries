WITH temp (
SELECT DISTINCT
	l.lanCod,l.ipgCod,l.cliente_id,l.lanData,l.lanValor,l.lanStatus,l.lanDataExclui,l.lanIndExclPreg,l.lanIndExclLances,l.lanClassif,l.lanIndConvocacao,l.lanIndConvocacao7174,l.dataInclusao,l.dataAlteracao,
	pri.*, pr.*, pi.*, p.*, u.*, o.*, o2.*
FROM Comprasnet_VBL.tbl_Lances l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_Pregao p ON p.prgCod = pi.prgCod 
	JOIN Comprasnet_VBL.tbl_PropostaItem pri ON pri.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_Proposta pr ON (pr.prpCod = pri.prpCod AND pr.Cliente_ID = l.cliente_id)
	JOIN Comprasnet_VBL.tb_uasg u ON p.coduasg = u.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	LEFT JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE 1=1
	AND l.lanData BETWEEN '2010-01-01 00:00:00' AND '2018-10-26 18:00:46.198' 
	AND (o2.CodOrgao IN (95430) OR p.coduasg IN (986001))
UNION
SELECT DISTINCT
	l.lanCod,l.ipgCod,l.cliente_id,l.lanData,l.lanValor,l.lanStatus,'' AS lanDataExclui, '' AS lanIndExclPreg, '' AS lanIndExclLances,l.lanClassif,l.lanIndConvocacao,l.lanIndConvocacao7174,l.dataInclusao,l.dataAlteracao,
	pri.*, pr.*, pi.*, p.*, u.*, o.*, o2.*
FROM Comprasnet_VBL.tbl_Lances_Encerrados l
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_Pregao p ON p.prgCod = pi.prgCod 
	JOIN Comprasnet_VBL.tbl_PropostaItem pri ON pri.ipgCod = l.ipgCod
	JOIN Comprasnet_VBL.tbl_Proposta pr ON (pr.prpCod = pri.prpCod AND pr.Cliente_ID = l.cliente_id)
	JOIN Comprasnet_VBL.tb_uasg u ON p.coduasg = u.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
	LEFT JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE 1=1
	AND l.lanData BETWEEN '2010-01-01 00:00:00' AND '2018-10-17 09:26:31.828' 
	AND (o2.CodOrgao IN (95430) OR p.coduasg IN (986001))
)
SELECT * FROM temp ORDER BY lanCod DESC
;