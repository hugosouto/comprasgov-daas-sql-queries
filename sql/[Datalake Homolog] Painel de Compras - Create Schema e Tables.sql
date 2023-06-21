-- DROP SCHEMA painel_compras;

CREATE SCHEMA painel_compras;
-- seges_delog_cgscg_stage.painel_compras.extracao_comprasnet definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.extracao_comprasnet GO

CREATE TABLE seges_delog_cgscg_stage.painel_compras.extracao_comprasnet (
	COD_ITEM varchar(100) COLLATE Latin1_General_CI_AS NULL,
	STATUS_1 varchar(100) COLLATE Latin1_General_CI_AS NULL
);


-- seges_delog_cgscg_stage.painel_compras.extracao_comprasnet_contratos definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.extracao_comprasnet_contratos GO

CREATE TABLE seges_delog_cgscg_stage.painel_compras.extracao_comprasnet_contratos (
	COD_COMPRA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PROCESSO_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CNPJ varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	IT_VA_TOTAL decimal(20,4) NULL,
	IT_DA_ASSINATURA varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_INICIO_VIGENCIA varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_TERMINO_VIGENCIA varchar(4000) COLLATE Latin1_General_CI_AS NULL,
	NOTA_EMPENHO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	LINK_EMPENHO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	LINK_CONTRATO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	ADITIVOS_CHAVE varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ADITIVOS int NULL
);


-- seges_delog_cgscg_stage.painel_compras.extracao_siasg_aditivos definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_aditivos GO

CREATE TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_aditivos (
	ADITIVOS_CHAVE varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ADITIVOS int NULL
);


-- seges_delog_cgscg_stage.painel_compras.extracao_siasg_compras definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_compras GO

CREATE TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_compras (
	COD_COMPRA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	COD_ITEM varchar(100) COLLATE Latin1_General_CI_AS NULL,
	STATUS_2 varchar(100) COLLATE Latin1_General_CI_AS NULL,
	NUM_ITEM int NULL,
	QUANTIDADE int NULL,
	TIPO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CATMAT_CATSER numeric(20,7) NULL,
	ITEM_DESCRICAO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	UNIDADE varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PRECO_UNITARIO numeric(30,12) NULL,
	PRECO_TOTAL numeric(23,4) NULL,
	CNPJ varchar(100) COLLATE Latin1_General_CI_AS NULL,
	RAZAO_SOCIAL varchar(200) COLLATE Latin1_General_CI_AS NULL,
	[DATA] datetime2(7) NULL
);


-- seges_delog_cgscg_stage.painel_compras.extracao_siasg_contratos definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_contratos GO

CREATE TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_contratos (
	COD_COMPRA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PROCESSO_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CNPJ varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_VA_TOTAL decimal(20,4) NULL,
	IT_DA_ASSINATURA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_INICIO_VIGENCIA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_TERMINO_VIGENCIA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	NOTA_EMPENHO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	LINK_EMPENHO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	LINK_CONTRATO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	ADITIVOS_CHAVE varchar(100) COLLATE Latin1_General_CI_AS NULL
);


-- seges_delog_cgscg_stage.painel_compras.extracao_siasg_net definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_net;

CREATE TABLE seges_delog_cgscg_stage.painel_compras.extracao_siasg_net (
	PROCESSO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	SISG varchar(100) COLLATE Latin1_General_CI_AS NULL,
	COD_UASG varchar(100) COLLATE Latin1_General_CI_AS NULL,
	UASG varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ORGAO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PODER varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ESFERA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	UF varchar(100) COLLATE Latin1_General_CI_AS NULL,
	MUNICIPIO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	MODALIDADE varchar(100) COLLATE Latin1_General_CI_AS NULL,
	FORMATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	SRP varchar(100) COLLATE Latin1_General_CI_AS NULL,
	NUM_COMPRA int NULL,
	ANO_COMPRA int NULL,
	OBJETO varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	COVID varchar(100) COLLATE Latin1_General_CI_AS NULL,
	LINK_COMPRA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	COD_COMPRA_SIASGNET varchar(100) COLLATE Latin1_General_CI_AS NULL,
	codigoversaocompra int NULL
);


-- seges_delog_cgscg_stage.painel_compras.resultado definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.painel_compras.resultado GO

CREATE TABLE seges_delog_cgscg_stage.painel_compras.resultado (
	COD_COMPRA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	COD_ITEM varchar(100) COLLATE Latin1_General_CI_AS NULL,
	NUM_ITEM int NULL,
	QUANTIDADE int NULL,
	TIPO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	CATMAT_CATSER int NULL,
	ITEM_DESCRICAO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	UNIDADE varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PRECO_UNITARIO numeric(30,12) NULL,
	VALOR_TOTAL numeric(23,4) NULL,
	CNPJ varchar(100) COLLATE Latin1_General_CI_AS NULL,
	RAZAO_SOCIAL varchar(200) COLLATE Latin1_General_CI_AS NULL,
	[DATA] datetime2(7) NULL,
	SISG varchar(100) COLLATE Latin1_General_CI_AS NULL,
	COD_UASG varchar(100) COLLATE Latin1_General_CI_AS NULL,
	UASG varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ORGAO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PODER varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ESFERA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	UF varchar(100) COLLATE Latin1_General_CI_AS NULL,
	MUNICIPIO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	MODALIDADE varchar(100) COLLATE Latin1_General_CI_AS NULL,
	FORMATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	SRP varchar(100) COLLATE Latin1_General_CI_AS NULL,
	NUM_COMPRA int NULL,
	ANO_COMPRA int NULL,
	PROCESSO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	OBJETO varchar(MAX) COLLATE Latin1_General_CI_AS NULL,
	LEI_NOME varchar(100) COLLATE Latin1_General_CI_AS NULL,
	LINK_COMPRA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	PROCESSO_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CONTRATO varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_VA_TOTAL decimal(20,4) NULL,
	IT_DA_ASSINATURA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_INICIO_VIGENCIA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_TERMINO_VIGENCIA varchar(100) COLLATE Latin1_General_CI_AS NULL,
	NOTA_EMPENHO varchar(8000) COLLATE Latin1_General_CI_AS NULL,
	LINK_EMPENHO varchar(8000) COLLATE Latin1_General_CI_AS NULL,
	LINK_CONTRATO varchar(1000) COLLATE Latin1_General_CI_AS NULL,
	ADITIVOS int NULL,
	STATUS_ITEM varchar(200) COLLATE Latin1_General_CI_AS NULL
);

DROP TABLE Siasgnet_dc_VBL.itemcompra_marcus
;
