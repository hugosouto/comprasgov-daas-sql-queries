DROP SCHEMA indicadores;
CREATE SCHEMA painel_indicadores;


DROP TABLE painel_indicadores.scdp_nacional
DROP TABLE painel_indicadores.scdp_nacional_hist;
CREATE TABLE painel_indicadores.scdp_nacional (anomes varchar(6),valormedionacional numeric(38,6), datahoraregistro datetime);
CREATE TABLE painel_indicadores.scdp_nacional_log (anomes varchar(6),valormedionacional numeric(38,6), datahoraregistro datetime);

DROP TABLE painel_indicadores.scdp_internacional
DROP TABLE painel_indicadores.scdp_internacional_hist;
CREATE TABLE painel_indicadores.scdp_internacional (anomes varchar(6),valormediointernacional numeric(38,6), datahoraregistro datetime);
CREATE TABLE painel_indicadores.scdp_internacional_log (anomes varchar(6),valormediointernacional numeric(38,6), datahoraregistro datetime);

DROP TABLE painel_indicadores.competitividade_dispensas;
CREATE TABLE painel_indicadores.competitividade_dispensas (DS_CMPR_COMPRA varchar(17));

DROP TABLE painel_indicadores.competitividade_cotacao;
DROP TABLE painel_indicadores.competitividade_cotacao_hist;
DROP TABLE painel_indicadores.competitividade_dispensa;
DROP TABLE painel_indicadores.competitividade_dispensa_log;
CREATE TABLE painel_indicadores.competitividade_cotacao (anomes varchar(6), mediaparticipantescotacao float, datahoraregistro datetime);
CREATE TABLE painel_indicadores.competitividade_cotacao_log (anomes varchar(6), mediaparticipantescotacao float, datahoraregistro datetime);
CREATE TABLE painel_indicadores.competitividade_dispensa (anomes varchar(6), mediaparticipantesdispensa float, datahoraregistro datetime);
CREATE TABLE painel_indicadores.competitividade_dispensa_log (anomes varchar(6), mediaparticipantesdispensa float, datahoraregistro datetime);

DROP TABLE painel_indicadores.competitividade_pregao
DROP TABLE painel_indicadores.competitividade_pregao_hist;
CREATE TABLE painel_indicadores.competitividade_pregao (anomes varchar(6), mediaparticipantespregao float, datahoraregistro datetime);
CREATE TABLE painel_indicadores.competitividade_pregao_log (anomes varchar(6), mediaparticipantespregao float, datahoraregistro datetime);

DROP TABLE painel_indicadores.unidades;
DROP TABLE painel_indicadores.unidades_log;
CREATE TABLE painel_indicadores.unidades (anomes varchar(6), saldounidades int, datahoraregistro datetime);
CREATE TABLE painel_indicadores.unidades_log (anomes varchar(6), saldounidades int, datahoraregistro datetime);

DROP TABLE painel_indicadores.municipios
DROP TABLE painel_indicadores.municipios_hist;
CREATE TABLE painel_indicadores.municipios (anomes varchar(6), contaentessub int, datahoraregistro datetime);
CREATE TABLE painel_indicadores.municipios_log (anomes varchar(6), contaentessub int, datahoraregistro datetime);