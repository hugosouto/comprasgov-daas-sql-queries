DROP TABLE seges_delog_cgscg_stage.pgc.pgc;

CREATE TABLE seges_delog_cgscg_stage.pgc.pgc (
	codigoUnidadeCompradora varchar(20) NULL,
	anoPca int NULL,
	numeroItem int NOT NULL,
	categoriaItemPca int NULL,
	catalogo int NOT NULL,
	classificacaoCatalogo int NULL,
	codigoCatalogo varchar(100) NULL,
	descricao varchar(2048) NULL,
	unidadeFornecimento varchar(255) NULL,
	quantidade decimal(16,2) NULL,
	valorUnitario decimal(16,2) NULL,
	valorTotal decimal(16,2) NULL,
	valorOrcamentoExercicio decimal(16,2) NULL,
	renovacaoContrato varchar(8) NULL,
	dataDesejada date NULL,
	unidadeRequisitante varchar(255) NULL,
	grupoContratacaoCodigo varchar(100) NULL,
	grupoContratacaoNome varchar(255) NULL,
	situacao_updated_at datetime NULL
) GO;
