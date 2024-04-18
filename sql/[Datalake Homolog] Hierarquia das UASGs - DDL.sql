CREATE SCHEMA hierarquia_uasgs;
--DROP SCHEMA hierarquia_uasgs;

ALTER SCHEMA hierarquia_uasgs 
TRANSFER dbo.siasg_uasgs_orgaos_pncp;

ALTER SCHEMA hierarquia_uasgs 
TRANSFER dbo.pncp_compras_por_unidade;

DROP SCHEMA higienizacao_uasgs;

-- seges_delog_cgscg_stage.hierarquia_uasgs.siasg_orgaos definition

-- DROP TABLE seges_delog_cgscg_stage.hierarquia_uasgs.siasg_orgaos;

CREATE TABLE seges_delog_cgscg_stage.hierarquia_uasgs.siasg_orgaos (
	IT_IN_STATUS nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_ORGAO int NULL,
	IT_NO_ORGAO nvarchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_NO_MNEMONICO varchar(19) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CGC_CPF nvarchar(14) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_ORGAO_VINCULADO int NULL,
	IT_NO_ORGAO_VINCULADO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	iT_CO_ORGAO_SUPERIOR int NULL,
	IT_NO_ORGAO_SUPERIOR varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_TIPO_ADMINISTRACAO int NULL,
	IT_IN_TIPO_PODER int NULL,
	IT_IN_ESFERA varchar(1) COLLATE Latin1_General_CI_AS NULL
);

-- seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.dbo.siasg_uasgs;

CREATE TABLE seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs (
	IT_IN_STATUS nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_GESTORA int NULL,
	IT_NO_UNIDADE_GESTORA varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_USO_SISG_UASG nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_ADESAO_SIASG nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_MOVIMENTO int NULL,
	IT_DA_IMPLANTACAO_SIDEC int NULL,
	IT_SG_UF nvarchar(2) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_MUNICIPIO int NULL,
	IT_CO_ORGAO int NULL,
	IT_NU_CGC_CPF nvarchar(14) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_POLO int NULL,
	IT_NO_UNIDADE_GESTORA_POLO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_ESPELHO int NULL,
	IT_NO_UNIDADE_GESTORA_ESPELHO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_UASG_CADASTRADORA nvarchar(1) COLLATE Latin1_General_CI_AS NULL
);

-- seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs_orgaos definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos;

CREATE TABLE seges_delog_cgscg_stage.hierarquia_uasgs.siasg_uasgs_orgaos (
	IT_IN_STATUS nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CGC_CPF nvarchar(14) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_GESTORA int NULL,
	IT_NO_UNIDADE_GESTORA varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_USO_SISG_UASG nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_ADESAO_SIASG nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_MOVIMENTO int NULL,
	IT_DA_IMPLANTACAO_SIDEC int NULL,
	IT_SG_UF nvarchar(2) COLLATE Latin1_General_CI_AS NULL,
	SG_UF nvarchar(2) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_MUNICIPIO int NULL,
	NOME_MUN_SIASG nvarchar(50) COLLATE Latin1_General_CI_AS NULL,
	NOME_MUN_IBGE nvarchar(50) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_POLO int NULL,
	IT_NO_UNIDADE_GESTORA_POLO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_ESPELHO int NULL,
	IT_NO_UNIDADE_GESTORA_ESPELHO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_UASG_CADASTRADORA nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_STATUS_ORGAO nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_ORGAO int NULL,
	IT_NO_ORGAO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_NO_MNEMONICO varchar(19) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CGC_CPF_ORGAO nvarchar(14) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_ORGAO_VINCULADO int NULL,
	IT_NO_ORGAO_VINCULADO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	iT_CO_ORGAO_SUPERIOR int NULL,
	IT_NO_ORGAO_SUPERIOR nvarchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_TIPO_ADMINISTRACAO int NULL,
	IT_IN_TIPO_PODER int NULL,
	IT_IN_ESFERA varchar(1) COLLATE Latin1_General_CI_AS NULL
);

-- seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos_pncp definition

-- Drop table

-- DROP TABLE seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos_pncp;

CREATE TABLE seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos_pncp (
	IT_IN_STATUS nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CGC_CPF nvarchar(14) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_GESTORA int NULL,
	IT_NO_UNIDADE_GESTORA varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_USO_SISG_UASG nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_ADESAO_SIASG nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_DA_MOVIMENTO int NULL,
	IT_DA_IMPLANTACAO_SIDEC int NULL,
	IT_SG_UF nvarchar(2) COLLATE Latin1_General_CI_AS NULL,
	SG_UF nvarchar(2) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_MUNICIPIO int NULL,
	NOME_MUN_SIASG nvarchar(50) COLLATE Latin1_General_CI_AS NULL,
	NOME_MUN_IBGE nvarchar(50) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_POLO int NULL,
	IT_NO_UNIDADE_GESTORA_POLO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_UNIDADE_ESPELHO int NULL,
	IT_NO_UNIDADE_GESTORA_ESPELHO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_UASG_CADASTRADORA nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_STATUS_ORGAO nvarchar(1) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_ORGAO int NULL,
	IT_NO_ORGAO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_NO_MNEMONICO varchar(19) COLLATE Latin1_General_CI_AS NULL,
	IT_NU_CGC_CPF_ORGAO nvarchar(14) COLLATE Latin1_General_CI_AS NULL,
	IT_CO_ORGAO_VINCULADO int NULL,
	IT_NO_ORGAO_VINCULADO varchar(46) COLLATE Latin1_General_CI_AS NULL,
	iT_CO_ORGAO_SUPERIOR int NULL,
	IT_NO_ORGAO_SUPERIOR nvarchar(46) COLLATE Latin1_General_CI_AS NULL,
	IT_IN_TIPO_ADMINISTRACAO int NULL,
	IT_IN_TIPO_PODER int NULL,
	IT_IN_ESFERA varchar(1) COLLATE Latin1_General_CI_AS NULL,
	COMPRAS int NULL
);