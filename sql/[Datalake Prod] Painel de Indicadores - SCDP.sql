SELECT
	CONCAT(dt.ano, RIGHT(CONCAT(REPLICATE('0', 2), dt.mes), 2)) AS anomes,
	AVG(fb.vr_tarifa_praticada_bilhete + fb.vr_taxa_embarque_bilhete) AS valormedionacional,
	CONVERT(DATE, GETDATE()) AS dataregisto --REPLACE(LEFT(CONVERT(DATE, GETDATE()), 7), '-', '')
FROM DM_SCDP.dbo.ft_bilhete AS fb
	JOIN DM_SCDP.dbo.dm_data AS dt 							ON dt.id = fb.id_dm_data_emissao_bilhete
	JOIN DM_SCDP.dbo.dm_tipo_viagem_internacional AS vi 	ON vi.id = fb.id_dm_tipo_da_viagem_internacional
	JOIN DM_SCDP.dbo.dm_meio_transporte AS t 				ON t.id = fb.id_dm_meio_transporte
	JOIN DM_SCDP.dbo.dm_info_viagem AS iv 					ON iv.id = fb.id_dm_info_viagem
WHERE
    t.codigo_meio_transporte = 1 AND dt.ano = 2021 AND fb.id_dm_custo_viagem = 1 AND fb.id_dm_data_inicio_viagem <> 1 AND vi.id = 2
GROUP BY vi.id, dt.ano, dt.mes;

SELECT
	CONCAT(dt.ano, RIGHT(CONCAT(REPLICATE('0', 2), dt.mes), 2)) AS anomes,
	AVG(fb.vr_tarifa_praticada_bilhete + fb.vr_taxa_embarque_bilhete) AS valormedionacional,
	CONVERT(DATE, GETDATE()) AS dataregisto --REPLACE(LEFT(CONVERT(DATE, GETDATE()), 7), '-', '')
FROM DM_SCDP.dbo.ft_bilhete AS fb
	JOIN DM_SCDP.dbo.dm_data AS dt 							ON dt.id = fb.id_dm_data_emissao_bilhete
	JOIN DM_SCDP.dbo.dm_tipo_viagem_internacional AS vi 	ON vi.id = fb.id_dm_tipo_da_viagem_internacional
	JOIN DM_SCDP.dbo.dm_meio_transporte AS t 				ON t.id = fb.id_dm_meio_transporte
	JOIN DM_SCDP.dbo.dm_info_viagem AS iv 					ON iv.id = fb.id_dm_info_viagem
WHERE
    t.codigo_meio_transporte = 1 AND dt.ano = 2021 AND fb.id_dm_custo_viagem = 1 AND fb.id_dm_data_inicio_viagem <> 1 AND vi.id = 2
GROUP BY vi.id, dt.ano, dt.mes