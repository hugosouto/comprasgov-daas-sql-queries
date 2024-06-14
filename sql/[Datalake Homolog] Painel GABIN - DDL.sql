CREATE SCHEMA painel_gabin;

-- Create the table
CREATE TABLE painel_gabin.[table] (
    [column] INTEGER
);

-- Create the table
DROP TABLE painel_gabin.[table];

-- Insert a value into the table
INSERT INTO painel_gabin.[table] ([column]) VALUES (0);

-- seges_delog_cgscg_stage.painel_gabin.itens_compras definition

TRUNCATE TABLE seges_delog_cgscg_stage.painel_gabin.itens_compras;

DROP TABLE seges_delog_cgscg_stage.painel_gabin.itens_compras;

CREATE TABLE seges_delog_cgscg_stage.painel_gabin.itens_compras (
	ID_UNDD_IN_SISG numeric(38, 10) NOT NULL,
	DS_UNDD_IN_SISG varchar(18) COLLATE Latin1_General_CI_AS NULL,
	ID_UNDD_ESFERA numeric(38, 10) NOT NULL,
	DS_UNDD_ESFERA varchar(13) COLLATE Latin1_General_CI_AS NULL,
	ID_UNDD_TP_ADM numeric(38, 10) NULL,
	DS_UNDD_TP_ADM varchar(32) COLLATE Latin1_General_CI_AS NULL,
	ID_UNDD_ORGAO numeric(38, 10) NULL,
	DS_UNDD_ORGAO varchar(45) COLLATE Latin1_General_CI_AS NULL,
	ID_UNDD_UNIDADE numeric(38, 10) NULL,
	CD_UNDD_UNIDADE numeric(38, 10) NULL,
	NO_UNDD_UNIDADE varchar(45) COLLATE Latin1_General_CI_AS NULL,
	ID_LCAL_UF varchar(2) COLLATE Latin1_General_CI_AS NULL,
	DS_LCAL_UF varchar(2) COLLATE Latin1_General_CI_AS NULL,
	ID_DT_ANO numeric(38, 10) NOT NULL,
	DS_DT_ANO varchar(4) COLLATE Latin1_General_CI_AS NULL,
	ID_DT_MES numeric(38, 10) NOT NULL,
	DS_DT_MES varchar(8) COLLATE Latin1_General_CI_AS NULL,
	ID_ITCP_GRUPO_MATERIAL numeric(38, 10) NULL,
	DS_ITCP_GRUPO_MATERIAL varchar(120) COLLATE Latin1_General_CI_AS NULL,
	ID_ITCP_CLASSE_MAT_SERV numeric(38, 10) NULL,
	DS_ITCP_CLASSE_MAT_SERV numeric(38, 10) NOT NULL,
	DS_ITCP_CLASSE_MAT_SERV0 varchar(120) COLLATE Latin1_General_CI_AS NULL,
	ID_ITCP_PADRAO_DESC_MAT varchar(5) COLLATE Latin1_General_CI_AS NULL,
	DS_ITCP_PADRAO_DESC_MAT varchar(100) COLLATE Latin1_General_CI_AS NULL,
	ID_ITCP_TP_COD_MAT_SERV numeric(38, 10) NULL,
	DS_ITCP_MATERIAL_SERVICO varchar(624) COLLATE Latin1_General_CI_AS NULL,
	ID_ITCP_MATERIAL_SERVICO numeric(38, 10) NULL,
	ID_CMPR_MODALIDADE_COMPRA numeric(38, 10) NULL,
	DS_CMPR_MODALIDADE_COMPRA varchar(46) COLLATE Latin1_General_CI_AS NULL,
	ID_CMPR_COMPRA numeric(38, 10) NULL,
	DS_CMPR_COMPRA varchar(517) COLLATE Latin1_General_CI_AS NULL,
	DS_CMPR_COMPRA_EDIT numeric(38, 10) NULL,
	DS_CMPR_COMPRA0 varchar(17) COLLATE Latin1_General_CI_AS NULL,
	ID_ITCP_ITEM_COMPRA numeric(38, 10) NULL,
	DS_ITCP_ITEM_COMPRA varchar(22) COLLATE Latin1_General_CI_AS NULL,
	QT_ITCP_ITEM_COMPRAS numeric(38, 10) NULL,
	VL_ITCP_PRECO_GLOBAL_ESTIM numeric(38, 10) NULL,
	VL_PRECO_TOTAL_HOMOLOG numeric(38, 10) NULL
);