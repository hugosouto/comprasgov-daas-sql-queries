SELECT
	codigounidade,
	COUNT(DISTINCT c.id) compras
FROM PNCP_VBL.compra c
JOIN PNCP_VBL.unidadeorgao u
	ON c.unidadeorgaoid =  u.id
GROUP BY codigounidade;