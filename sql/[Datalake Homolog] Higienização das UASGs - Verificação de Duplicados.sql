SELECT IT_CO_UNIDADE_GESTORA, IT_NO_UNIDADE_GESTORA, COUNT(*) CONTAGEM
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos x
GROUP BY IT_CO_UNIDADE_GESTORA, IT_NO_UNIDADE_GESTORA
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC
;
--------------------------------
WITH temp AS (
	SELECT IT_CO_UNIDADE_GESTORA, IT_NO_UNIDADE_GESTORA, COUNT(*) CONTAGEM
	FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos x
	GROUP BY IT_CO_UNIDADE_GESTORA, IT_NO_UNIDADE_GESTORA
	HAVING COUNT(*) > 1
)
SELECT *
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos t
JOIN temp ON t.IT_CO_UNIDADE_GESTORA = temp.IT_CO_UNIDADE_GESTORA
;

--------------------------------
SELECT * --IT_CO_UNIDADE_GESTORA, IT_NO_UNIDADE_GESTORA, COUNT(*) CONTAGEM
FROM -- seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos x
	(SELECT IT_IN_STATUS,IT_NU_CGC_CPF,IT_CO_UNIDADE_GESTORA,IT_NO_UNIDADE_GESTORA,IT_IN_USO_SISG_UASG,IT_IN_ADESAO_SIASG,IT_DA_MOVIMENTO,IT_DA_IMPLANTACAO_SIDEC,IT_SG_UF,SG_UF,IT_CO_MUNICIPIO,NOME_MUN_SIASG,NOME_MUN_IBGE,IT_CO_UNIDADE_POLO,IT_NO_UNIDADE_GESTORA_POLO,IT_CO_UNIDADE_ESPELHO,IT_NO_UNIDADE_GESTORA_ESPELHO,IT_IN_UASG_CADASTRADORA,IT_IN_STATUS_ORGAO,IT_CO_ORGAO,IT_NO_ORGAO,IT_NO_MNEMONICO,IT_NU_CGC_CPF_ORGAO,IT_CO_ORGAO_VINCULADO,IT_NO_ORGAO_VINCULADO,IT_IN_TIPO_ADMINISTRACAO,IT_IN_TIPO_PODER,IT_IN_ESFERA
		FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos) X
--GROUP BY IT_CO_UNIDADE_GESTORA, IT_NO_UNIDADE_GESTORA
--HAVING COUNT(*) > 1
--ORDER BY COUNT(*) DESC
;