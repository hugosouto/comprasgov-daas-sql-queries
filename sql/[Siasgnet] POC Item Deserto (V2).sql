SELECT 
	 pr.prgCod cod_pregao
	,pri.ipgCod cod_pregai_item
	,pr.coduasg	cod_uasg
	,pr.numprp num_pregao
	,pri.ipgItem num_item
	,pr.prgDataAbertura dt_hr_abertura_sp
	,pri.ipgIdentMat tp_material
	,pri.codmat cod_material
	,CASE 
		WHEN pri.ipgIdentMat = 'M' AND im.CODIGO_PDM IS NOT NULL THEN im.CODIGO_PDM
		WHEN pri.ipgIdentMat = 'M' AND im.CODIGO_PDM IS NULL THEN im2.CODIGO_PDM
		WHEN pri.ipgIdentMat = 'S' THEN sv.codgrpserv 
		ELSE pri.codmat END cod_pdm_grupo
	,pri.ipgQuantidade qt_item
	,pr.prgStatus cod_status_pregao -- 0 – fechado / 1 – aberto / 2 – homologado / 3 – suspenso / 4 – deserto 
	,pri.ipgTipoBeneficio cod_beneficio -- 0 – sem benefício / 1 – exclusividade para ME/EPP / 2 – subcontratação de fornecedores / 3 – cota exclusiva
	,COUNT(DISTINCT ppi.prpCod) qt_propostas
	,CASE WHEN COUNT(DISTINCT ppi.prpCod) = 0 THEN True ELSE False END in_deserto
	,pri.spgCod status_item
	,CASE WHEN pri.spgCod = 177 THEN True ELSE False END in_deserto2
	,CASE WHEN pri.ipgCodGrupo IS NOT NULL THEN True ELSE False END in_agrupado
	,CASE WHEN pri.ipgTipoBeneficio = '0' THEN False ELSE True END in_beneficio
FROM Comprasnet_VBL.tbl_pregaoitem pri
	JOIN Comprasnet_VBL.tbl_Pregao pr ON pri.prgCod = pr.prgCod
	LEFT JOIN Comprasnet_VBL.tbl_PropostaItem ppi ON ppi.ipgCod = pri.ipgCod
	LEFT JOIN Comprasnet_VBL.tbl_Proposta pp ON pr.prgCod = pp.prgCod
	LEFT JOIN Comprasnet_VBL.tb_itens_material im ON im.CODIGO_MATERIAL = pri.codmat
	LEFT JOIN Comprasnet_VBL.tb_itens_material im2 ON im2.CODIGO_PDM = pri.codmat
	LEFT JOIN Comprasnet_VBL.tb_servico sv ON sv.codserv = pri.codmat
WHERE 1=1
	AND pri.ipgItem > 0
	AND prgDataAbertura BETWEEN '2020-00-00 00:00:00' AND '2021-00-00 00:00:00'
	AND pr.prgStatus IN (1, 2, 3, 4)
	AND pri.spgCod NOT IN (1, 6)
GROUP BY pr.prgCod, pr.coduasg, pr.numprp, pr.prgDataAbertura, pr.prgModoDisputa, pri.ipgCod, pri.ipgItem, pri.codmat, pri.ipgIdentMat, pri.ipgQuantidade, pri.ipgCodGrupo, pri.ipgTipoBeneficio, pr.prgStatus, im.CODIGO_PDM, im2.CODIGO_PDM, sv.codgrpserv, pri.spgCod
--	,CASE WHEN ppi.prpCod = 0 THEN True ELSE False END
;