-- Versão Genérica
WITH temp AS (
SELECT
	codigosiasg || '-' || CAST(SUBSTRING(numero, 1, 5) AS INTEGER)|| '/' ||CAST(SUBSTRING(numero, 7, 4) AS INTEGER) AS contratacao,
	codigosiasg AS uasg,
	CAST(SUBSTRING(numero, 1, 5) AS INTEGER)|| CAST(SUBSTRING(numero, 7, 4) AS INTEGER) AS numeroano,
	tipo_id AS instrumento
--	'CC' AS fase
FROM contratos
)
SELECT
	'contratacao=' || contratacao || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano || '&' || 'fase=' || fase || '&' || 'tipo=' || tipo AS chave_requisicao
FROM temp
;


-- Teste 1: Todos os valores das tabelas codigo e codigosiasg são iguais 
SELECT *
FROM ComprasnetContrato_vbl.contratos
WHERE codigo != codigosiasg
ORDER BY id DESC;