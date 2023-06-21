SELECT
--COUNT(*)
id_material_servico,
m.id_formalizacao_demanda,
--id_processo_compra,
--m.in_tipo,
CASE m.in_tipo 	WHEN 0 THEN 'Material'
				WHEN 1 THEN 'Serviço'
				END tx_tipo,
tx_codigo,
m.tx_descricao,
in_quantidade,
valor_unitario,
--tx_moeda,id_subclasse,tx_nome_subclasse,
id_classe,
tx_nome_classe,
--id_grupo,tx_nome_grupo,id_padrao_descritivo,
tx_nome_padrao_descritivo,
--id_divisao,tx_nome_divisao,id_secao,tx_nome_secao,m.id_login_operacao,m.dt_hora_operacao,m.id_operacao,tx_sigla_unidade_fornecimento,tx_nome_unidade_fornecimento,numero_item_pncp,numero_ordem_dfd,numero_ordem_contratacao,f.id_formalizacao_demanda,f.id_artefato,
ano_pca,
--id_area,
dt_data_prevista,
--tx_justificativa_prioridade,
bo_emergencial,
--tx_justificativa_emergencial,f.tx_objeto,
valor_total_estimado,f.id_operacao,
--f.id_login_operacao,f.dt_hora_operacao,
nivel_prioridade,
--f.id_uasg_destino,
a.id_artefato,
nr_ano,
id_uasg,
--nr_pgc,in_estado,
CASE in_estado 	WHEN 0 THEN 'Estudo Técnico Preliminar'
				WHEN 1 THEN 'Matriz de Riscos'
				WHEN 2 THEN 'Estudo Técnico Preliminar (TIC)'
				WHEN 3 THEN 'Programação e Gestão de Contratações' 
				WHEN 4 THEN 'Documento de Formalização de Demanda'
				WHEN 5 THEN 'Processo de Compra'
				END tx_estado,
a.in_tipo,
CASE a.in_tipo 	WHEN 1 THEN 'Excluído' 					-- Comum a todos
				WHEN 2 THEN 'Rascunho'					-- Comum a todos
				WHEN 3 THEN 'Em Edição'					-- Comum a todos
				WHEN 4 THEN 'Concluído'					-- ETP, MR
				WHEN 5 THEN 'Publicado'					-- ETP, MR
				WHEN 6 THEN 'Em Andamento'				-- MR
				WHEN 7 THEN 'Devolvido'					-- DFD
				WHEN 8 THEN 'Aguardando Análise'		-- DFD
				WHEN 9 THEN 'Aguardando Aprovação'		-- PC
				WHEN 10 THEN 'Aprovado'					-- PC, DFD
				WHEN 11 THEN 'Vinculado à contratação'	-- DFD
				WHEN 12 THEN 'Reprovado'				-- PC
				END tx_tipo,
--cd_validacao,a.id_login_operacao,a.dt_hora_operacao,
--a.id_operacao,in_viabilidade_contratacao,a.tx_descricao,in_modelo,qt_copiado,nr_dod_dfd,nr_processo_old,
--nr_artefato,nm_login_operacao,id_login_bloqueado,dt_hora_bloqueio,
nm_uasg,id_unico,bo_sigiloso,
--justificativa_sigilo,nr_processo,
bo_excluido
--,in_categoria,in_subtipo,a.tx_objeto,categoria_anterior,bo_fora_prazo,a.id_uasg_destino
FROM material_servico m
JOIN formalizacao_demanda f ON f.id_formalizacao_demanda = m.id_formalizacao_demanda
JOIN artefato a ON a.id_artefato = f.id_artefato
--WHERE id_classe IS NOT NULL AND id_padrao_descritivo IS NOT NULL
ORDER BY m.id_material_servico DESC
--LIMIT 10000
