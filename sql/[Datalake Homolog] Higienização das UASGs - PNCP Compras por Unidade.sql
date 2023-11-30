---------- CONSULTA GERAL ---------------------------------
SELECT u.*, p.compras AS 'COMPRAS'
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos u
JOIN seges_delog_cgscg_stage.dbo.pncp_compras_por_unidade p
	ON RIGHT(REPLICATE('0', 10) + CAST(u.IT_CO_UNIDADE_GESTORA AS VARCHAR), 10) = 
	   RIGHT(REPLICATE('0', 10) + CAST(p.codigounidade AS VARCHAR), 10)
;

---------- CONSULTA COM FILTRO DE ORGAOS ------------------
SELECT u.*, p.compras AS 'COMPRAS'
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos u
JOIN seges_delog_cgscg_stage.dbo.pncp_compras_por_unidade p
	ON RIGHT(REPLICATE('0', 10) + CAST(u.IT_CO_UNIDADE_GESTORA AS VARCHAR), 10) = 
	   RIGHT(REPLICATE('0', 10) + CAST(p.codigounidade AS VARCHAR), 10)
WHERE u.IT_CO_ORGAO IN (93120,93220,93320,93420,93520,93620,93720,94120,94220,94320,94420,94520,94620,94720,94820,94920,95120,95220,95320,95420,96120,96220,96320,97120,97220,97320,97400)
;