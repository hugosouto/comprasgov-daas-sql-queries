--CREATE DATABASE Stg_Siasgnet;

------------------------------------------------------------------------------------------------------------------------ Siasgnet_VBL

--DROP SCHEMA Siasgnet_VBL;
--CREATE SCHEMA Siasgnet_VBL;


DROP TABLE Siasgnet_VBL.artigo;
CREATE TABLE Siasgnet_VBL.artigo (
	codigoartigo			int,
	descricao				varchar(50),
	codigolei				int,
	codigomodalidadecompra	int,
	textoconfirmacao		varchar(2000)
	);

DROP TABLE Siasgnet_VBL.formarealizacao;
CREATE TABLE Siasgnet_VBL.formarealizacao (
	codigoformarealizacao	int,
	descricao				varchar(50),
	ativo					varchar(1)
	);

DROP TABLE Siasgnet_VBL.formarealizacaomodalidadecompra;
CREATE TABLE Siasgnet_VBL.formarealizacaomodalidadecompra (
	codigoformarealizacaomodalidadecompra	int,
	codigomodalidadecompra					int,
	codigoformarealizacao					int,
	ativo									varchar(1)
	);

DROP TABLE Siasgnet_VBL.incisoparagrafo;
CREATE TABLE Siasgnet_VBL.incisoparagrafo (
	codigoincisoparagrafo	int,
	descricao				varchar(50),
	publicacaoobrigatoria	varchar(1),
	codigoartigo			int,
	numeroinciso			int,
	descricaoparagrafo		varchar(50)
	);

DROP TABLE Siasgnet_VBL.lei;
CREATE TABLE Siasgnet_VBL.lei (
	codigolei			int,
	descricao			varchar(50),
	ativo				varchar(1),
	descricaocurta		varchar(50),
	numerolei			int,
	nomelei				varchar(50),
	obrigaconfirmacao	varchar(1)
	);

DROP TABLE Siasgnet_VBL.leimodalidadecompra;
CREATE TABLE Siasgnet_VBL.leimodalidadecompra (
	codigolei				int,
	codigomodalidadecompra	int
	);

DROP TABLE Siasgnet_VBL.modalidadecompra;
CREATE TABLE Siasgnet_VBL.modalidadecompra (
	codigomodalidadecompra				int,
	descricao							varchar(50),
	ativo								varchar(1),
	publicacaoobrigatoria				varchar(1),
	permiterepublicacao					varchar(1),
	permitecomprainternacional			varchar(1),
	permiteequalizacaoicms				varchar(1),
	prazoconsideradiasuteis				varchar(1),
	editalobrigatorio					varchar(1),
	permiterepeticaolicitacaodeserta	varchar(1),
	tipomodalidadecompra				varchar(1),
	ordemapresentacao					int
	);

DROP TABLE Siasgnet_VBL.municipio;
CREATE TABLE Siasgnet_VBL.municipio (
	codigomunicipio		int,
	ativo				varchar(1),
	nome				varchar(40),
	uf					varchar(2)
	);

DROP TABLE Siasgnet_VBL.orgao;
CREATE TABLE Siasgnet_VBL.orgao (
	numeroorgao					int,
	ativo						varchar(1),
	codigoesfera				int,
	nome						varchar(45),
	codigopoder					int,
	sigla						varchar(19),
	codigotipoadministracao		int,
	numeroorgaovinculado		int
	);

DROP TABLE Siasgnet_VBL.uasg;
CREATE TABLE Siasgnet_VBL.uasg (
	numerouasg								int,
	adesaosiasg								varchar(1),
	ativo									varchar(1),
	bairro									varchar(40),
	centralcompras							varchar(1),
	cep										varchar(8),
	codigohierarquianivel1					int,
	codigohierarquianivel2					int,
	codigohierarquianivel3					int,
	codigohierarquianivel4					int,
	codigohierarquianivel5					int,
	codigohierarquianivel6					int,
	codigosiorg								varchar(8),
	complemento								varchar(40),
	cpfresponsaveldefinicaocentralcompras	varchar(11),
	datahoradefinicaocentralcompras			datetime,
	anoempenhoimprensa						varchar(4),
	gestaoempenhoimprensa					varchar(5),
	numeroempenhoimprensa					varchar(6),
	habilitadaequalizacaoicms				varchar(1),
	hierarquianivel1						varchar(150),
	hierarquianivel2						varchar(150),
	hierarquianivel3						varchar(150),
	hierarquianivel4						varchar(150),
	hierarquianivel5						varchar(150),
	hierarquianivel6						varchar(150),
	justificativadefinicaocentralcompras	varchar(517),
	logradouro								varchar(65),
	nome									varchar(45),
	numero									varchar(10),
	percentualenquadramentoincisoieii		int,
	sigla									varchar(19),
	sisg									varchar(1),
	numerouasgempenhoimprensa				int,
	codigomunicipio							int,
	numeroorgaouasg							int,
	numerouasgpolo							int
	);
	
DROP TABLE Siasgnet_VBL.tipolicitacao;
CREATE TABLE Siasgnet_VBL.tipolicitacao (
	codigotipolicitacao		int,
	descricao				varchar(50),
	ativo					varchar(1)
	);

DROP TABLE Siasgnet_VBL.tipolicitacaomodalidadecompra;
CREATE TABLE Siasgnet_VBL.tipolicitacaomodalidadecompra (
	codigotipolicitacaomodalidadecompra		int,
	codigomodalidadecompra					int,
	codigotipolicitacao						int,
	ativo									varchar(1)
	);

------------------------------------------------------------------------------------------------------------------------ Siasgnet_dc_VBL

--DROP SCHEMA Siasgnet_dc_VBL;
--CREATE SCHEMA Siasgnet_dc_VBL;


DROP TABLE Siasgnet_dc_VBL.compra;
CREATE TABLE Siasgnet_dc_VBL.compra (
	codigocompra					bigint,
	codigomodalidadecompra			int,
	numerocompra					varchar(5),
	anocompra						varchar(4),
	numerouasgorigem				int,
	numerouasgresponsavel			int,
	tipocompra						varchar(1),
	cpfusuarioencerramento			varchar(11),
	datahoraencerramento			datetime,
	codigopedidodispensaeletronica	bigint,
	codigosistemaorigem				int,
	percentualparagrafounico		int,
	codigolei						int,
	outrashipotesesdispensa			varchar(1),
	datahoraregistro				datetime
	);

DROP TABLE Siasgnet_dc_VBL.itemcompra;
CREATE TABLE Siasgnet_dc_VBL.itemcompra (
	codigoitemcompra			bigint,
	descricao					varchar(120),
	descricaodetalhada			varchar(4000),
	quantidade					bigint,
	numeroitem					int,
	codigotipoitem				int,
	codigosituacaoitemcompra	int,
	codigoitemcatalogo			varchar(9),
	quantidadeconsistente		varchar(1),
	unidadefornecimento			varchar(50),
	siglaunidadefornecimento	varchar(7),
	capacidadeunidademedida		varchar(11),
	nomeunidademedida			varchar(20),
	siglaunidademedida			varchar(7),
	nomeunidadefornecimento		varchar(20),
	datahoraregistro			datetime,
	itemsustentavel				varchar(1),
	codigoitemcomprasrp			bigint,
	quantidadetotalitemsrp		bigint,
	valortotalitemsrp			decimal(38,4)
	);
	
DROP TABLE Siasgnet_dc_VBL.versaocompra;
CREATE TABLE Siasgnet_dc_VBL.versaocompra (
	codigoversaocompra			bigint,
	codigocompra				bigint,
	objeto						varchar(3619),
	codigosituacaocompra		int,
	quantidadeitens				int,
	numeroprocesso				varchar(17),
	numeroversaocompra			int,
	quantidadeitensincluidos	int,
	quantidadeitenscancelados	int,
	datahoraregistro			datetime
	);

DROP TABLE Siasgnet_dc_VBL.versaocompracomlicitacao;
CREATE TABLE Siasgnet_dc_VBL.versaocompracomlicitacao (
	codigoversaocompracomlicitacao				bigint,
	informacoesgerais							varchar(517),
	codigotipolicitacao							int,
	internacional								varchar(1),
	codigoformarealizacao						int,
	equalizacaoicms								varchar(1),
	codigocaracteristicalicitacao				int,
	justificativanaousopregaoeletronico			varchar(517),
	codigotiporecurso							int,
	codigoorigemrecurso							int,
	descricaoorigemoutros						varchar(30),
	numerocontratorecurso						varchar(17),
	valorcontrapartida							decimal(38,4),
	cpfresponsavelautorizacaocompra				varchar(11),
	nomeresponsavelautorizacaocompra			varchar(94),
	funcaoresponsavelautorizacaocompra			varchar(94),
	cpfvalidadoresponsavelautorizacaocompra		varchar(1),
	dataentregaproposta							date,
	horaentregaproposta							datetime,
	enderecoeletronicoentregaproposta			varchar(60),
	dataaberturaproposta						date,
	horaaberturaproposta						datetime,
	enderecoeletronicoaberturaproposta			varchar(60),
	cienciautilizacaopregaorecursointernacional	varchar(1),
	numeroirp									varchar(5),
	anoirp										varchar(4),
	prazovalidadeata							int,
	numerouasgorigemirp							int,
	logradouroentregaedital						varchar(94),
	bairroentregaedital							varchar(40),
	complementoentregaedital					varchar(40),
	codigomunicipioentregaedital				int,
	dddtelefoneentregaedital					varchar(4),
	telefoneentregaedital						varchar(8),
	ramalentregaedital							varchar(4),
	faxentregaedital							varchar(8),
	cepentregaedital							varchar(8),
	dataentregaedital							date,
	horainicioprimeiroperiodoentregaedital		datetime,
	horafimprimeiroperiodoentregaedital			datetime,
	horainiciosegundoperiodoentregaedital		datetime,
	horafimsegundoperiodoentregaedital			datetime,
	logradouroentregaproposta					varchar(94),
	bairroentregaproposta						varchar(40),
	complementoentregaproposta					varchar(40),
	codigomunicipioentregaproposta				int,
	dddtelefoneentregaproposta					varchar(4),
	telefoneentregaproposta						varchar(8),
	ramalentregaproposta						varchar(4),
	faxentregaproposta							varchar(8),
	cepentregaproposta							varchar(8),
	licitacaocombeneficiotipoi					varchar(1),
	obrasservicosengenharia						varchar(1),
	datahoraregistro							datetime,
	compranacional								int,
	contratacaompsetic							smallint,
	codigomododisputa							int,
	covid19										int
	);

DROP TABLE Siasgnet_dc_VBL.versaocompraitemcompra;
CREATE TABLE Siasgnet_dc_VBL.versaocompraitemcompra (
	codigoversaocompraitemcompra	bigint,
	codigoversaocompra				bigint,
	codigoitemcompra				bigint,
	datahoraregistro				datetime
	);

DROP TABLE Siasgnet_dc_VBL.versaocomprasemlicitacao;
CREATE TABLE Siasgnet_dc_VBL.versaocomprasemlicitacao (
	codigoversaocomprasemlicitacao		bigint,
	codigoincisoparagrafo				int,
	fundamentolegaldescricao			varchar(141),
	justificativacomprasemlicitacao		varchar(141),
	datadeclaracao						date,
	cpfresponsaveldeclaracao			varchar(11),
	nomeresponsaveldeclaracao			varchar(94),
	funcaoresponsaveldeclaracao			varchar(94),
	cpfvalidadoresponsaveldeclaracao	varchar(1),
	dataratificacao						date,
	cpfresponsavelratificacao			varchar(11),
	nomeresponsavelratificacao			varchar(94),
	funcaoresponsavelratificacao		varchar(94),
	cpfvalidadoresponsavelratificacao	varchar(1),
	valortotalcompra					decimal(38,4),
	codigoartigo						int,
	datahoraregistro					datetime,
	codigocaracteristicalicitacao		int,
	codigoversaocomprasemlicitacaosrp	bigint,
	tipouasgdispensa					varchar(1)
	);

------------------------------------------------------------------------------------------------------------------------ Siasgnet_dc_VBL (alterações

--DROP SCHEMA Siasgnet_dc_VBL;
--CREATE SCHEMA Siasgnet_dc_VBL;


--DROP TABLE Siasgnet_dc_VBL.compra_alteracoes;
CREATE TABLE Siasgnet_dc_VBL.compra_alteracoes (
	codigocompra					bigint,
	codigomodalidadecompra			int,
	numerocompra					varchar(5),
	anocompra						varchar(4),
	numerouasgorigem				int,
	numerouasgresponsavel			int,
	tipocompra						varchar(1),
	cpfusuarioencerramento			varchar(11),
	datahoraencerramento			datetime,
	codigopedidodispensaeletronica	bigint,
	codigosistemaorigem				int,
	percentualparagrafounico		int,
	codigolei						int,
	outrashipotesesdispensa			varchar(1),
	datahoraregistro				datetime
	);

DROP TABLE Siasgnet_dc_VBL.itemcompra_alteracoes;
CREATE TABLE Siasgnet_dc_VBL.itemcompra_alteracoes (
	codigoitemcompra			bigint,
	descricao					varchar(120),
	descricaodetalhada			varchar(4000),
	quantidade					bigint,
	numeroitem					int,
	codigotipoitem				int,
	codigosituacaoitemcompra	int,
	codigoitemcatalogo			varchar(9),
	quantidadeconsistente		varchar(1),
	unidadefornecimento			varchar(50),
	siglaunidadefornecimento	varchar(7),
	capacidadeunidademedida		varchar(11),
	nomeunidademedida			varchar(20),
	siglaunidademedida			varchar(7),
	nomeunidadefornecimento		varchar(20),
	datahoraregistro			datetime,
	itemsustentavel				varchar(1),
	codigoitemcomprasrp			bigint,
	quantidadetotalitemsrp		bigint,
	valortotalitemsrp			decimal(38,4)
	);
	
DROP TABLE Siasgnet_dc_VBL.versaocompra_alteracoes;
CREATE TABLE Siasgnet_dc_VBL.versaocompra_alteracoes (
	codigoversaocompra			bigint,
	codigocompra				bigint,
	objeto						varchar(3619),
	codigosituacaocompra		int,
	quantidadeitens				int,
	numeroprocesso				varchar(17),
	numeroversaocompra			int,
	quantidadeitensincluidos	int,
	quantidadeitenscancelados	int,
	datahoraregistro			datetime
	);

DROP TABLE Siasgnet_dc_VBL.versaocompracomlicitacao_alteracoes;
CREATE TABLE Siasgnet_dc_VBL.versaocompracomlicitacao_alteracoes (
	codigoversaocompracomlicitacao				bigint,
	informacoesgerais							varchar(517),
	codigotipolicitacao							int,
	internacional								varchar(1),
	codigoformarealizacao						int,
	equalizacaoicms								varchar(1),
	codigocaracteristicalicitacao				int,
	justificativanaousopregaoeletronico			varchar(517),
	codigotiporecurso							int,
	codigoorigemrecurso							int,
	descricaoorigemoutros						varchar(30),
	numerocontratorecurso						varchar(17),
	valorcontrapartida							decimal(38,4),
	cpfresponsavelautorizacaocompra				varchar(11),
	nomeresponsavelautorizacaocompra			varchar(94),
	funcaoresponsavelautorizacaocompra			varchar(94),
	cpfvalidadoresponsavelautorizacaocompra		varchar(1),
	dataentregaproposta							date,
	horaentregaproposta							datetime,
	enderecoeletronicoentregaproposta			varchar(60),
	dataaberturaproposta						date,
	horaaberturaproposta						datetime,
	enderecoeletronicoaberturaproposta			varchar(60),
	cienciautilizacaopregaorecursointernacional	varchar(1),
	numeroirp									varchar(5),
	anoirp										varchar(4),
	prazovalidadeata							int,
	numerouasgorigemirp							int,
	logradouroentregaedital						varchar(94),
	bairroentregaedital							varchar(40),
	complementoentregaedital					varchar(40),
	codigomunicipioentregaedital				int,
	dddtelefoneentregaedital					varchar(4),
	telefoneentregaedital						varchar(8),
	ramalentregaedital							varchar(4),
	faxentregaedital							varchar(8),
	cepentregaedital							varchar(8),
	dataentregaedital							date,
	horainicioprimeiroperiodoentregaedital		datetime,
	horafimprimeiroperiodoentregaedital			datetime,
	horainiciosegundoperiodoentregaedital		datetime,
	horafimsegundoperiodoentregaedital			datetime,
	logradouroentregaproposta					varchar(94),
	bairroentregaproposta						varchar(40),
	complementoentregaproposta					varchar(40),
	codigomunicipioentregaproposta				int,
	dddtelefoneentregaproposta					varchar(4),
	telefoneentregaproposta						varchar(8),
	ramalentregaproposta						varchar(4),
	faxentregaproposta							varchar(8),
	cepentregaproposta							varchar(8),
	licitacaocombeneficiotipoi					varchar(1),
	obrasservicosengenharia						varchar(1),
	datahoraregistro							datetime,
	compranacional								int,
	contratacaompsetic							smallint,
	codigomododisputa							int,
	covid19										int
	);

DROP TABLE Siasgnet_dc_VBL.versaocompraitemcompra_alteracoes;
CREATE TABLE Siasgnet_dc_VBL.versaocompraitemcompra_alteracoes (
	codigoversaocompraitemcompra	bigint,
	codigoversaocompra				bigint,
	codigoitemcompra				bigint,
	datahoraregistro				datetime
	);

DROP TABLE Siasgnet_dc_VBL.versaocomprasemlicitacao_alteracoes;
CREATE TABLE Siasgnet_dc_VBL.versaocomprasemlicitacao_alteracoes (
	codigoversaocomprasemlicitacao		bigint,
	codigoincisoparagrafo				int,
	fundamentolegaldescricao			varchar(141),
	justificativacomprasemlicitacao		varchar(141),
	datadeclaracao						date,
	cpfresponsaveldeclaracao			varchar(11),
	nomeresponsaveldeclaracao			varchar(94),
	funcaoresponsaveldeclaracao			varchar(94),
	cpfvalidadoresponsaveldeclaracao	varchar(1),
	dataratificacao						date,
	cpfresponsavelratificacao			varchar(11),
	nomeresponsavelratificacao			varchar(94),
	funcaoresponsavelratificacao		varchar(94),
	cpfvalidadoresponsavelratificacao	varchar(1),
	valortotalcompra					decimal(38,4),
	codigoartigo						int,
	datahoraregistro					datetime,
	codigocaracteristicalicitacao		int,
	codigoversaocomprasemlicitacaosrp	bigint,
	tipouasgdispensa					varchar(1)
	);

--DROP SCHEMA dbo;