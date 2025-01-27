SELECT m.id_formalizacao_demanda
	, a.id_artefato
	, m.id_material_servico
	, m.in_tipo
	, CASE
		m.in_tipo 
		WHEN 1 THEN 'Material'
        WHEN 2 THEN 'Serviço'
        ELSE m.in_tipo
        END tx_tipo_item
	, m.in_quantidade
	, m.valor_unitario
	, m.in_quantidade * valor_unitario valor_total
	, f.valor_total_estimado
	, f.ano_pca
	, f.dt_data_prevista
	, f.bo_emergencial
	, f.id_operacao
	, f.nivel_prioridade
	, a.nr_ano
	, a.id_uasg
	, a.in_estado
	, CASE a.in_estado 
		WHEN 1 THEN 'Excluído'                  -- Comum a todos
        WHEN 2 THEN 'Rascunho'                  -- Comum a todos
        WHEN 3 THEN 'Em Edição'                 -- Comum a todos
        WHEN 4 THEN 'Concluído'                 -- ETP, MR
        WHEN 5 THEN 'Publicado'                 -- ETP, MR
        WHEN 6 THEN 'Em Andamento'              -- MR, DFD
        WHEN 7 THEN 'Devolvido'                 -- DFD
        WHEN 8 THEN 'Aguardando Análise'        -- DFD
        WHEN 9 THEN 'Aguardando Aprovação'      -- PC
        WHEN 10 THEN 'Aprovado'                 -- PC, DFD
        WHEN 11 THEN 'Vinculado à contratação'  -- DFD
        WHEN 12 THEN 'Reprovado'                -- PC
        END tx_estado
	, a.in_tipo
	, CASE a.in_tipo 
		WHEN 0 THEN 'Estudo Técnico Preliminar'
        WHEN 1 THEN 'Matriz de Riscos'
        WHEN 2 THEN 'Estudo Técnico Preliminar (TIC)'
        WHEN 3 THEN 'Programação e Gestão de Contratações'
        WHEN 4 THEN 'Documento de Formalização de Demanda'
        WHEN 5 THEN 'Processo de Compra'
        WHEN 6 THEN 'Termo de Referência'
        END tx_tipo_artefato
	, a.nm_uasg
	, a.id_unico
	, a.bo_sigiloso
	, a.bo_excluido
	, m.tx_nome_classe
	, m.id_padrao_descritivo
	, m.tx_nome_padrao_descritivo
	, m.tx_codigo tx_codigo_material_servico
	, m.tx_descricao tx_descricao_material_servico
FROM Comprasnet_faseinterna_VBL.material_servico m
    JOIN Comprasnet_faseinterna_VBL.formalizacao_demanda f ON f.id_formalizacao_demanda = m.id_formalizacao_demanda
    JOIN Comprasnet_faseinterna_VBL.artefato a ON a.id_artefato = f.id_artefato
WHERE 1=1
    AND a.in_tipo = 4
--	AND ano_pca = 2023
--	AND tx_codigo IS NOT NULL
--	AND m.in_tipo IS NOT NULL
--	AND a.id_uasg = 110404
-- 	AND id_classe IS NOT NULL 
--	AND id_padrao_descritivo IS NOT NULL
--	AND in_estado != 1
ORDER BY 1
;