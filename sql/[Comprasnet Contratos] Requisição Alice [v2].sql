-- Versão Específica Limpa

WITH temp AS (
SELECT
	tipo_id AS instrumento,
	codigosiasg AS uasg,
	CAST(REPLACE(REPLACE(numero, '/', ''), 'NE', '') AS INTEGER) AS numeroano
FROM contratos
)
SELECT
	'instrumento=' || instrumento || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano AS chave_requisicao
FROM temp;
;

-- Versão Genérica

WITH temp AS (
SELECT
--	codigosiasg || '-' || CAST(SUBSTRING(numero, 1, 5) AS INTEGER)|| '/' ||CAST(SUBSTRING(numero, 7, 4) AS INTEGER) AS contratacao,
	tipo_id AS instrumento,
	codigosiasg AS uasg,
	CAST(REPLACE(REPLACE(numero, '/', ''), 'NE', '') AS INTEGER) AS numeroano
--	CASE categoria_id
--		WHEN numero LIKE ('%NE%') THEN CAST(SUBSTRING(numero, 1, 4) AS INTEGER)|| CAST(SUBSTRING(numero, 7, 6) AS INTEGER) 
--		WHEN numero LIKE ('%/%') THEN CAST(SUBSTRING(numero, 1, 5) AS INTEGER)|| CAST(SUBSTRING(numero, 7, 4) AS INTEGER)
--		ELSE numero END
--		AS numeroano
--	REPLACE(REPLACE(numero, '/', ''), 'NE', '') numeroano
FROM contratos
)
SELECT
--	'contratacao=' || contratacao || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano || '&' || 'instrumento=' || instrumento AS chave_requisicao
	'instrumento=' || instrumento || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano AS chave_requisicao
FROM temp;
;


-- Teste 1: Todos os valores das tabelas codigo e codigosiasg são iguais 
SELECT *
FROM ComprasnetContrato_vbl.contratos
WHERE codigo != codigosiasg
ORDER BY id DES;