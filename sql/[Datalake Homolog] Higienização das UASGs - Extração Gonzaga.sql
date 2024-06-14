----- siasg_orgaos
SELECT * 
FROM seges_delog_cgscg_stage.hierarquia_uasgs.siasg_orgaos
--WHERE 
--	IT_IN_STATUS != '*'				-- Somente UASG�s com (in_status = diferente de �*� ? UASG�s Ativa;			
ORDER BY IT_CO_ORGAO;

----- siasg_uasgs
SELECT * 
FROM seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs
--WHERE 
--	IT_IN_STATUS != '*'				-- Somente UASG�s com (in_status = diferente de �*� ? UASG�s Ativa;
--	AND IT_IN_ADESAO_SIASG = 'S'	-- Somente  UASG�s com it_in_adesao_siasg = �S� ?Aderiu ao SIASG
--	AND IT_IN_USO_SISG_UASG = 'N'	-- Somente UASG�s com it_in-uso_sisg_uasg = �N� ? UASG�s n�o SISG			
ORDER BY IT_CO_UNIDADE_GESTORA;

----- siasg_uasgs_orgaos
SELECT * 
FROM seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs_orgaos
ORDER BY IT_CO_UNIDADE_GESTORA;

----- PNCP
SELECT COALESCE(p.compras, 0) AS 'COMPRAS'
	,IT_IN_STATUS
	,IT_NU_CGC_CPF
	,IT_CO_UNIDADE_GESTORA
	,IT_NO_UNIDADE_GESTORA
	,IT_IN_USO_SISG_UASG
	,IT_IN_ADESAO_SIASG
	,IT_SG_UF
	,SG_UF
	,IT_CO_MUNICIPIO
	,NOME_MUN_SIASG
	,NOME_MUN_IBGE
	,IT_CO_ORGAO
	,IT_NO_ORGAO
	,IT_NO_MNEMONICO
	,IT_NU_CGC_CPF_ORGAO
	,IT_IN_STATUS_ORGAO
	,IT_IN_TIPO_ADMINISTRACAO
	,IT_IN_TIPO_PODER
	,IT_IN_ESFERA
	,IT_CO_ORGAO_VINCULADO
	,IT_NO_ORGAO_VINCULADO
	,iT_CO_ORGAO_SUPERIOR
	,IT_NO_ORGAO_SUPERIOR
	,IT_CO_UNIDADE_POLO
	,IT_NO_UNIDADE_GESTORA_POLO
	,IT_CO_UNIDADE_ESPELHO
	,IT_NO_UNIDADE_GESTORA_ESPELHO
	,IT_IN_UASG_CADASTRADORA
	,IT_DA_MOVIMENTO
	,IT_DA_IMPLANTACAO_SIDEC
FROM seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs_orgaos u
LEFT JOIN seges_delog_cgscg_stage.hierarquia_uasgs.pncp_compras_por_unidade p
	ON RIGHT(REPLICATE('0', 10) + CAST(u.IT_CO_UNIDADE_GESTORA AS VARCHAR), 10) = 
	   RIGHT(REPLICATE('0', 10) + CAST(p.codigounidade AS VARCHAR), 10)
WHERE 1=1
	AND u.IT_CO_ORGAO IN (93120,93220,93320,93420,93520,93620,93720,94120,94220,94320,94420,94520,94620,94720,94820,94920,95120,95220,95320,95420,96120,96220,96320,97120,97220,97320,97400)
ORDER BY IT_CO_UNIDADE_GESTORA;