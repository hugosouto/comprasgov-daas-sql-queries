--CREATE SCHEMA alice;

DROP TABLE seges_delog_cgscg_stage.alice.etp;

CREATE TABLE seges_delog_cgscg_stage.alice.etp (
id INT,
texto VARCHAR(MAX),
valor_total_estimado DECIMAL(17,2), 
uasg VARCHAR(6),
categoria VARCHAR(20),
id_categoria INT,
equipe_cpf VARCHAR(MAX),
tipo_trilha VARCHAR(20)
);

INSERT INTO alice.etp (id,texto,valor_total_estimado,uasg,categoria,id_categoria,tipo_trilha) VALUES (1,'A',1.0,'A','A',1,'A');

DROP TABLE seges_delog_cgscg_stage.alice.etp;

CREATE TABLE seges_delog_cgscg_stage.alice.etp (
id INT,
texto VARCHAR(MAX),
valor_total_estimado DECIMAL(17,2), 
uasg VARCHAR(MAX),
categoria VARCHAR(MAX),
id_categoria INT,
equipe_cpf VARCHAR(MAX),
tipo_trilha VARCHAR(MAX)
);

DROP TABLE seges_delog_cgscg_stage.alice.etp_original;
CREATE TABLE seges_delog_cgscg_stage.alice.etp_original (
id INT,
texto VARCHAR(MAX),
valor_total_estimado DECIMAL(17,2), 
uasg VARCHAR(6),
categoria VARCHAR(20),
id_categoria INT,
tipo_trilha VARCHAR(20)
);

DROP TABLE seges_delog_cgscg_stage.alice.etp_texto;
CREATE TABLE seges_delog_cgscg_stage.alice.etp_texto (
id INT,
conteudo VARCHAR(MAX)
);

