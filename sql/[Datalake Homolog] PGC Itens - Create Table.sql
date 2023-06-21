DROP TABLE seges_delog_cgscg_stage.pgc.itens;
CREATE TABLE seges_delog_cgscg_stage.pgc.itens (
	id int,
	tipo_item char(1),
	id_sub_item int,
	quantidade_total int,
	codigo_item int,
	valor_unitario decimal(16,2),
	valor_total decimal(16,2),
	id_grupo int,
	periodo_estimado datetime,
	renovacao_contrato int,
	unidade_responsavel varchar(255),
	descricao varchar(255),
--	descricao_detalhada varchar(4000),
	unidade_fornecimento varchar(255),
	id_plano_anual int,
	id_uasg int,
	created_at datetime,
	updated_at datetime,
	numeroitem varchar(50),
	valor_orcamentario decimal(20,2)
) GO
