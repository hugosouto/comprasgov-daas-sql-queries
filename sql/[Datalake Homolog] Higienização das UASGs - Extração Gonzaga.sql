----- siasg_orgaos
SELECT * 
FROM seges_delog_cgscg_stage.dbo.siasg_orgaos
--WHERE 
--	IT_IN_STATUS != '*'				-- Somente UASG�s com (in_status = diferente de �*� ? UASG�s Ativa;			
;

----- siasg_uasgs
SELECT * 
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs
--WHERE 
--	IT_IN_STATUS != '*'				-- Somente UASG�s com (in_status = diferente de �*� ? UASG�s Ativa;
--	AND IT_IN_ADESAO_SIASG = 'S'	-- Somente  UASG�s com it_in_adesao_siasg = �S� ?Aderiu ao SIASG
--	AND IT_IN_USO_SISG_UASG = 'N'	-- Somente UASG�s com it_in-uso_sisg_uasg = �N� ? UASG�s n�o SISG			
;

----- siasg_uasgs_orgaos
SELECT * 
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos
;