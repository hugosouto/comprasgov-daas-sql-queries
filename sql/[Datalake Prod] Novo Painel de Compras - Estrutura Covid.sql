------------------------------------------- Licitações COVID

SELECT
	RIGHT(CONCAT(REPLICATE('0', 6), l.co_uasg), 6) + RIGHT(CONCAT(REPLICATE('0', 2), l.co_modalidade_licitacao), 2) + RIGHT(CONCAT(REPLICATE('0', 9), l.nu_aviso_licitacao), 9) AS COD_COMPRA,
--	RIGHT(CONCAT(REPLICATE('0', 6), l.co_uasg), 6) + RIGHT(CONCAT(REPLICATE('0', 2), l.co_modalidade_licitacao), 2) + RIGHT(CONCAT(REPLICATE('0', 9), l.nu_aviso_licitacao), 9) + RIGHT(CONCAT(REPLICATE('0', 5), li.nu_item_licitacao), 5) AS COD_ITEM,
--	li.nu_item_licitacao AS NUM_ITEM,
--	pp.qt_item AS QUANTIDADE,
--	CASE WHEN li.co_item_material = 0 THEN 'Serviço' ELSE 'Material' END AS TIPO,
--	CASE WHEN li.co_item_material = 0 THEN li.co_item_servico ELSE li.co_item_material END AS CATMAT_CATSER,
--	CASE WHEN li.co_item_material = 0 THEN li.no_item_servico ELSE li.no_item_material END AS ITEM_DESCRICAO,
--	li.no_unidade_medida AS UNIDADE,
--	CASE WHEN pp.qt_item = 0 THEN 0 ELSE pp.vr_total/pp.qt_item END AS PRECO_UNITARIO,
--	pp.vr_total AS VALOR_TOTAL,
--	li.nu_cnpj_fornecedor AS CNPJ,
--	li.no_fornecedor_pj AS RAZAO_SOCIAL,
	'' AS [DATA],
--	SISG
	l.co_uasg AS COD_UASG,
	l.no_uasg AS UASG,
	o.no_orgao AS ORGAO,
	CASE WHEN o.co_tipo_poder = 0 THEN 'Executivo'
		 WHEN o.co_tipo_poder = 1 THEN 'Judiciário'
		 WHEN o.co_tipo_poder = 2 THEN 'Legislativo' END AS PODER,
	CASE WHEN o.co_tipo_esfera = 'F' THEN 'Federal'
		 WHEN o.co_tipo_esfera = 'E' THEN 'Estadual'
		 WHEN o.co_tipo_esfera = 'M' THEN 'Municipal' END AS ESFERA,
	l.sg_uf_municipio AS UF,
	l.no_municipio_uasg AS MUNICIPIO,
	l.no_modalidade_licitacao AS MODALIDADE,
	l.in_pregao_eletronico AS FORMATO,
	l.no_sistema AS SRP,
	LEFT(RIGHT(CONCAT(REPLICATE('0', 9), l.nu_aviso_licitacao), 9), 5) AS NUM_COMPRA,
	RIGHT(l.nu_aviso_licitacao, 4) AS ANO_COMPRA,
	l.nu_processo AS PROCESSO,
	l.tx_objeto_licitacao AS OBJETO
--	LEI_NOME
--	LINK_COMPRA
--	PROCESSO_CONTRATO
--	IT_CO_CONTRATO
--	IT_NU_CONTRATO
--	IT_VA_TOTAL
--	IT_DA_ASSINATURA
--	IT_DA_INICIO_VIGENCIA
--	IT_DA_TERMINO_VIGENCIA
--	NOTA_EMPENHO
--	LINK_EMPENHO
--	LINK_CONTRATO
--	ADITIVOS
--	STATUS_ITEM
FROM dados_abertos.tb_licitacao l
	JOIN dados_abertos.tb_pregao p ON p.co_uasg LIKE l.co_uasg AND l.nu_aviso_licitacao LIKE p.nu_pregao 
--	JOIN dados_abertos.tb_licitacao_item li ON l.co_uasg LIKE li.co_uasg AND l.co_modalidade_licitacao LIKE li.co_modalidade_licitacao AND l.nu_aviso_licitacao LIKE li.nu_aviso_licitacao 
--	JOIN dados_abertos.tb_preco_praticado_item pp ON li.id_licitacao = pp.id_preco_praticado_item AND li.nu_item_licitacao = pp.nu_item_licitacao
	JOIN dados_abertos.tb_orgao o ON l.co_orgao_uasg = o.id_orgao
--	LEFT JOIN dados_abertos_compras.dados_abertos.tb_contrato c ON c.id_licitacao = RIGHT(CONCAT(REPLICATE('0', 6), l.co_uasg), 6) + RIGHT(CONCAT(REPLICATE('0', 2), l.co_modalidade_licitacao), 2) + RIGHT(CONCAT(REPLICATE('0', 9), l.nu_aviso_licitacao), 9)
WHERE l.co_uasg = 130024 AND l.co_modalidade_licitacao = 5 AND dt_homologacao > '2021-01-01 00:00:00' 
;

------------------------------------------- Licitações API - Nacional

SELECT
--	ISN_SIDEC_COMPRA_COM_LICITACAO,
--	in_status_registro,
--	id_licitacao,
	RIGHT(CONCAT(REPLICATE('0', 6), l.co_uasg), 6) + RIGHT(CONCAT(REPLICATE('0', 2), l.co_modalidade_licitacao), 2) + RIGHT(CONCAT(REPLICATE('0', 9), l.nu_aviso_licitacao), 9) AS cod_compra,
	co_uasg,
	no_uasg,
	CASE WHEN co_modalidade_licitacao = 1 THEN 'Convite'
		 WHEN co_modalidade_licitacao = 2 THEN 'Tomada de Preços'
		 WHEN co_modalidade_licitacao = 3 THEN 'Concorrência'
		 WHEN co_modalidade_licitacao = 4 THEN 'Concorrência Internacional'
		 WHEN co_modalidade_licitacao = 5 THEN 'Pregão'
--		 WHEN co_modalidade_licitacao = 6 THEN 'Dispensa de Licitação'
		 WHEN co_modalidade_licitacao = 7 THEN 'Inexigibilidade de Licitação'
		 WHEN co_modalidade_licitacao = 20 THEN 'Concurso'
		 WHEN co_modalidade_licitacao = 22 THEN 'Tomada de Preços por Técnica e Preço'
		 WHEN co_modalidade_licitacao = 33 THEN 'Concorrência por Técnica e Preço'
		 WHEN co_modalidade_licitacao = 44 THEN 'Concorrência Internacional por Técnica e Preço'
		 WHEN co_modalidade_licitacao = 99 THEN 'Regime Diferenciado de Contratações'
	ELSE no_modalidade_licitacao END modalidade_licitacao,
	--	co_modalidade_licitacao,
	--	no_modalidade_licitacao,
	CASE WHEN no_sistema = 'SISRP' THEN 'Registro de Preços'
		 ELSE 'Tradicional' END ind_srp,
	--	no_sistema,
	SUBSTRING(CAST(nu_aviso_licitacao AS VARCHAR), LEN(nu_aviso_licitacao) - 3, 4) ano_licitacao,
	--	RIGHT(RIGHT(CONCAT(REPLICATE('0', 17), id_licitacao), 17), 4) ano_licitacao,
	nu_aviso_licitacao,
	nu_itens,
	ds_situacao_aviso,
	CASE WHEN PATINDEX('Pregão Eletrônico %', tx_objeto_licitacao) = 1 THEN	SUBSTRING(tx_objeto_licitacao, 19, 418)
		 ELSE SUBSTRING(tx_objeto_licitacao, 1, 400) END tx_objeto_licitacao,
--	tx_informacoes_gerais,
	nu_processo,
--	ds_tipo_recurso,
	vr_estimado_total,
	vr_homologado_total,
--	no_responsavel,
--	ds_cargo_responsavel_aviso,
	dt_publicacao,
	dt_entrega_edital,
--	tx_endereco_entrega_edital,
	dt_abertura_proposta,
	dt_entrega_proposta,
--	co_municipio_uasg,
	no_municipio_uasg,
	sg_uf_municipio,
	CONCAT(co_orgao_uasg,' - ',no_orgao_uasg) orgao_uasg
	--	co_orgao_uasg,
	--	no_orgao_uasg,
--	in_pregao_eletronico,
--	dt_alteracao
FROM dados_abertos.tb_licitacao l
WHERE 
	ds_tipo_recurso = 'Nacional'
	AND in_status_registro = 1
;

------------------------------------------- Compras

