WITH temp AS (
	SELECT * FROM Novo_Catalogo_VBL.pdm_material
	WHERE data_hora_atualizacao > '2023-01-01 00:00:00.000' -- AND codigo_inc IS NOT NULL
	ORDER BY nome_pdm
)
SELECT *
FROM Novo_Catalogo_VBL.pdm_material t1
JOIN temp t2 ON t1.codigo_pdm = t2.codigo_pdm
WHERE t1.data_hora_atualizacao < '2023-01-01 00:00:00.000'
