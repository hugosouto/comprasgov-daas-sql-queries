SELECT 
	"it_co_orgao",
	"it_co_ug",
	"it_co_gestao",
	"it_nu_patrimonial",
	"it_va_liq_bem",
	"it_co_item_material",
	"it_co_conta_contabil",
	"it_co_tipo_bem",
	"it_no_tipo_bem",
	"it_co_situacao",
	"it_no_situacao",
	"it_da_tombamento",
	"it_co_destinacao",
	"it_no_destinacao",
	"it_no_material",
    CASE
--		WHEN NOT it_co_ug > 0 THEN True
--		WHEN NOT it_in_status = 'A' THEN True
		WHEN NOT it_co_destinacao NOT IN (6, 12, 13, 15, 17, 23, 39) THEN True
		WHEN NOT it_co_tipo_bem != 3 THEN True
		WHEN NOT it_nu_patrimonial NOT IN (713900, 713918, 713919, 6384300, 6384306, 6384307, 6384418, 6384419, 6384420, 6384421, 6384423, 19365614) THEN True 
		WHEN NOT it_co_conta_contabil BETWEEN 123110001 AND 123119999 THEN True
		WHEN NOT it_co_conta_contabil NOT IN (123110900) THEN True -- ARMAMENTOS
		WHEN NOT it_da_tombamento <= to_char(CURRENT_DATE, 'YYYYMMDD')::integer THEN True
	ELSE False END "in_excluido"
FROM "siads_ger_pt_me"."siads_ext_patrim"
WHERE 1=1
	AND it_co_ug > 0
    AND it_in_status = 'A'
--    AND it_co_destinacao NOT IN (6, 12, 13, 15, 17, 23, 39)
--    AND it_co_tipo_bem != 3 
--    AND it_nu_patrimonial NOT IN (713900, 713918, 713919, 6384300, 6384306, 6384307, 6384418, 6384419, 6384420, 6384421, 6384423, 19365614) 
--    AND it_co_conta_contabil BETWEEN 123110001 AND 123119999
--    AND it_co_conta_contabil NOT IN (123110900) --ARMAMENTOS
--    AND it_da_tombamento <= to_char(CURRENT_DATE, 'YYYYMMDD')::integer
    ;