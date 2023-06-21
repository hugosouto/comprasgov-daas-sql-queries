DROP TABLE Siasgnet_dc_VBL.itemcompra_teste;
CREATE TABLE Siasgnet_dc_VBL.itemcompra_teste3 (
	codigoitemcompra			bigint,
	descricao					varchar(120),
	descricaodetalhada			varchar(8000),
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
