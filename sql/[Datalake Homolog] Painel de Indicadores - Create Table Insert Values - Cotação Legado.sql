CREATE TABLE seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (
	anomes varchar(6) COLLATE Latin1_General_CI_AS NULL,
	mediaparticipantescotacaolegado float NULL,
	datahoraregistro datetime NULL
) GO;

INSERT INTO seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (anomes, mediaparticipantescotacaolegado, datahoraregistro) VALUES('202101', 11.70, '2020-12-31 00:00:00');
INSERT INTO seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (anomes, mediaparticipantescotacaolegado, datahoraregistro) VALUES('202102', 15.57, '2020-12-31 00:00:00');
INSERT INTO seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (anomes, mediaparticipantescotacaolegado, datahoraregistro) VALUES('202103', 13.37, '2020-12-31 00:00:00');
INSERT INTO seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (anomes, mediaparticipantescotacaolegado, datahoraregistro) VALUES('202104', 12.22, '2020-12-31 00:00:00');
INSERT INTO seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (anomes, mediaparticipantescotacaolegado, datahoraregistro) VALUES('202105', 11.87, '2020-12-31 00:00:00');
INSERT INTO seges_delog_cgscg_stage.painel_indicadores.competitividade_cotacao_legado (anomes, mediaparticipantescotacaolegado, datahoraregistro) VALUES('202106', 11.56, '2020-12-31 00:00:00');
;

-----------------------------------------------------------------------------------------

CREATE TABLE seges_delog_cgscg_stage.painel_indicadores.competitividade_pregao_contagem (
	anomes varchar(6) COLLATE Latin1_General_CI_AS NULL,
	mediaparticipantespregao float NULL,
	contapregao INT,
	contapropostaspregao INT,
	datahoraregistro datetime NULL
) GO;

CREATE TABLE seges_delog_cgscg_stage.painel_indicadores.competitividade_pregao_unicos (
	anomes varchar(6) COLLATE Latin1_General_CI_AS NULL,
	contapropostasunicaspregao INT,
	datahoraregistro datetime NULL
) GO;

CREATE TABLE seges_delog_cgscg_stage.painel_indicadores.competitividade_dispensa_cotacao (
	anomes varchar(6) COLLATE Latin1_General_CI_AS NULL,
	mediaparticipantescotacoesdispensa float NULL,
	contacotacoesdispensa INT,
	contapropostascotacoesdispensas INT,
	datahoraregistro datetime NULL
) GO;

CREATE TABLE seges_delog_cgscg_stage.painel_indicadores.competitividade_dispensa_cotacao_unicos (
	anomes varchar(6) COLLATE Latin1_General_CI_AS NULL,
	contapropostasunicascotacoesdispensas INT,
	datahoraregistro datetime NULL
) GO;
