-- Versão Genérica
WITH temp AS (
SELECT
	numero_uasg || '-' || numero_compra || '/' || ano_compra AS contratacao,
	numero_uasg AS uasg,
	CAST(numero_compra || ano_compra AS INTEGER) AS numeroano,
	codigo_modalidade AS modalidade
--	'FE' AS fase
FROM compra
)
SELECT
	'contratacao=' || contratacao || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano || '&' || 'fase=' || fase || '&' || 'tipo=' || tipo AS chave_requisicao
FROM temp
;