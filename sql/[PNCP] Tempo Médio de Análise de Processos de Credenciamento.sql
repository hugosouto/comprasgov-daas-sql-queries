--------------------------------------- Consulta Base
SELECT usuarioanaliseprocessoid,datainclusao,dataanaliseprocesso
FROM PNCP_VBL.credenciamento;

--------------------------------------- Consulta Total

SELECT
	usuarioanaliseprocessoid,
	CAST(SUBSTRING(datainclusao,1,10) AS DATE) datainclusao,
	CAST(SUBSTRING(dataanaliseprocesso,1,10) AS DATE) dataanaliseprocesso,
	TIMESTAMPDIFF(sql_tsi_day,datainclusao,dataanaliseprocesso) tempoanalisemedio
FROM
	credenciamento
WHERE
	usuarioanaliseprocessoid IN (95, 2)
ORDER BY
	TIMESTAMPDIFF(sql_tsi_day,datainclusao,dataanaliseprocesso) DESC;

--------------------------------------- Consulta Média

SELECT
	u.nomerazaosocial,
	usuarioanaliseprocessoid,
	AVG(TIMESTAMPDIFF(sql_tsi_day,c.datainclusao,c.dataanaliseprocesso)) tempoanalisemedio
FROM
	credenciamento c
	JOIN PNCP_VBL.usuario u ON c.usuarioanaliseprocessoid = u.id
WHERE
	usuarioanaliseprocessoid IN (95, 2)
GROUP BY
	usuarioanaliseprocessoid,u.nomerazaosocial;
