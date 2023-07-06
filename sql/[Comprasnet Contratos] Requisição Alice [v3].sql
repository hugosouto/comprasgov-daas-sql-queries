WITH temp AS (
SELECT
	CASE tipo_id 
		WHEN 60	THEN 'CNT' -- Contrato
		WHEN 61 THEN 'CRE' -- Credenciamento
		WHEN 62 THEN 'CMO' -- Comodato
		WHEN 63 THEN 'ARR' -- Arrendamento
		WHEN 64 THEN 'CNC' -- Concessão
		WHEN 65 THEN 'ADI' -- Termo Aditivo
		WHEN 66 THEN 'ADE' -- Termo de Adesão
		WHEN 67 THEN 'CNV' -- Convênio
		WHEN 68 THEN 'APO' -- Termo de Apostilamento
		WHEN 151 THEN 'EMP' -- Empenho
		WHEN 164 THEN 'OUT' -- Outros
		WHEN 173 THEN 'TED' -- Termo de Execução Descentralizada (TED)
		WHEN 174 THEN 'ACT' -- Acordo de Cooperação Técnica (ACT)
		WHEN 175 THEN 'CMP' -- Termo de Compromisso
		WHEN 191 THEN 'RES' -- Termo de Rescisão
		WHEN 311 THEN 'CCO' -- Carta Contrato
		WHEN 438 THEN 'ENC' -- Termo de Encerramento
		ELSE tipo_id
		END instrumento,
	codigosiasg AS uasg,
	numero numeroano
FROM contratos
)
SELECT
	'instrumento=' || instrumento || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano AS chave_requisicao
FROM temp;
;