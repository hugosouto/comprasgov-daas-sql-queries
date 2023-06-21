CREATE SCHEMA dados_abertos;

DROP TABLE dados_abertos.tb_licitacao;

CREATE TABLE dados_abertos.tb_licitacao (
	co_compra varchar(60),
	co_modalidade_licitacao int,
	co_municipio_uasg int,
	co_orgao int,
	co_uasg int,
	ds_situacao_aviso varchar(100) COLLATE Latin1_General_CI_AS,
	ds_tipo_recurso varchar(13) COLLATE Latin1_General_CI_AS,
	dt_abertura_proposta datetime,
	dt_entrega_edital datetime,
	dt_entrega_proposta datetime,
	dt_publicacao varchar(8000) COLLATE Latin1_General_CI_AS,
	in_pregao_eletronico varchar(20) COLLATE Latin1_General_CI_AS,
	in_outlier char(1) COLLATE Latin1_General_CI_AS,
	in_srp varchar(20) COLLATE Latin1_General_CI_AS,
	no_modalidade_licitacao varchar(MAX) COLLATE Latin1_General_CI_AS,
	no_municipio_uasg nvarchar(60) COLLATE Latin1_General_CI_AS,
	no_orgao_uasg nvarchar(45) COLLATE Latin1_General_CI_AS,
	no_sistema varchar(5) COLLATE Latin1_General_CI_AS,
	no_uasg nvarchar(45) COLLATE Latin1_General_CI_AS,
	nu_ano_compra int,
	nu_compra bigint,
	nu_itens int,
	sg_uf_municipio nchar(2) COLLATE Latin1_General_CI_AS,
	tx_objeto_licitacao varchar(MAX) COLLATE Latin1_General_CI_AS,
	vr_estimado_total numeric(21,4),
	vr_homologado_total numeric(38,4)
);

----------------------------------------- compras_sem_licitacao

DROP TABLE dados_abertos.tb_compras_sem_licitacao;

CREATE TABLE dados_abertos.tb_compras_sem_licitacao (
	co_compra varchar(60),
	co_modalidade_licitacao int,
	co_orgao varchar(5) COLLATE Latin1_General_CI_AS,
	co_uasg bigint,
	dt_compra date,
	no_modalidade_licitacao varchar(50) COLLATE Latin1_General_CI_AS,
	nu_ano_compra int,
	nu_compra bigint,
	qt_total_item bigint,
	vr_homologado_total numeric(19,2)
);

--------------------------------------------------------------- tb_licitacao_item

DROP TABLE dados_abertos.tb_licitacao_item;

CREATE TABLE dados_abertos.tb_licitacao_item (
	co_compra varchar(60) COLLATE Latin1_General_CI_AS,
	co_material_servico int,
	in_tipo_fornecedor_vencedor char(2) COLLATE Latin1_General_CI_AS,
	in_tipo_item char(1) COLLATE Latin1_General_CI_AS,
	no_fornecedor_vencedor varchar(100) COLLATE Latin1_General_CI_AS,
	nu_cnpj_fornecedor nvarchar(14) COLLATE Latin1_General_CI_AS,
	nu_cpf_cnpj_fornecedor varchar(14) COLLATE Latin1_General_CI_AS,
	nu_cpf_fornecedor nvarchar(14) COLLATE Latin1_General_CI_AS,
	vr_homologado_item numeric(19,2)
);

--------------------------------------------------------------- itens_sem_licitacao

DROP TABLE dados_abertos.tb_itens_sem_licitacao;

CREATE TABLE dados_abertos.tb_itens_sem_licitacao (
	co_compra varchar(60) COLLATE Latin1_General_CI_AS,
	co_material_servico int,
	in_tipo_fornecedor_vencedor char(2) COLLATE Latin1_General_CI_AS,
	in_tipo_item char(1) COLLATE Latin1_General_CI_AS,
	no_fornecedor_vencedor varchar(100) COLLATE Latin1_General_CI_AS,
	nu_cpf_cnpj_fornecedor varchar(14) COLLATE Latin1_General_CI_AS,
	vr_homologado_item numeric(19,2)
);
