-- Drop table no Datalake Homologação (10.209.42.30)
DROP TABLE seges_delog_cgscg_stage.pncp.portais_integrados;

-- Creat table no Datalake Homologação (10.209.42.30)
CREATE TABLE seges_delog_cgscg_stage.pncp.portais_integrados (
	id int,
	nomerazaosocial varchar(200),
	cpfcnpj varchar(14),
	datainclusao datetime
)

-- Insere dados artificiais para teste
INSERT INTO seges_delog_cgscg_stage.pncp.portais_integrados (id,nomerazaosocial,cpfcnpj,datainclusao)
VALUES (3,'Compras.gov.br','00394460000141', '05/08/2021 00:00:00.000');
INSERT INTO seges_delog_cgscg_stage.pncp.portais_integrados (id,nomerazaosocial,cpfcnpj,datainclusao)
VALUES (3,'Compras.gov.br','00394460000141', '05/08/2021 00:00:00.000');
INSERT INTO seges_delog_cgscg_stage.pncp.portais_integrados (id,nomerazaosocial,cpfcnpj,datainclusao)
VALUES (5,'ECustomize Consultoria em Software S.A','09397355000130', '09/08/2021 00:00:00.000');