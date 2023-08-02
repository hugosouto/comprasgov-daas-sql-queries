SELECT *
FROM Comprasnet_VBL.tbl_PregaoConfiguracaoSessaoPublica
WHERE prgcod IS NULL
ORDER BY dataInclusao
;

SELECT
	CASE 
		WHEN prgcod IS NULL THEN 'NULL'
		ELSE 'NOT NULL'		
	END AS nullity,
	COUNT(*) AS count
FROM Comprasnet_VBL.tbl_PregaoConfiguracaoSessaoPublica
GROUP BY 
	CASE 
		WHEN prgcod IS NULL THEN 'NULL'
		ELSE 'NOT NULL'		
	END
ORDER BY COUNT(*) DESC
;