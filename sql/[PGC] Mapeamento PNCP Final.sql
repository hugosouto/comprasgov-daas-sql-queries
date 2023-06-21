SELECT
-- 	h.situacao,i.id_plano_anual,i.id_uasg,
	CONCAT(i.id_plano_anual, LPAD(i.id_uasg,6,0))						chavepca,
-- 	''																	unidadecnpjorgao,
	u.uasg																unidadecodigo,
	pa.ano																anopca,
	CONCAT(i.id_plano_anual, LPAD(i.id_uasg,6,0), LPAD(i.id,9,0))	 	chavepcaitem,
-- 	''																	chavepca,
	i.numeroitem														numeroitem,
	CASE WHEN i.tipo_item = 'M' THEN 1
		 WHEN i.tipo_item = 'S' THEN 2
		 WHEN i.tipo_item = 'O' THEN 3
		 WHEN i.tipo_item = 'E' THEN 4
		 WHEN i.tipo_item = 'T' THEN 5
		 END															categoriaitempcaid,
	1																	catalogoid,
-- 	''																	classificacaosuperiorcodigo,
-- 	''																	classificacaosuperiornome,
-- 	''																	pdmcodigo,
-- 	''																	pdmdescricao,
	CASE WHEN i.id_sub_item IN (5,6,10) OR i.tipo_item = 'M' THEN 3 					-- Material
		 WHEN i.tipo_item = 'T' AND id_sub_item IS NULL AND codigo_item > 28000 THEN 3	-- Material	
		 WHEN i.id_sub_item IN (7,8,9,11) THEN 5 										-- Serviço
		 WHEN i.id_sub_item IS NULL AND i.tipo_item != 'M' THEN 5						-- Serviço
		 WHEN i.tipo_item = 'T' AND id_sub_item IS NULL AND codigo_item < 28000 THEN 5	-- Serviço
		 ELSE "Nulo" END 												classificacaocatalogoid,
	i.codigo_item 														codigoitem, 
	SUBSTRING(i.descricao,1,2048)										descricao,
	SUBSTRING(i.descricao_detalhada,1,2048)								descricaodetalhada, 
	LTRIM(i.unidade_fornecimento)										unidadefornecimento,
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
FROM pgc.itens i
	JOIN pgc.uasgs  u ON i.id_uasg = u.id
	JOIN pgc.planos_anuais pa ON pa.id = i.id_plano_anual
	LEFT JOIN pgc.grupos g ON g.id = i.id_grupo
-- 	JOIN pgc.orgaos o ON o.id = u.orgao_id
-- 	JOIN pgc.users usr ON usr.cpf = i.cpf_cadastrou
-- 	JOIN pgc.sub_itens sub ON sub.id = i.id_sub_item
	JOIN pgc.historico_tramitacoes h ON h.id_item = i.id
WHERE
-- 	classificacaocatalogoid IS NULL AND
-- 	(h.situacao LIKE ('EN') OR h.situacao LIKE ('EL'))	
-- 	AND
-- 	i.id_uasg = 3797
-- 	AND
	i.id_plano_anual = 6
GROUP BY i.id
;

--------------------------------------------------------------------------------

SELECT 
     CONCAT("[",
          GROUP_CONCAT(
               CONCAT("{name:'",name,"'"),
               CONCAT(",email:'",email,"'}")
          )
     ,"]") 
, -- AS json FROM students WHERE enrolled IS NULL;

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
	," }") , -- AS json 
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