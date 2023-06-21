SELECT DISTINCT p.codigoUnidade
FROM seges_delog_cgscg_stage.pgc.pgc2 p
LEFT OUTER JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.codigoUnidade = u.codigounidade
WHERE u.codigounidade IS NULL
;