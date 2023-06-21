SELECT
	o.codigo 					AS 'Órgão',
	u.uasg						AS 'Unidade Responsável (UASG)',
	pa.ano						AS 'Ano do Plano',
	i.numeroitem				AS 'Nº Item',
	i.tipo_item					AS 'Tipo do item',
-- 	sub.nome					AS 'Subitem',
	i.codigo_item				AS 'Código do item', -- (Código relacionado ao CATMAT/CATSER)'
	i.descricao_detalhada		AS 'Descrição do item',
	i.unidade_fornecimento		AS 'Unidade de fornecimento',
-- 	i.tem_vinculacao_item		AS 'Despesa informada é somente para vincular aos aspectos/necessidades orçamentárias',
	i.quantidade_total			AS 'Quantidade estimada',
	i.valor_unitario			AS 'Valor unitário estimado (R$)',
	i.valor_total				AS 'Valor total estimado (R$)',
	i.valor_orcamentario		AS 'Valor orçamentário estimado para o exercício (R$)',
-- 	i.participacao_recurso		AS 'Participação de recursos externos',
-- 	i.acao_orcamentaria			AS 'Ação orçamentária',
	g.nome						AS 'Grupo de Despesa',
	i.renovacao_contrato		AS 'Renovação de contrato',
	i.id_item_vinculado			AS 'Dependência de outro item',
	i.vinculo_orcamentario		AS 'Item Vinculado',
-- 	i.grau_prioridade			AS 'Grau de prioridade',
	i.periodo_estimado			AS 'Data desejada',
	i.id_grupo					AS 'Identificador do grupo',
	g.nome						AS 'Nome do grupo',
-- 	h.situacao					AS 'Situação do Item',
-- 	i.justificativa_contratacao	AS 'Justificativa para aquisição ou contratação',
	i.unidade_responsavel 		AS 'Unidade Requisitante',
-- 	i.email_responsavel			AS 'E-mail',
-- 	i.telefone_responsavel		AS 'Telefone'
	MAX(h.updated_at)
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
GROUP BY i.id
;

SELECT *
FROM pgc.itens i LEFT JOIN pgc.uasgs u ON i.id_uasg = u.id
WHERE i.id_uasg IN ('837') -- '13975
;

--------------------------------------------------------------------------------

SELECT 
     CONCAT("[",
          GROUP_CONCAT(
               CONCAT("{name:'",name,"'"),
               CONCAT(",email:'",email,"'}")
          )
     ,"]") 
AS json FROM students WHERE enrolled IS NULL;

--------------------------------------------------------------------------------
SET SESSION group_concat_max_len=15000;
 
SELECT
	CONCAT("{ ",
		CONCAT("""codigoUnidadeCompradora"": """,u.uasg,""", "),
		CONCAT("""anoPca"": """,pa.ano,""", "),
		CONCAT("""itensPlano"": [ ",
			GROUP_CONCAT(
				CONCAT("{ ""numeroItem"": """,i.numeroitem,""", "),
				CONCAT("""categoriaItemPca"": """,i.tipo_item,""", "),
				CONCAT("""catalogo"": ""","1",""", "),
				CONCAT("""classificacaoCatalogo"": """,i.tipo_item,""", "),
				CONCAT("""codigoCatalogo"": """,i.codigo_item,""", "),
				CONCAT("""descricao"": """,i.descricao_detalhada,""", "),
				CONCAT("""unidadeFornecimento"": """,i.unidade_fornecimento,""", "),
				CONCAT("""quantidade"": """,i.quantidade_total,""", "),
				CONCAT("""valorUnitario"": """,i.valor_unitario,""", "),
				CONCAT("""valorTotal"": """,i.valor_total,""", "),
				CONCAT("""valorOrcamentoExercicio"": """,i.valor_orcamentario,""", "),
				CONCAT("""renovacaoContrato"": """,i.renovacao_contrato,""", "),
				CONCAT("""dataDesejada"": """,i.periodo_estimado,""", "),
				CONCAT("""unidadeRequisitante"": """,i.unidade_responsavel,""", "),
				CONCAT("""grupoContratacaoCodigo"": """,i.id_grupo,""", "),
				CONCAT("""grupoContratacaoNome"": """,g.nome, """ }")
			)
		," ]")
	," }") AS json 
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
-- 	AND i.id_uasg IN ('837', '13975')
	AND i.id_plano_anual = 6
;