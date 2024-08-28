-- Consulta base para obteção de ETPs

SELECT 
	,CASE a.in_tipo
		WHEN 0 THEN 'ETP' -- "Estudo Técnico Preliminar"
		WHEN 1 THEN 'MR' -- "Matriz de Riscos" 
		WHEN 2 THEN 'ETP_TIC' -- "Estudo Técnico Preliminar (TIC)" 
		WHEN 3 THEN 'PGC' -- "Programação e Gestão de Contratações" 
		WHEN 4 THEN 'DFD' -- "Documento de Formalização de Demanda" 
		WHEN 5 THEN 'PC'-- "Processo de Compra"
		WHEN 6 THEN 'TR' -- "Termo de Referência"
		ELSE a.in_tipo END tx_tipo
	,CASE a.in_estado
		WHEN 1 THEN 'Excluído'					-- Comum a todos
		WHEN 2 THEN 'Rascunho'					-- Comum a todos
		WHEN 3 THEN 'Em Edição'					-- Comum a todos
		WHEN 4 THEN 'Concluído'					-- ETP, MR
		WHEN 5 THEN 'Publicado'					-- ETP, MR
		WHEN 6 THEN 'Em Andamento'				-- MR, DFD
		WHEN 7 THEN 'Devolvido'					-- DFD
		WHEN 8 THEN 'Aguardando Análise' 		-- DFD
		WHEN 9 THEN 'Aguardando Aprovação'		-- PC
		WHEN 10 THEN 'Aprovado'					-- PC, DFD
		WHEN 11 THEN 'Vinculado à contratação' 	-- DFD
		WHEN 12 THEN 'Reprovado' 				-- PC
	ELSE a.in_estado END tx_estado
	,a.*
	,s.*
	,i.*
FROM artefato a
	JOIN secao_artefato s ON a.id_artefato = s.id_artefato
	JOIN item_secao i ON i.id_item_secao = s.id_secao_artefato
WHERE 1=1
	AND a.in_tipo = 0
	AND a.nr_ano = 2021
	AND a.nr_artefato = 42
;