SELECT
	CASE WHEN u.sisg = 'T' THEN 'SISG'
		 WHEN u.sisg = 'F' THEN 'Não SISG' END sisg,
	CASE WHEN o1.codigoesfera = 0 THEN 'Federal'
		 WHEN o1.codigoesfera = 1 THEN 'Estadual'
		 WHEN o1.codigoesfera = 2 THEN 'Municipal' END esfera,
	CASE WHEN o1.codigopoder = 0 THEN 'Executivo'
		 WHEN o1.codigopoder = 1 THEN 'Legislativo'
		 WHEN o1.codigopoder = 2 THEN 'Judiciário' END poder,
--	o1.codigotipoadministracao tipoadm,
	CASE WHEN o1.nome LIKE 'CONS%' AND o1.numeroorgaovinculado IS NULL THEN '-'
		 WHEN o1.numeroorgaovinculado IS NULL THEN o1.numeroorgao
		 WHEN o1.numeroorgaovinculado IS NOT NULL AND o2.numeroorgaovinculado IS NULL THEN o1.numeroorgaovinculado
		 WHEN o1.numeroorgaovinculado IS NOT NULL AND o2.numeroorgaovinculado IS NOT NULL AND o3.numeroorgaovinculado IS NULL THEN o2.numeroorgaovinculado
		 WHEN o1.numeroorgaovinculado IS NOT NULL AND o2.numeroorgaovinculado IS NOT NULL AND o3.numeroorgaovinculado IS NOT NULL AND o4.numeroorgaovinculado IS NULL THEN o3.numeroorgaovinculado END AS orgao_max_cod,
	CASE WHEN o1.nome LIKE 'CONS%' AND o1.numeroorgaovinculado IS NULL THEN 'CONSELHOS SEM ÓRGÃO VINCULADO'
		 WHEN o1.numeroorgaovinculado IS NULL THEN o1.nome
		 WHEN o1.numeroorgaovinculado IS NOT NULL AND o2.numeroorgaovinculado IS NULL THEN o2.nome
		 WHEN o1.numeroorgaovinculado IS NOT NULL AND o2.numeroorgaovinculado IS NOT NULL AND o3.numeroorgaovinculado IS NULL THEN o3.nome
		 WHEN o1.numeroorgaovinculado IS NOT NULL AND o2.numeroorgaovinculado IS NOT NULL AND o3.numeroorgaovinculado IS NOT NULL AND o4.numeroorgaovinculado IS NULL THEN o4.nome END AS orgao_max,
	o1.numeroorgao orgao_cod,
	o1.nome orgao,
	u.numerouasg uasg_cod,
	u.nome uasg,
	g.codigogestor gestor
--	COUNT(DISTINCT g.codigogestor) usuarios_distintos,
--	COUNT(g.codigogestor) usuarios_total
FROM Siasgnet_VBL.gestorcompras g
	LEFT JOIN Siasgnet_VBL.gestorcomprasuasg gu ON gu.codigogestor = g.codigogestor
	JOIN Siasgnet_VBL.uasg u ON u.numerouasg = gu.numerouasg
	JOIN Siasgnet_VBL.orgao o1 ON o1.numeroorgao = u.numeroorgaouasg
	LEFT JOIN Siasgnet_VBL.orgao o2 ON o1.numeroorgaovinculado = o2.numeroorgao
	LEFT JOIN Siasgnet_VBL.orgao o3 ON o2.numeroorgaovinculado = o3.numeroorgao
	LEFT JOIN Siasgnet_VBL.orgao o4 ON o3.numeroorgaovinculado = o4.numeroorgao
--GROUP BY u.sisg, o1.codigoesfera, o1.codigopoder, o1.codigotipoadministracao, o1.numeroorgaovinculado, o1.numeroorgao, o1.nome, o2.numeroorgaovinculado, o2.numeroorgao, o2.nome, o3.numeroorgaovinculado, o3.numeroorgao, o3.nome--, u.numerouasg, u.nome;