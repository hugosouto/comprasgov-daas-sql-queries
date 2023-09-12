SELECT u.*, p.compras AS 'COMPRAS' 
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos u
JOIN seges_delog_cgscg_stage.dbo.pncp_compras_por_unidade p
	ON RIGHT(REPLICATE('0', 10) + CAST(u.IT_CO_UNIDADE_GESTORA AS VARCHAR), 10) = 
	   RIGHT(REPLICATE('0', 10) + CAST(p.codigounidade AS VARCHAR), 10);
	