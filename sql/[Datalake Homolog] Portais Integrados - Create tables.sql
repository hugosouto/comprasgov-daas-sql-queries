--DROP TABLE seges_delog_cgscg_stage.pncp.portais_integrados;

CREATE TABLE seges_delog_cgscg_stage.pncp.portais_integrados (
	qt_contratos_pncp int,
	qt_compras int,
	datainclusao varchar(10),
	id int,
	nomerazaosocial varchar(max),
	cpfcnpj varchar(max),
)

INSERT INTO seges_delog_cgscg_stage.pncp.portais_integrados (qt_contratos_pncp,qt_compras,datainclusao,id,nomerazaosocial,cpfcnpj)
VALUES (8355,79251,'05/08/2021', 3,'Compras.gov.br','00394460000141');
INSERT INTO seges_delog_cgscg_stage.pncp.portais_integrados (qt_contratos_pncp,qt_compras,datainclusao,id,nomerazaosocial,cpfcnpj)
VALUES (7986,76728,'05/08/2021',3,'Compras.gov.br','00394460000141');
INSERT INTO seges_delog_cgscg_stage.pncp.portais_integrados (qt_contratos_pncp,qt_compras,datainclusao,id,nomerazaosocial,cpfcnpj)
VALUES (665,3100,'09/08/2021',5,'ECustomize Consultoria em Software S.A','09397355000130');
