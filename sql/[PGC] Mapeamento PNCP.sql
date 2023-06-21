SELECT
	o.codigo 					AS 'Órgão',
	u.uasg						AS 'Unidade Responsável (UASG)',
	pa.ano						AS 'Ano do Plano',
	i.numeroitem				AS 'Nº Item',
	i.tipo_item					AS 'Tipo do item',
	sub.nome					AS 'Subitem',
	i.codigo_item				AS 'Código do item (Código relacionado ao CATMAT/CATSER)',
	i.descricao					AS 'Descrição do item',
	i.unidade_fornecimento		AS 'Unidade de fornecimento',
	i.tem_vinculacao_item		AS 'Despesa informada é somente para vincular aos aspectos/necessidades orçamentárias',
	i.quantidade_total			AS 'Quantidade estimada',
	i.valor_unitario			AS 'Valor unitário estimado (R$)',
	i.valor_total				AS 'Valor total estimado (R$)',
	i.valor_orcamentario		AS 'Valor orçamentário estimado para o exercício (R$)',
	i.participacao_recurso		AS 'Participação de recursos externos',
	i.acao_orcamentaria			AS 'Ação orçamentária',
	g.nome						AS 'Natureza de Despesa',
	i.renovacao_contrato		AS 'Renovação de contrato',
	i.id_item_vinculado			AS 'Dependência de outro item',
	i.vinculo_orcamentario		AS 'Item Vinculado',
	i.grau_prioridade			AS 'Grau de prioridade',
	i.periodo_estimado			AS 'Data desejada',
	i.id_grupo					AS 'Identificador do grupo',
	g.nome						AS 'Nome do grupo',
	h.situacao					AS 'Situação do Item',
	i.justificativa_contratacao	AS 'Justificativa para aquisição ou contratação',
	i.unidade_responsavel 		AS 'Unidade Requisitante',
	i.email_responsavel			AS 'E-mail',
	i.telefone_responsavel		AS 'Telefone',
	i.cpf_cadastrou
FROM pgc.itens i
	LEFT JOIN pgc.uasgs  u ON i.id_uasg = u.id
	LEFT JOIN pgc.orgaos o ON o.id = u.orgao_id
	LEFT JOIN pgc.grupos g ON g.id = i.id_grupo
	LEFT JOIN pgc.users usr ON usr.cpf = i.cpf_cadastrou
	LEFT JOIN pgc.sub_itens sub ON sub.id = i.id_sub_item
	LEFT JOIN pgc.planos_anuais pa ON pa.id = i.id_plano_anual
	LEFT JOIN pgc.historico_tramitacoes h ON h.id_item = i.id
WHERE
	h.situacao IN ('EN', 'EL')
	AND i.id_uasg IN ('837', '13975')
	AND i.id_plano_anual = 6
;

SELECT *
FROM pgc.itens i LEFT JOIN pgc.uasgs u ON i.id_uasg = u.id
WHERE i.id_uasg IN ('837') -- '13975