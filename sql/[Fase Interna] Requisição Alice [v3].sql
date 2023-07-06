WITH temp AS (
SELECT
	id_uasg AS uasg,
	CASE in_tipo
		WHEN 0 THEN 'ETP' -- Estudo Técnico Preliminar
		WHEN 1 THEN 'MRI' -- Matriz de Riscos 
		WHEN 2 THEN 'TIC' -- Estudo Técnico Preliminar (TIC) 
		WHEN 3 THEN 'PGC' -- Programação e Gestão de Contratações
		WHEN 4 THEN 'DFD' -- Documento de Formalização de Demanda 
		WHEN 5 THEN 'PCO' -- Processo de Compra
		WHEN 6 THEN 'TRF' -- Termo de Referência
		WHEN 7 THEN 'EDT' -- Edital (inativo)
		ELSE in_tipo 
		END artefato,
	tx_descricao AS numeroano
FROM artefato
)
SELECT
	'artefato=' || artefato || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano AS chave_requisicao	
FROM temp
;