-- DROP SCHEMA pncp_credenciamento;

CREATE SCHEMA pncp_credenciamento;

-- DROP SEQUENCE pncp_credenciamento.modelos_id_seq;

--CREATE SEQUENCE pncp_credenciamento.modelos_id_seq
--	INCREMENT BY 1
--	MINVALUE 1
--	MAXVALUE 2147483647
--	START 1
--	CACHE 1
--	NO CYCLE;

-- Drop table
-- DROP TABLE pncp_credenciamento.dados_reais;

-- Criação da tabela pncp_credenciamento.dados_reais
CREATE TABLE pncp_credenciamento.dados_reais (
    id INT NOT NULL,
    cnpj VARCHAR(14) NULL,
    statuscredenciamentoid INT NULL,
    data_inclusao DATETIME NULL,
    CONSTRAINT dados_reais_pkey PRIMARY KEY (id)
);




DROP TABLE pncp_credenciamento.dados_reais;

CREATE TABLE pncp_credenciamento.dados_reais (
	id bigint NULL,
	cnpj varchar(max) COLLATE Latin1_General_CI_AS NULL,
	nomerazaosocial varchar(max) COLLATE Latin1_General_CI_AS NULL,
	email varchar(max) COLLATE Latin1_General_CI_AS NULL,
	urlsistema varchar(max) COLLATE Latin1_General_CI_AS NULL,
	nomesistema varchar(max) COLLATE Latin1_General_CI_AS NULL,
	responsavelcadastronome varchar(max) COLLATE Latin1_General_CI_AS NULL,
	responsavelcadastrocpf bigint NULL,
	responsavelcadastroemail varchar(max) COLLATE Latin1_General_CI_AS NULL,
	responsavelcadastrotelefone bigint NULL,
	esferafederal bit NULL,
	esferaestadual bit NULL,
	esferamunicipal bit NULL,
	esferadistrital bit NULL,
	disponibilizaartefatolicitacao bit NULL,
	editalcredenciamento bit NULL,
	urleditalcredenciamento varchar(max) COLLATE Latin1_General_CI_AS NULL,
	avisocontratacaodireta bit NULL,
	urlavisocontratacaodireta varchar(max) COLLATE Latin1_General_CI_AS NULL,
	editallicitacao bit NULL,
	urleditallicitacao varchar(max) COLLATE Latin1_General_CI_AS NULL,
	ata bit NULL,
	urlata varchar(max) COLLATE Latin1_General_CI_AS NULL,
	contrato bit NULL,
	urlcontrato varchar(max) COLLATE Latin1_General_CI_AS NULL,
	usuarioanaliseprocessoid bigint NULL,
	dataanaliseprocesso varchar(max) COLLATE Latin1_General_CI_AS NULL,
	justificativaanalise varchar(max) COLLATE Latin1_General_CI_AS NULL,
	usuariocredenciadoid varchar(max) COLLATE Latin1_General_CI_AS NULL,
	datainclusao varchar(max) COLLATE Latin1_General_CI_AS NULL,
	excluido bit NULL,
	sequencialcredenciamento bigint NULL,
	ano bigint NULL,
	statuscredenciamentoid bigint NULL,
	usuariocredenciadoidnaoprodutivo bigint NULL,
	loginnaoprodutivo varchar(max) COLLATE Latin1_General_CI_AS NULL
);


















-- Drop table
-- DROP TABLE pncp_credenciamento.df_treinamento;

-- Criação da tabela pncp_credenciamento.df_treinamento
CREATE TABLE pncp_credenciamento.df_treinamento (
    id BIGINT NULL,
    termosdeclaracaoaceite BIT NULL,
    cnpj VARCHAR(MAX) NULL,
    nomerazaosocial VARCHAR(MAX) NULL,
    email VARCHAR(MAX) NULL,
    urlsistema VARCHAR(MAX) NULL,
    nomesistema VARCHAR(MAX) NULL,
    responsavelcadastronome VARCHAR(MAX) NULL,
    responsavelcadastrocpf BIGINT NULL,
    responsavelcadastroemail VARCHAR(MAX) NULL,
    responsavelcadastrotelefone VARCHAR(MAX) NULL,
    esferafederal BIT NULL,
    esferaestadual BIT NULL,
    esferamunicipal BIT NULL,
    esferadistrital BIT NULL,
    disponibilizaartefatolicitacao BIT NULL,
    editalcredenciamento BIT NULL,
    urleditalcredenciamento VARCHAR(MAX) NULL,
    avisocontratacaodireta BIT NULL,
    urlavisocontratacaodireta VARCHAR(MAX) NULL,
    editallicitacao BIT NULL,
    urleditallicitacao VARCHAR(MAX) NULL,
    ata BIT NULL,
    urlata VARCHAR(MAX) NULL,
    contrato BIT NULL,
    urlcontrato VARCHAR(MAX) NULL,
    datainclusao VARCHAR(MAX) NULL,
    ano BIGINT NULL,
    statuscredenciamentoid INT NULL,
    codigo_atividade_principal VARCHAR(MAX) NULL,
    descricao_atividade_principal VARCHAR(MAX) NULL,
    cod_natureza_juridica VARCHAR(MAX) NULL,
    descricao_natureza_juridica VARCHAR(MAX) NULL
);

-- Drop table
-- DROP TABLE pncp_credenciamento.enriquecimento;

-- Criação da tabela pncp_credenciamento.enriquecimento
CREATE TABLE pncp_credenciamento.enriquecimento (
    cnpj VARCHAR(14) NOT NULL,
    codigo_atividade_principal VARCHAR(15) NULL,
    descricao_atividade_principal VARCHAR(255) NULL,
    cod_natureza_juridica VARCHAR(15) NULL,
    descricao_natureza_juridica VARCHAR(255) NULL,
    data_inclusao DATETIME NULL,
    CONSTRAINT enriquecimento_pkey PRIMARY KEY (cnpj)
);

-- Drop table
-- DROP TABLE pncp_credenciamento.modelos;

-- Criação da tabela pncp_credenciamento.modelos
CREATE TABLE pncp_credenciamento.modelos (
    id INT IDENTITY(1,1) NOT NULL,
    versao VARCHAR(255) NULL,
    modelo VARBINARY(MAX) NULL,
    CONSTRAINT modelos_pkey PRIMARY KEY (id)
);


-- Drop table
-- DROP TABLE pncp_credenciamento.previsoes;

-- Criação da tabela pncp_credenciamento.previsoes
CREATE TABLE pncp_credenciamento.previsoes (
    cnpj VARCHAR(MAX) NULL,
    id BIGINT NULL,
    previsao BIGINT NULL,
    [real] BIGINT NULL,
    resultado VARCHAR(MAX) NULL,
    data_inclusao DATETIME NULL
);