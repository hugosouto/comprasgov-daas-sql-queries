SELECT
	id,
	tipo_item,
	id_sub_item,
	quantidade_total,
	codigo_item,
	valor_unitario,
	valor_total,
	id_grupo,
-- 	id_planejamento,grau_prioridade,
	periodo_estimado,
-- 	contratacao_emergencial,
	renovacao_contrato,
-- 	elemento_despesa,capacitacao_servidores,obras_servicos_engenharia,
	unidade_responsavel,
	descricao,
-- 	descricao_detalhada,
	unidade_fornecimento,
-- 	acao_orcamentaria,tem_vinculacao_item,id_item_vinculado,justificativa_contratacao,
	id_plano_anual,
	id_uasg,
-- 	ano_siasg,fornecedor_siasg,numero_contrato_siasg,validade_contrato_siasg,validade_ata_siasg,codigo_item_siasg,descricao_siasg,quantidade_total_siasg,valor_unitario_estimado_siasg,valor_total_estimado_siasg,
	created_at,
	updated_at,
	numeroitem,
-- 	cpf_cadastrou,custeio_investimento,flag,email_responsavel,telefone_responsavel,participacao_recurso,percentual_estimado,importado,data_importacao,
	valor_orcamentario
-- 	id_plano_origem,vinculo_orcamentario,id_uasg_origem,id_item_originou
FROM pgc.itens
WHERE id_plano_anual = 6 -- AND id_uasg = 3797
;

SELECT
	h.situacao,i.id_plano_anual,i.id_uasg,
	CONCAT(i.id_plano_anual, LPAD(i.id_uasg,6,0))						chavepca,
-- 	''																	unidadecnpjorgao,
	u.uasg																unidadecodigo,
	pa.ano																anopca,
	CONCAT(i.id_plano_anual, LPAD(i.id_uasg,6,0), LPAD(i.id,9,0))	 	chavepcaitem,
-- 	''																	chavepca,
	i.numeroitem														numeroitem,
	CASE WHEN i.tipo_item = 'M' THEN 1
		 WHEN i.tipo_item = 'S' THEN 2
		 WHEN i.tipo_item = 'T' THEN 5	
		 END															categoriaitempcaid,
	1																	catalogoid,
-- 	''																	classificacaosuperiorcodigo,
-- 	''																	classificacaosuperiornome,
-- 	''																	pdmcodigo,
-- 	''																	pdmdescricao,
	CASE WHEN i.id_sub_item IN (5,6,10)   THEN 3 -- Material
		 WHEN i.id_sub_item IN (7,8,9,11) THEN 5 -- Serviço
		 END 															classificacaocatalogoid,
	i.codigo_item 														codigoitem, 
	SUBSTRING(i.descricao,1,2048)										descricao,
	SUBSTRING(i.descricao_detalhada,1,2048)								descricaodetalhada, 
-- 	LTRIM(i.unidade_fornecimento)										unidadefornecimento,
	i.quantidade_total													quantidade, 
	i.valor_unitario													valorunitario,
	i.valor_total														valortotal,
	IF(i.valor_orcamentario IS NULL, 0, i.valor_orcamentario) 
																		valororcamentoexercicio,
	CASE WHEN i.renovacao_contrato = 1 THEN "true"
		 WHEN i.renovacao_contrato = 0 THEN "false"
		 ELSE i.renovacao_contrato END 
		 																renovacaocontrato,
	SUBSTRING(i.unidade_responsavel,1,100)	
																		unidaderequisitante,
	DATE(i.periodo_estimado)											datadesejada,
	i.id_grupo															grupocontratacaocodigo,
	g.nome																grupocontratacaonome,
	MAX(h.updated_at) 													situacao_updated_at
FROM (
	SELECT
		id,
		tipo_item,
		id_sub_item,
		quantidade_total,
		codigo_item,
		valor_unitario,
		valor_total,
		id_grupo,
	-- 	id_planejamento,grau_prioridade,
		periodo_estimado,
	-- 	contratacao_emergencial,
		renovacao_contrato,
	-- 	elemento_despesa,capacitacao_servidores,obras_servicos_engenharia,
		unidade_responsavel,
		descricao,
		descricao_detalhada,
		unidade_fornecimento,
	-- 	acao_orcamentaria,tem_vinculacao_item,id_item_vinculado,justificativa_contratacao,
		id_plano_anual,
		id_uasg,
	-- 	ano_siasg,fornecedor_siasg,numero_contrato_siasg,validade_contrato_siasg,validade_ata_siasg,codigo_item_siasg,descricao_siasg,quantidade_total_siasg,valor_unitario_estimado_siasg,valor_total_estimado_siasg,
		created_at,
		updated_at,
		numeroitem,
	-- 	cpf_cadastrou,custeio_investimento,flag,email_responsavel,telefone_responsavel,participacao_recurso,percentual_estimado,importado,data_importacao,
		valor_orcamentario
	-- 	id_plano_origem,vinculo_orcamentario,id_uasg_origem,id_item_originou
	FROM pgc.itens
	WHERE id_plano_anual = 6
	) i
	JOIN pgc.uasgs  u ON i.id_uasg = u.id
	JOIN pgc.planos_anuais pa ON pa.id = i.id_plano_anual
	LEFT JOIN pgc.grupos g ON g.id = i.id_grupo
-- 	JOIN pgc.orgaos o ON o.id = u.orgao_id
-- 	JOIN pgc.users usr ON usr.cpf = i.cpf_cadastrou
-- 	JOIN pgc.sub_itens sub ON sub.id = i.id_sub_item
	JOIN pgc.historico_tramitacoes h ON h.id_item = i.id
WHERE
-- 	(h.situacao LIKE ('EN') OR h.situacao LIKE ('EL'))	
-- 	AND
	i.id_uasg = 837
	AND
	i.id_plano_anual = 6
GROUP BY i.id
;