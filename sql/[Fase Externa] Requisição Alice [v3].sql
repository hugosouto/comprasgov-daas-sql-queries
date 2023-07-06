WITH temp AS (
SELECT
	CASE codigo_modalidade
		WHEN 3 THEN 'CCO' -- Concorrência
		WHEN 5 THEN 'PRE' -- Pregão
		WHEN 6 THEN 'DIS' -- Dispensa
		WHEN 20 THEN 'CCU' -- Concurso
		ELSE codigo_modalidade 
		END modalidade,
	numero_uasg AS uasg,
	numero_compra AS numero, 
	ano_compra AS ano
FROM compra
)
SELECT
	'modalidade=' || modalidade || '&' || 'uasg=' || uasg || '&' || 'numero=' || numero || '&' || 'ano=' || ano AS chave_requisicao	
FROM temp
;