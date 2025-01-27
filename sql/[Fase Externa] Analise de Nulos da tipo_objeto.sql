SELECT SUBSTRING(data_hora_inclusao, 1, 7), COUNT(DISTINCT tipo_objeto)
FROM ComprasGov_FaseExterna_VBL.compra c
--WHERE data_hora_inclusao < '2024-08-01'
GROUP BY SUBSTRING(data_hora_inclusao, 1, 7)
ORDER BY SUBSTRING(data_hora_inclusao, 1, 7) DESC;

SELECT SUBSTRING(data_hora_inclusao, 1, 7), tipo_objeto, COUNT(*)
FROM ComprasGov_FaseExterna_VBL.compra c
WHERE data_hora_inclusao > '2024-09-11'
GROUP BY SUBSTRING(data_hora_inclusao, 1, 7), tipo_objeto
ORDER BY SUBSTRING(data_hora_inclusao, 1, 7) DESC;

select count(*), tipo_objeto from
comprasGov_FaseExterna.compra C
where c.data_hora_inclusao = '2024-09-10'
group by tipo_objeto
;

SELECT caracteristica, tipo_objeto, COUNT(*)
FROM ComprasGov_FaseExterna_VBL.compra c
WHERE data_hora_inclusao > '2024-09-11'
GROUP BY tipo_objeto, caracteristica
--ORDER BY SUBSTRING(data_hora_inclusao, 1, 7) DESC
;

SELECT *
FROM ComprasGov_FaseExterna_VBL.compra c
WHERE SUBSTRING(data_hora_inclusao, 1, 7) >= '2023-04'
LIMIT 50000;

SELECT 
	 CASE WHEN tipo_objeto IS NULL THEN True ELSE False END tipo_objeto_null
	,CASE WHEN id_configuracao_sp IS NULL THEN True ELSE False END id_configuracao_sp_null
	,c.*
FROM ComprasGov_FaseExterna_VBL.compra c
WHERE SUBSTRING(data_hora_inclusao, 1, 7) >= '2023-04'
--LIMIT 50000;
;