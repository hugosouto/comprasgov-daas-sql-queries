SELECT
	m.numero_item_pncp,
	m.id_material_servico,
	m.id_formalizacao_demanda,
	CASE m.in_tipo 					-- Investigar se há outros tipos de item, como obras.
		WHEN 1 THEN 'Material'
		WHEN 2 THEN 'Serviço'
		ELSE m.in_tipo
		END tx_tipo_item,
	m.tx_codigo,
	m.tx_descricao,
	m.in_quantidade,
	m.valor_unitario,
	in_quantidade * valor_unitario as valor_total,
	CASE m.in_tipo 
		WHEN 1 THEN id_grupo
		WHEN 2 THEN id_classe
		END id_classe_grupo,
	CASE m.in_tipo 
		WHEN 1 THEN tx_nome_grupo
		WHEN 2 THEN tx_nome_classe
		END id_classe_grupo,
--	id_padrao_descritivo,
--	tx_nome_padrao_descritivo,
	f.ano_pca,
	f.dt_data_prevista,
	f.bo_emergencial,
	f.valor_total_estimado,
	f.id_operacao,
	f.nivel_prioridade,	
	a.id_artefato,
	a.nr_ano,
	a.id_uasg,
	CASE a.in_estado 							-- (Comentários abaixo podem estar desatualizados. Investigar se há outros in_estado não decodificados.)
		WHEN 1 THEN 'Excluído'					-- Comum a todos
		WHEN 2 THEN 'Rascunho'					-- Comum a todos
		WHEN 3 THEN 'Em Edição'					-- Comum a todos
		WHEN 4 THEN 'Concluído'					-- ETP, MR
		WHEN 5 THEN 'Publicado'					-- ETP, MR
		WHEN 6 THEN 'Em Andamento'				-- MR
		WHEN 7 THEN 'Devolvido'					-- DFD
		WHEN 8 THEN 'Aguardando Análise' 		-- DFD
		WHEN 9 THEN 'Aguardando Aprovação'		-- PC
		WHEN 10 THEN 'Aprovado'					-- PC, DFD
		WHEN 11 THEN 'Vinculado à contratação' 	-- DFD
		WHEN 12 THEN 'Reprovado' 				-- PC
		ELSE a.in_estado 
		END tx_estado,
	CASE a.in_tipo 
		WHEN 0 THEN 'Estudo Técnico Preliminar'
		WHEN 1 THEN 'Matriz de Riscos'
		WHEN 2 THEN 'Estudo Técnico Preliminar (TIC)'
		WHEN 3 THEN 'Programação e Gestão de Contratações'
		WHEN 4 THEN 'Documento de Formalização de Demanda'
		WHEN 5 THEN 'Processo de Compra'
		WHEN 6 THEN 'Termo de Referência'
	END tx_tipo_artefato,
	a.nm_uasg,
	a.id_unico,
	a.bo_sigiloso,
	a.bo_excluido
FROM Comprasnet_faseinterna_VBL.artefato a
	JOIN Comprasnet_faseinterna_VBL.formalizacao_demanda f ON a.id_artefato = f.id_artefato
	JOIN Comprasnet_faseinterna_VBL.material_servico m ON f.id_formalizacao_demanda = m.id_formalizacao_demanda
 WHERE 1=1
	AND a.in_tipo = 4					-- Filtra por tipo de artefato (4: DFD). Indiferente quando se faz INNER JOIN com a tabela formalizacao_demanda.  
	AND ano_pca = 2023					-- Filtra por ano do PGC.
	AND a.id_uasg = 110404				-- Filtra por UASG.
	AND numero_item_pncp IS NOT NULL 	-- Filtra apenas itens enviados para o PNCP.
--	AND in_estado != 1					-- Filtra por status deitens enviados para o PNCP.
--	AND id_classe BETWEEN 8905 AND 8970 -- Filtra por grupo de material 'Subsitência'.
ORDER BY
	m.numero_item_pncp;					-- Ordena pela ordem de exibição no PNCP.