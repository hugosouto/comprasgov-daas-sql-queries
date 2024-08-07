-- itens_desertos_etapa2_joins
SELECT 
	 i.id
	,i.numero_uasg
	,i.codigo_modalidade
	,i.numero_compra
	,i.ano_compra
	,i.numero_item
	,i.criterio_julgamento
	,i.criterio_valor
	,i.valor_estimado
	,i.quantidade_solicitada
	,i.situacao
	,i.orcamento_sigiloso
	,i.fase
	,i.homologado
	,i.tipo
	,i.tipo_item_catalogo
	,i.codigo_item_catalogo
	,i.descricao
	,i.caracteristica
	,i.forma_realizacao
	,i.emergencial
	,i.data_hora_prevista_abertura_sp
	,i.situacao_compra
	,i.part_excl_meepp_ou_equiparadas
	,i.fundamento_legal
	,tipo_objeto
	,u.it_sg_uf
	,u.it_co_orgao
	,u.it_no_orgao
	,u.it_co_orgao_vinculado
	,u.it_no_orgao_vinculado
	,u.it_co_orgao_superior
	,u.it_no_orgao_superior
	,u.it_in_tipo_administracao
	,u.it_in_tipo_poder
	,u.it_in_esfera
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.codigo_grupo
		WHEN 'S' THEN s.codigo_secao
		END codigo_grupo_secao
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.nome_grupo 
		WHEN 'S' THEN s.nome_secao
		END nome_grupo_secao
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.codigo_classe
		WHEN 'S' THEN s.codigo_divisao
		END codigo_classe_divisao
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.nome_classe
		WHEN 'S' THEN s.nome_divisao
		END nome_classe_divisao
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.codigo_pdm
		WHEN 'S' THEN s.codigo_grupo 
		END codigo_pdm_grupo
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.nome_pdm
		WHEN 'S' THEN s.nome_grupo 
		END nome_pdm_grupo
	,cls.md_fornec_por_classe
	,pdm.md_fornec_por_pdm
FROM comprasgov_insights.itens_desertos_etapa1_faseexterna i
	JOIN estrutura.siasg_uasgs_orgaos u ON u.it_co_unidade_gestora = i.numero_uasg
	LEFT JOIN catalogo.item_material m ON i.codigo_item_catalogo = m.codigo_item
	LEFT JOIN catalogo.item_servico s ON i.codigo_item_catalogo = s.codigo_servico
	LEFT JOIN catalogo.pdm_material_fornec pdm ON m.codigo_pdm = pdm.id_itcp_padrao_desc_mat
	LEFT JOIN catalogo.classe_material_fornec cls ON m.codigo_classe = cls.id_itcp_classe_mat_serv	
;

-- itens_desertos_etapa3_consolidada
SELECT
	 CAST(id AS VARCHAR) AS id_item
--	,numero_uasg -- (transformado)
	,codigo_modalidade -- (transformado)
--	,numero_compra -- (pouco impacto)
--	,ano_compra -- (pouco impacto)
	,numero_item
--	,criterio_julgamento -- (valor único)
--	,criterio_valor -- (valor único)
	,valor_estimado
	,quantidade_solicitada
--	,situacao -- (transformado)
--	,orcamento_sigiloso -- (transformado)
--	,fase -- (transformado)
--	,homologado -- (unique value)
--	,tipo -- (transformado)
--	,tipo_item_catalogo -- (transformado)
--	,codigo_item_catalogo -- (transformado)
--	,caracteristica -- (transformado)
--	,forma_realizacao -- (unique value)
--	,emergencial -- (unique value)
--	,data_hora_prevista_abertura_sp
--	,situacao_compra
--	,part_excl_meepp_ou_equiparadas -- (transformado)
--	,fundamento_legal -- (null values)
--	,tipo_objeto -- (null values)
	,it_sg_uf -- (transformado)
--	,it_co_orgao -- (transformado)
--	,it_co_orgao_vinculado -- (transformado)
--	,it_co_orgao_superior -- (transformado)
--	,it_in_tipo_administracao -- (transformado)
--	,it_in_tipo_poder -- (transformado)
--	,it_in_esfera -- (transformado)
--	,codigo_grupo_secao -- (transformado)
--	,codigo_classe_divisao -- (transformado)
--	,codigo_pdm_grupo -- (transformado)
	-- Transformations
	,CASE
		WHEN it_sg_uf IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE') THEN 'NE'
		WHEN it_sg_uf IN ('DF', 'GO', 'MS', 'MT') THEN 'CO'
		WHEN it_sg_uf IN ('ES', 'MG', 'RJ', 'SP') THEN 'SE'
		WHEN it_sg_uf IN ('PR', 'RS', 'SC') THEN 'S'
		WHEN it_sg_uf IN ('AC', 'AM', 'AP', 'PA', 'RO', 'RR', 'TO') THEN 'N'
		ELSE 'Não Identificado'
	 END AS it_sg_regiao
	,CAST(codigo_item_catalogo AS VARCHAR)
	,CAST(codigo_grupo_secao AS VARCHAR)
	,CAST(codigo_classe_divisao AS VARCHAR)
	,CAST(codigo_pdm_grupo AS VARCHAR)
	,CAST(numero_uasg AS VARCHAR)
	,CAST(it_co_orgao AS VARCHAR)
	,CAST(it_co_orgao_vinculado AS VARCHAR)
	,CAST(it_co_orgao_superior AS VARCHAR)
	,CAST(it_in_tipo_administracao AS VARCHAR)
--	,fase_compra
	,CASE WHEN (CASE WHEN orcamento_sigiloso IS NULL THEN 'N' ELSE orcamento_sigiloso END) = 'S' THEN True ELSE False END in_orcamento_sigiloso
	,CASE situacao WHEN '6' THEN True ELSE False END in_deserto
	,CASE tipo WHEN 'S' THEN True WHEN 'I' THEN False END in_agrupado
	,CASE WHEN fase = 'AS' THEN True ELSE False END in_aberto
	,CASE caracteristica WHEN '2' THEN True WHEN '1' THEN False END in_srp
	,CASE part_excl_meepp_ou_equiparadas WHEN 'S' THEN True WHEN 'N' THEN False END in_exclusivo_me_epp
	,CASE WHEN (CASE WHEN it_in_esfera IS NULL THEN 'F' ELSE it_in_esfera END) = 'F' THEN True ELSE False END in_federal
	,CASE it_in_tipo_poder WHEN 0 THEN True ELSE False END in_poder_executivo
	,CASE tipo_item_catalogo WHEN 'S' THEN True ELSE False END in_servico
	,CASE codigo_modalidade WHEN 5 THEN True ELSE False END in_pregao
	-- Text
	,it_no_orgao
	,it_no_orgao_vinculado
	,it_no_orgao_superior
	,nome_grupo_secao
	,nome_classe_divisao
	,nome_pdm_grupo
	,descricao
FROM comprasgov_insights.itens_desertos_etapa2_joins i
	LEFT JOIN catalogo.item_material m ON i.codigo_item_catalogo = m.codigo_item
	LEFT JOIN catalogo.item_servico s ON i.codigo_item_catalogo = s.codigo_servico
WHERE 1=1
--	AND situacao IN ('6')
--	AND data_hora_prevista_abertura_sp < '2023-08-01 00:00:00.000'
--	AND data_hora_prevista_abertura_sp > '2023-08-01 00:00:00.000'
;

-- csv final
SELECT CAST(id_item AS INT),codigo_modalidade,numero_item,valor_estimado,quantidade_solicitada,it_sg_uf,it_sg_regiao,codigo_item_catalogo,codigo_grupo_secao,codigo_classe_divisao,codigo_pdm_grupo,numero_uasg,it_co_orgao,it_co_orgao_vinculado,it_co_orgao_superior,it_in_tipo_administracao,in_orcamento_sigiloso,in_deserto,in_agrupado,in_aberto,in_srp,in_exclusivo_me_epp,in_federal,in_poder_executivo,in_servico,in_pregao
FROM itens_desertos_etapa3_consolidada idec
ORDER BY 1
;