SELECT 
	CASE
		WHEN codigo_grupo IN (15) 				THEN 'AVIAÇÃO'
		WHEN codigo_classe IN (8905) 			THEN 'CARNES, AVES E PEIXES'
		WHEN codigo_classe IN (8915) 			THEN 'HORTIFRUTIS'
		WHEN codigo_classe IN (9130,9140,9150) 	THEN 'COMBUSTÍVEIS E LUBRIFICANTES'
		WHEN codigo_pdm IN (19586) 				THEN 'OVO'
		WHEN codigo_pdm IN (3043,880,19690) 	THEN 'ARROZ'
		WHEN codigo_pdm IN (890) 				THEN 'FEIJÃO'
		WHEN codigo_pdm IN (12182)				THEN 'SOJA'
	END	AS categoria
	, *
FROM catalogo.pdm p
WHERE 1=1 
	AND (codigo_grupo IN (89) 
		AND (codigo_pdm IN (19586,3043,880,19690,890,12182)	
		OR codigo_classe IN (8905,8915))) 
	OR codigo_grupo IN (15,91)
	-- Decode codigo_grupo: 15=AVIAÇÃO | 89=SUBSISTÊNCIA | 91=COMBUSTÍVEIS, LUBRIFICANTES, ÓLEOS E CERAS
	-- Decode codigo_classe: 8905="CARNES, AVES E PEIXES | 8915=FRUTAS, VERDURAS E LEGUMES
	-- Decode codigo_pdm: 19586=OVO | 3043,880,19690=ARROZ | 890=FEIJÃO | 12182=SOJA
	--	AND (p.nome_classe LIKE '%SOJA%' OR p.nome_pdm LIKE '%SOJA%')