SELECT
	m.numero_item_pncp,
	m.id_material_servico,
	m.id_formalizacao_demanda,
--	m.in_tipo,
	CASE m.in_tipo 
		WHEN 1 THEN 'Material'
		WHEN 2 THEN 'Serviço'
		ELSE m.in_tipo
		END tx_tipo_item,
	tx_codigo,
	m.tx_descricao,
	in_quantidade,
	valor_unitario,
	in_quantidade*valor_unitario as valor_total,
	CASE
		WHEN THEN id_grupo
		WHEN THEN tx_nome_grupo
	id_classe,
	tx_nome_classe,
--	id_padrao_descritivo,
	tx_nome_padrao_descritivo,
	ano_pca,
	dt_data_prevista,
	bo_emergencial,
	valor_total_estimado,
	f.id_operacao,
	nivel_prioridade,	
	a.id_artefato,
	nr_ano,
	id_uasg,
--	in_estado,
	CASE in_estado 
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
	END tx_estado,
	a.in_tipo,
	CASE a.in_tipo 
		WHEN 0 THEN 'Estudo Técnico Preliminar'
		WHEN 1 THEN 'Matriz de Riscos'
		WHEN 2 THEN 'Estudo Técnico Preliminar (TIC)'
		WHEN 3 THEN 'Programação e Gestão de Contratações'
		WHEN 4 THEN 'Documento de Formalização de Demanda'
		WHEN 5 THEN 'Processo de Compra'
		WHEN 6 THEN 'Termo de Referência'
	END tx_tipo_artefato,
	nm_uasg,
	id_unico,
	bo_sigiloso,
	bo_excluido
FROM Comprasnet_faseinterna_VBL.material_servico m
	JOIN Comprasnet_faseinterna_VBL.formalizacao_demanda f ON f.id_formalizacao_demanda = m.id_formalizacao_demanda
	JOIN Comprasnet_faseinterna_VBL.artefato a ON a.id_artefato = f.id_artefato
 WHERE 1=1
	AND a.in_tipo = 4
	AND ano_pca = 2023
	AND a.id_uasg = 110404
-- 	AND id_classe IS NOT NULL 
--	AND id_padrao_descritivo IS NOT NULL
--	AND m.in_tipo IS NOT NULL
--	AND tx_codigo IS NOT NULL
--	AND in_estado != 1
--	AND a.dt_hora_operacao < '2022-07-11 17:42:40.272'
--	AND id_classe BETWEEN 8905 AND 8970 -- Classes do Grupo 'Subsitência'
ORDER BY
	m.id_material_servico DESC
LIMIT 10000
;

-- Colunas sem uso -------------------------------------------------------------------------------------------------
-- id_processo_compra,tx_moeda,id_divisao,tx_nome_divisao,id_secao,tx_nome_secao,id_subclasse,id_grupo,tx_nome_grupo,
-- tx_nome_subclasse,m.id_login_operacao,m.dt_hora_operacao,m.id_operacao,tx_sigla_unidade_fornecimento
-- tx_nome_unidade_fornecimento,numero_item_pncp,numero_ordem_dfd,numero_ordem_contratacao,f.id_formalizacao_demanda
-- f.id_artefato,id_area,tx_justificativa_prioridade,tx_justificativa_emergencial,f.tx_objeto,f.id_login_operacao
-- f.dt_hora_operacao,f.id_uasg_destino,nr_pgc,,cd_validacao,a.id_login_operacao,a.dt_hora_operacao,
-- a.id_operacao,in_viabilidade_contratacao,a.tx_descricao,in_modelo,qt_copiado,nr_dod_dfd,nr_processo_old,
-- nr_artefato,nm_login_operacao,id_login_bloqueado,dt_hora_bloqueio,justificativa_sigilo
-- nr_processo,in_categoria,in_subtipo,a.tx_objeto,categoria_anterior,bo_fora_prazo,a.id_uasg_destino


SELECT COUNT(*)
FROM material_servico m
	JOIN formalizacao_demanda f ON f.id_formalizacao_demanda = m.id_formalizacao_demanda
	JOIN artefato a ON a.id_artefato = f.id_artefato
 WHERE 1=1
--	AND a.in_tipo = 4
--	AND in_estado != 1
 	AND id_classe IS NOT NULL 
	AND id_padrao_descritivo IS NOT NULL
	AND m.in_tipo = 1
--	AND a.dt_hora_operacao < '2022-07-11 17:42:40.272'
	AND id_classe BETWEEN 8905 AND 8970 -- Classes do Grupo 'Subsitência';