SELECT 
	 p.prgCod
	,p.coduasg
	,p.numprp
	,p.prgDataAbertura
	,pi.ipgCod
	,pi.ipgItem
	,pi.codmat
	,pi.ipgIdentMat
	,pi.ipgQuantidade
	,COUNT(DISTINCT ppi.prpCod) prpCod
--	,CASE WHEN ppi.prpCod = 0 THEN True ELSE False END in_deserto
FROM Comprasnet_VBL.tbl_pregaoitem pi
JOIN Comprasnet_VBL.tbl_Pregao p ON pi.prgCod = p.prgCod
LEFT JOIN Comprasnet_VBL.tbl_PropostaItem ppi ON ppi.ipgCod = pi.ipgCod
LEFT JOIN Comprasnet_VBL.tbl_Proposta pp ON p.prgCod = pp.prgCod
WHERE pi.ipgItem > 0
GROUP BY p.prgCod, p.coduasg, p.numprp, p.prgDataAbertura, p.prgModoDisputa, pi.ipgCod, pi.ipgItem, pi.codmat, pi.ipgIdentMat, pi.ipgQuantidade
	,CASE WHEN ppi.prpCod = 0 THEN True ELSE False END