CREATE SCHEMA credenciamento_pncp;

CREATE TABLE atividade_principal (
	cnpj_atividade_principal VARCHAR(14),
	codigo_atividade_principal VARCHAR(10),
	descricao_atividade_principal VARCHAR(MAX)
	);

TRUNCATE TABLE credenciamento_pncp.atividade_principal;

INSERT atividade_principal VALUES ('','','');

ALTER SCHEMA credenciamento_pncp
TRANSFER dbo.atividade_principal;

--DROP TABLE dbo.natureza_juridica;

CREATE TABLE credenciamento_pncp.natureza_juridica (
	cnpj_natureza_juridica VARCHAR(14),
	cod_natureza_juridica VARCHAR(5),
	descricao_natureza_juridica VARCHAR(MAX)
	);

INSERT credenciamento_pncp.natureza_juridica VALUES ('','','');
	
		
