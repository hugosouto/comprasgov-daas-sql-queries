DROP TABLE catalogo.ncm;

CREATE TABLE catalogo.ncm (
	codigo VARCHAR(100),
	descricao VARCHAR(1000),
	data_inicio DATE,
	data_fim DATE,
	ato_legal_inicio VARCHAR(100),
	numero SMALLINT,
	ano CHAR(4)
	);
	
INSERT INTO catalogo.ncm VALUES ('0708.10.00', '- Ervilhas (Pisum sativum)', '2022/04/01', '9999/12/31', 'Res Camex', 272, '2021');