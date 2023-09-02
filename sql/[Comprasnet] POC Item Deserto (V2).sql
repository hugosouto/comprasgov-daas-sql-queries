SELECT 
	 pri.ipgCod 			cod_pregao_item
	,pr.prgCod 				cod_pregao
	,pr.coduasg				cod_uasg
	,u.uf 					uf_uasg
	,u.codOrgao 			cod_orgao
	,pr.numprp 				num_pregao
	,pri.ipgItem 			num_item
	,pr.prgDataAbertura 	dt_hr_abertura_sp
	,pri.ipgIdentMat 		tp_material
	,pri.codmat 			cod_material
	,CASE
		WHEN pri.ipgIdentMat = 'M' AND im.CODIGO_PDM IS NOT NULL THEN im.CODIGO_PDM
		WHEN pri.ipgIdentMat = 'M' AND im.CODIGO_PDM IS NULL THEN im2.CODIGO_PDM
		WHEN pri.ipgIdentMat = 'S' THEN sv.codgrpserv
		ELSE pri.codmat END cod_pdm_grupo
	,pri.ipgQuantidade 		qt_item
	,pr.prgStatus 			cod_status_pregao -- 0 – fechado / 1 – aberto / 2 – homologado / 3 – suspenso / 4 – deserto 
	,CASE WHEN pri.ipgCodGrupo IS NOT NULL THEN True ELSE False END 	in_agrupado
--	,pri.spgCod 			cod_status_item -- 5 - Encerrado / 6 - Cancelado / 9 - Homologado / 10 - Cancelado no julgamento / 8 - Adjudicado / 11 - Cancelado na adjudicação / 20 - Em análise           
--	,spi.spgDescricao 		des_status_item
	,pri.ipgTipoBeneficio 	cod_beneficio -- 0 – sem benefício / 1 – exclusividade para ME/EPP / 2 – subcontratação de fornecedores / 3 – cota exclusiva
--	,CASE WHEN pri.ipgTipoBeneficio = '0' THEN False ELSE True END 		in_beneficio
	-- Targets
	,COUNT(DISTINCT ppi.prpCod) 										qt_propostas
	,CASE WHEN COUNT(DISTINCT ppi.prpCod) = 1 THEN True ELSE False END 	in_sem_competicao
	,CASE WHEN COUNT(DISTINCT ppi.prpCod) = 0 THEN True ELSE False END	in_deserto
	-- Campos novos
	,u.nomuasg 				nom_uasg
	,o.NomeOrgao 			nom_orgao
	,pri.ipgValorRef		valor_total
FROM Comprasnet_VBL.tbl_pregaoitem pri
	JOIN Comprasnet_VBL.tbl_Pregao pr ON pri.prgCod = pr.prgCod
	LEFT JOIN Comprasnet_VBL.tbl_PropostaItem ppi ON ppi.ipgCod = pri.ipgCod
	LEFT JOIN Comprasnet_VBL.tbl_Proposta pp ON pr.prgCod = pp.prgCod
	LEFT JOIN Comprasnet_VBL.tb_itens_material im ON im.CODIGO_MATERIAL = pri.codmat
	LEFT JOIN Comprasnet_VBL.tb_itens_material im2 ON im2.CODIGO_PDM = pri.codmat
	LEFT JOIN Comprasnet_VBL.tb_servico sv ON sv.codserv = pri.codmat
	LEFT JOIN Comprasnet_VBL.tbb_StatusPregaoItem spi ON spi.spgCod = pri.spgCod
	LEFT JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = pr.coduasg
	JOIN Comprasnet_VBL.tb_orgao o ON o.codOrgao = u.codOrgao
WHERE 1=1
	AND pri.ipgItem > 0
	AND prgDataAbertura BETWEEN '2023-00-00 00:00:00' AND '2024-00-00 00:00:00'
	AND pr.prgStatus IN (2, 4) -- 2:homologado
	AND pri.spgCod IN (6, 9) -- 6:Cancelado | 9:Homologado
GROUP BY pr.prgCod, pr.coduasg, pr.numprp, pr.prgDataAbertura, pr.prgModoDisputa, pri.ipgCod, pri.ipgItem, pri.codmat, pri.ipgIdentMat, pri.ipgQuantidade, pri.ipgCodGrupo, pri.ipgTipoBeneficio, pr.prgStatus, im.CODIGO_PDM, im2.CODIGO_PDM, sv.codgrpserv, pri.spgCod, spi.spgDescricao, u.nomuasg, u.CodOrgao, u.uf, o.NomeOrgao, pri.ipgValorRef -- o.CodOrgaoVinculado
--HAVING COUNT(DISTINCT ppi.prpCod) = 1
--HAVING (CASE WHEN COUNT(DISTINCT ppi.prpCod) = 0 THEN True ELSE False END = True)
;