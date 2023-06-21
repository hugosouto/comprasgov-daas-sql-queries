SELECT
	o2.CodOrgao AS CodOrgaoSuperior
,	o2.NomeOrgao AS NomeOrgaoSuperior
,	o.CodOrgao
,	o.NomeOrgao
,	p.coduasg
,	u.nomuasg
,	l.lanCod
,	l.ipgCod
,	l.cliente_id
,	l.lanData
,	l.lanValor
,	l.lanStatus
,	l.lanDataExclui
,	l.lanIndExclPreg
,	l.lanIndExclLances
,	l.lanClassif
,	l.lanIndConvocacao
,	l.lanIndConvocacao7174
,	l.dataInclusao
,	l.dataAlteracao
FROM Comprasnet_VBL.tbl_lances l
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2015-02-01 00:00:00' AND (o2.CodOrgao IN (95430) OR p.coduasg IN (986001))
UNION
SELECT
	o2.CodOrgao AS CodOrgaoSuperior
,	o2.NomeOrgao AS NomeOrgaoSuperior
,	o.CodOrgao
,	o.NomeOrgao
,	p.coduasg
,	u.nomuasg
,	l.lanCod
,	l.ipgCod
,	l.cliente_id
,	l.lanData
,	l.lanValor
,	l.lanStatus
,	'' AS lanDataExclui
,	'' AS lanIndExclPreg
,	'' AS lanIndExclLances
,	l.lanClassif
,	l.lanIndConvocacao
,	l.lanIndConvocacao7174
,	l.dataInclusao
,	l.dataAlteracao
FROM Comprasnet_VBL.tbl_lances_encerrados l
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.ipgCod = l.ipgCod
JOIN Comprasnet_VBL.tbl_pregao p ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_orgao o ON o.CodOrgao = u.CodOrgao
JOIN Comprasnet_VBL.tb_orgao o2 ON o2.CodOrgao= o.CodOrgaoVinculado
WHERE l.lanData BETWEEN '2015-01-01 00:00:00' AND '2015-02-01 00:00:00' AND (o2.CodOrgao IN (95430) OR p.coduasg IN (986001))