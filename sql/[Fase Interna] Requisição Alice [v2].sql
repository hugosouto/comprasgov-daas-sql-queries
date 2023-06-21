-- *** Observações: as observações estão comentadas APÓS a linha de código a qual se refere. ***


-- Versão Específica: Fase Interna

--WITH temp AS (
SELECT
	id_uasg AS uasg,
	CAST(REPLACE(tx_descricao, '/', '') AS INTEGER) AS numeroano,
	--- Sugestões de nome alternativo: id, sequencial, numeroano, num_ano, num.
--	CAST(REPLACE(CONCAT(id_uasg, tx_descricao), '/', '') AS BIGINT) AS contratacao,
	--- Campo artificial, criado com o sequencial do próprio artefato ao invés do 'id_artefato_contratacao', que ainda não está disponível no DaaS.in_tipo AS artefato.
	--- Verificar se é possível obter essa chave por dentro da base.
	in_tipo AS artefato,
	--- Decidir entre código numérico ou decodificação do tipo do artefato.
	CASE in_tipo
		WHEN 0 THEN 'ETP' 		-- Estudo Técnico Preliminar
		WHEN 1 THEN 'MR' 		-- Matriz de Riscos 
		WHEN 2 THEN 'ETPTIC' 	-- Estudo Técnico Preliminar (TIC) 
		WHEN 3 THEN 'PGC' 		-- Programação e Gestão de Contratações
		WHEN 4 THEN 'DFD' 		-- Documento de Formalização de Demanda 
		WHEN 5 THEN 'PC'		-- Processo de Compra
		WHEN 6 THEN 'TR' 		-- Termo de Referência
		-- WHEN 7 THEN 'ED' 	-- Edital (inativo)
		END artefato
	--- Campo decodificado de in_tipo
FROM artefato
--)
--SELECT
--	'id=' || id || '&' || 'uasg=' || uasg || '&' || 'numeroano=' || numeroano || '&' || 'fase=' || fase || '&' || 'tipo=' || tipo AS chave_requisicao
--FROM temp
;

----------------------------------------------------------------------------------

-- Test in_tipo values

SELECT DISTINCT in_tipo FROM Comprasnet_faseinterna_VBL.artefato ORDER BY in_tipo;


-- Decode artefato.in_tipo

--	CASE a.in_tipo
--		WHEN 0 THEN 'ETP' 		-- "Estudo Técnico Preliminar"
--		WHEN 1 THEN 'MR' 		-- "Matriz de Riscos" 
--		WHEN 2 THEN 'ETPTIC' 	-- "Estudo Técnico Preliminar (TIC)" 
--		WHEN 3 THEN 'PGC' 		-- "Programação e Gestão de Contratações" 
--		WHEN 4 THEN 'DFD' 		-- "Documento de Formalização de Demanda" 
--		WHEN 5 THEN 'PC'		-- "Processo de Compra"
--		WHEN 6 THEN 'TR' 		-- "Termo de Referência"
--		END artefato,


-- Cleaning snippets

--	CAST(SUBSTRING(LPAD(id_unico, 18, 0), 1, 6) AS INTEGER)||CAST(SUBSTRING(REPLACE(LPAD(id_unico, 18, 0), '/', ''), 7) AS INTEGER) AS contratacao, -- V1: string
--	CAST(REPLACE(LPAD(id_unico, 18, 0), '/', '') AS INTEGER) AS contratacao, -- V2: integer


-- Check indentifiness

SELECT
	id_uasg AS uasg,
	CAST(REPLACE(CONCAT(id_uasg, tx_descricao), '/', '') AS BIGINT) AS contratacao,
	tx_descricao AS sequencial,
	in_tipo AS artefato
FROM artefato
WHERE 1=1
	AND id_uasg IN 											(158195)
--	AND id_artefato_contratacao = 							(?)
--	AND CAST(REPLACE(tx_descricao, '/', '') AS INTEGER) IN 	(32021)
	AND tx_descricao IN										('3/2021')
	AND in_tipo IN 											(0)
;


-- Count artifacts by UASG

SELECT
	id_uasg AS uasg,
	in_tipo AS artefato,
	COUNT(tx_descricao) AS conta_artefatos
FROM artefato
GROUP BY id_uasg, in_tipo
ORDER BY COUNT(tx_descricao) DESC
;


-- Filter artifacts by UASG

SELECT
	id_uasg AS uasg,
	in_tipo AS tipo_artefato,
	tx_descricao AS artefato
FROM artefato
WHERE 1=1
	AND id_uasg = 153065
	AND in_tipo = 4
;
-- Issues

-- O problema de usar modalidade é que pertence apenas ao domínio da fase externa.
-- A alternativa sugerida é utilizar