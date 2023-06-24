-- Versão Genérica

WITH temp AS (
SELECT
--	numero_uasg || numero_compra || ano_compra AS contratacao,
		/* Campo artificial, criado com o sequencial da própria contratação. Aguardar disponibilização do campo 'id_artefato_contratacao' no DaaS Fase Interna. */
	numero_uasg AS uasg,
	codigo_modalidade AS modalidade,
--	CASE codigo_modalidade
--		WHEN 3 THEN 'CCO' 	-- Concorrência
--		WHEN 5 THEN 'PRG'	-- Pregão
--		WHEN 6 THEN 'DIS' 	-- Dispensa
--		WHEN 20 THEN 'CCU'	-- Concurso
--		ELSE codigo_modalidade
--		END modalidade
		/* Campo decodificado de codigo_modalidade. */
	numero_compra || ano_compra AS numeroano
		/* Sugestões de nome alternativo: id, sequencial, numeroano, num_ano, num. */
FROM compra
)
SELECT
--	'contratacao=' || contratacao || '&' || 'uasg=' || uasg || '&' || 'modalidade=' || modalidade || 'numeroano=' || numeroano AS chave_requisicao
		-- Versão com o campo 'contratação'.
	'modalidade=' || modalidade || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano AS chave_requisicao	
	 	-- Versão sem o campo 'contratação'.
FROM temp
;


----------------------------------------------------------------------------------


-- Test codigo_modalidade values

SELECT DISTINCT codigo_modalidade FROM compra ORDER BY codigo_modalidade;


-- Check indentifiness

SELECT
	numero_uasg AS uasg,
--	numero_uasg || numero_compra || ano_compra AS contratacao,
	CAST(numero_compra || ano_compra AS INTEGER) AS numeroano,
	codigo_modalidade AS modalidade
FROM compra
WHERE 1=1
	AND numero_uasg IN 										(170050)
--	AND CAST(REPLACE(tx_descricao, '/', '') AS INTEGER) IN 	(?)
	AND CAST(numero_compra || ano_compra AS INTEGER) IN		(52023)
	AND codigo_modalidade IN 								(6)
;


-- Count artifacts by UASG

SELECT
	numero_uasg AS uasg,
	codigo_modalidade AS modalidade,
	COUNT(numero_compra || ano_compra) AS conta_compras
FROM compra
GROUP BY numero_uasg, codigo_modalidade
ORDER BY COUNT(numero_compra || ano_compra) DESC
;


-- Filter buyings by UASG

SELECT
	numero_uasg AS uasg,
	codigo_modalidade AS modalidade,
	(numero_compra || ano_compra) AS compra
FROM compra
WHERE 1=1
	AND numero_uasg = 986001
	AND codigo_modalidade = 6
;
