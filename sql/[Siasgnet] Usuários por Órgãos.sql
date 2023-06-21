SELECT
	u.sisg sisg,
	u.numerouasg uasg_cod,
	u.nome uasg_nome,
--	(
--		SELECT o.nome orgao
--		FROM Siasgnet_VBL.gestorcompras g
--		LEFT JOIN Siasgnet_VBL.gestorcomprasuasg gu ON gu.codigogestor = g.codigogestor
--		JOIN Siasgnet_VBL.uasg u ON u.numerouasg = gu.numerouasg
--		JOIN Siasgnet_VBL.orgao o ON o.numeroorgao = u.numeroorgaouasg
--	),
--	(
--		SELECT o.numeroorgaovinculado
--		FROM Siasgnet_VBL.gestorcompras g
--		LEFT JOIN Siasgnet_VBL.gestorcomprasuasg gu ON gu.codigogestor = g.codigogestor
--		JOIN Siasgnet_VBL.uasg u ON u.numerouasg = gu.numerouasg
--		JOIN Siasgnet_VBL.orgao o ON o.numeroorgao = u.numeroorgaouasg
--	),
	CASE WHEN o2.numeroorgaovinculado IS NULL THEN o2.numeroorgao
		 WHEN o2.numeroorgaovinculado IS NOT NULL THEN o1.numeroorgaovinculado END AS orgao_max_cod,
	CASE WHEN o2.nome IS NULL THEN o1.nome
		 WHEN o2.nome IS NOT NULL THEN o2.nome END AS orgao_max_nome
FROM Siasgnet_VBL.gestorcompras g
	LEFT JOIN Siasgnet_VBL.gestorcomprasuasg gu ON gu.codigogestor = g.codigogestor
	JOIN Siasgnet_VBL.uasg u ON u.numerouasg = gu.numerouasg
	JOIN Siasgnet_VBL.orgao o1 ON o1.numeroorgao = u.numeroorgaouasg
	LEFT JOIN Siasgnet_VBL.orgao o2 ON o1.numeroorgaovinculado = o2.numeroorgao