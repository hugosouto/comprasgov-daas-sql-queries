-- Consulta full para Postgre credenciamentoproc
SELECT
	c.id
,	c.datainclusao
,	c.cnpj
,	c.ata
,	c.avisocontratacaodireta
,	c.contrato
--,	c.disponibilizaartefatolicitacao
,	c.editalcredenciamento
,	c.editallicitacao
,	c.esferadistrital
,	c.esferaestadual
,	c.esferafederal
,	c.esferamunicipal
,	CASE WHEN urlsistema LIKE '%.__.gov.br' THEN TRUE ELSE FALSE END urldominioestadual 
,	CASE COUNT(u.uf) WHEN 1 THEN 0 WHEN 27 THEN 2 ELSE 1 END classe_abrangencia
,	LOWER(c.nomerazaosocial) nomerazaosocial
,	LOWER(c.nomesistema) nomesistema
--,	LOWER(c.email) email
,	REPLACE(REPLACE(LOWER(c.email), '@',' '), '.', ' ') emailproc
,	SUBSTRING(LOWER(c.email), LOCATE('@', email) + 1) emaildominio
,	REPLACE(SUBSTRING(LOWER(c.email), LOCATE('@', email) + 1), '.', ' ') emaildominioproc
,	REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(LOWER(c.email), LOCATE('@', email) + 1),
		'.gov', ''),
		'.br', ''),
		'.com', ''),
		'.', ' ')
		emaildominioclean
--,	LOWER(c.urlsistema) urlsistema
,	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(	
		LOWER(c.urlsistema),
		'https://', ''),
		'http://', ''), 
		'http:', ''), 
		'http', ''),
		'www2.', ''), 
		'www.', ''),
		'pncp.gov.br', 'pncp_gov_br'),
		'gov.br/pncp/pt-br', 'pncp_gov_br'),
		'comprasnet.gov.br', 'comprasnet_gov_br'),
		'com.br', 'com_br'),
		'gov.br', 'gov_br'),
		'.com', ''),
		':', ' '),
		'/', ' '),
		'.', ' '),
		'@', ' ')
		urlsistemaproc
--,	COUNT(u.uf) uf_contagem
--,	STRING_AGG(lower(u.uf), ' ') AS ufs
,	CASE c.statuscredenciamentoid WHEN 1 THEN True WHEN 2 THEN FALSE END statuscredenciamentoidproc
FROM PNCP_VBL.credenciamento c
JOIN PNCP_VBL.credenciamentouf u ON c.id = u.credenciamentoid
WHERE excluido = FALSE AND statuscredenciamentoid != 0 AND id NOT IN (160, 161, 179, 180, 182) AND id NOT BETWEEN 1063 AND 1248
GROUP BY c.id, c.datainclusao, c.cnpj, c.ata, c.avisocontratacaodireta, c.contrato, c.disponibilizaartefatolicitacao, c.editalcredenciamento, c.editallicitacao, c.esferadistrital, c.esferaestadual, c.esferafederal, c.esferamunicipal, c.nomerazaosocial, c.nomesistema, c.email, c.urlsistema, c.statuscredenciamentoid
ORDER BY id
;

-- Consulta limpa com UF e filtros
SELECT
	c.id
,	c.datainclusao
,	c.cnpj
,	c.ata
,	c.avisocontratacaodireta
,	c.contrato
,	c.disponibilizaartefatolicitacao
,	c.editalcredenciamento
,	c.editallicitacao
,	c.esferadistrital
,	c.esferaestadual
,	c.esferafederal
,	c.esferamunicipal
,	c.nomerazaosocial
,	c.nomesistema
,	c.email
,	REPLACE(REPLACE(c.email, '@',' '), '.', ' ') emailproc
,	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		c.urlsistema,
		'https://',''), 'http://', ''), 'www.', ''),'/', ' '), '.', ' ') urlsistemaproc
,	c.urlsistema
, 	CASE COUNT(u.uf) WHEN 1 THEN 0 WHEN 27 THEN 2 ELSE 1 END classe_abrangencia
,	COUNT(u.uf) uf_contagem
,	STRING_AGG(lower(u.uf), ' ') AS ufs
,	CASE c.statuscredenciamentoid WHEN 1 THEN True WHEN 2 THEN FALSE END statuscredenciamentoidproc
FROM PNCP_VBL.credenciamento c
JOIN PNCP_VBL.credenciamentouf u ON c.id = u.credenciamentoid
WHERE excluido = FALSE
GROUP BY c.id, c.datainclusao, c.cnpj, c.ata, c.avisocontratacaodireta, c.contrato, c.disponibilizaartefatolicitacao, c.editalcredenciamento, c.editallicitacao, c.esferadistrital, c.esferaestadual, c.esferafederal, c.esferamunicipal, c.nomerazaosocial, c.nomesistema, c.email, c.urlsistema, c.statuscredenciamentoid
ORDER BY c.id

--GROUP BY c.*
ORDER BY id;

-- Consulta credenciamentouf pura
SELECT credenciamentoid, uf FROM PNCP_VBL.credenciamentouf;

-- Consulta com UFs
SELECT
	c.id
,	c.datainclusao
,	c.cnpj
,	c.ata
,	c.avisocontratacaodireta
,	c.contrato
,	c.disponibilizaartefatolicitacao
,	c.editalcredenciamento
,	c.editallicitacao
,	c.esferadistrital
,	c.esferaestadual
,	c.esferafederal
,	c.esferamunicipal
,	LOWER(c.nomerazaosocial) nomerazaosocial
,	LOWER(c.nomesistema) nomesistema
,	LOWER(c.email) email
,	REPLACE(REPLACE(LOWER(c.email), '@',' '), '.', ' ') emailproc
,	SUBSTRING(LOWER(c.email), LOCATE('@', email) + 1) emaildominio
,	REPLACE(SUBSTRING(LOWER(c.email), LOCATE('@', email) + 1), '.', ' ') emaildominioproc
,	REPLACE(REPLACE(REPLACE(REPLACE(SUBSTRING(LOWER(c.email), LOCATE('@', email) + 1),
		'.gov', ''),
		'.br', ''),
		'.com', ''),
		'.', ' ')
		emaildominioclean
,	LOWER(c.urlsistema) urlsistema
,	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(	
		LOWER(c.urlsistema),
		'https://', ''),
		'http://', ''), 
		'http:', ''), 
		'http', ''),
		'www2.', ''), 
		'www.', ''),
		'pncp.gov.br', 'pncp_gov_br'),
		'gov.br/pncp/pt-br', 'pncp_gov_br'),
		'comprasnet.gov.br', 'comprasnet_gov_br'),
		'com.br', 'com_br'),
		'gov.br', 'gov_br'),
		'.com', ''),
		':', ' '),
		'/', ' '),
		'.', ' '),
		'@', ' ')
		urlsistemaproc
,	CASE WHEN urlsistema LIKE '%.__.gov.br' THEN TRUE ELSE FALSE END urldominioestadual 
,	COUNT(u.uf) uf_contagem
,	CASE COUNT(u.uf)
		WHEN 1 THEN 0
		WHEN 27 THEN 2
		ELSE 
		1 END classe_abrangencia
,	STRING_AGG(lower(u.uf), ' ') AS ufs
,	CASE c.statuscredenciamentoid WHEN 1 THEN True WHEN 2 THEN FALSE END statuscredenciamentoidproc
FROM PNCP_VBL.credenciamento c
JOIN PNCP_VBL.credenciamentouf u ON c.id = u.credenciamentoid
WHERE excluido = FALSE AND statuscredenciamentoid != 0 AND id NOT IN (160, 161, 179, 180, 182) AND id NOT BETWEEN 1063 AND 1248
GROUP BY c.id, c.datainclusao, c.cnpj, c.ata, c.avisocontratacaodireta, c.contrato, c.disponibilizaartefatolicitacao, c.editalcredenciamento, c.editallicitacao, c.esferadistrital, c.esferaestadual, c.esferafederal, c.esferamunicipal, c.nomerazaosocial, c.nomesistema, c.email, c.urlsistema, c.statuscredenciamentoid
ORDER BY id
;
-- Consulta limpa
SELECT
	id
,	datainclusao
,	cnpj
,	ata
,	avisocontratacaodireta
,	contrato
,	disponibilizaartefatolicitacao
,	editalcredenciamento
,	editallicitacao
,	esferadistrital
,	esferaestadual
,	esferafederal
,	esferamunicipal
,	nomerazaosocial
,	nomesistema
,	email
,	REPLACE(REPLACE(email, '@',' '), '.', ' ') emailproc
,	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		urlsistema,
		'https://',''), 'http://', ''), 'www.', ''),'/', ' '), '.', ' ') urlsistemaproc
,	urlsistema
,	CASE statuscredenciamentoid WHEN 1 THEN True WHEN 2 THEN FALSE END statuscredenciamentoidproc
FROM PNCP_VBL.credenciamento
WHERE excluido = FALSE AND statuscredenciamentoid != 0
ORDER BY id
;
-- Consulta completa
SELECT
	id
,	datainclusao
,	cnpj
,	ata
,	avisocontratacaodireta
,	contrato
,	disponibilizaartefatolicitacao
,	editalcredenciamento
,	editallicitacao
,	esferadistrital
,	esferaestadual
,	esferafederal
,	esferamunicipal
,	nomerazaosocial
,	nomesistema
,	REPLACE(REPLACE(email, '@',' '), '.', ' ') emailproc
,	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		urlsistema,
		'https://',''), 'http://', ''), 'www.', ''),'/', ' '), '.', ' ') urlsistemaproc
,	urlsistema
,	statuscredenciamentoid
--,	excluido
--,	urlata
--,	urlavisocontratacaodireta
--,	urlcontrato
--,	urleditalcredenciamento
--,	urleditallicitacao
--	ano
--,	dataanaliseprocesso
--,	justificativaanalise
--,	loginnaoprodutivo
--,	responsavelcadastrocpf
--,	responsavelcadastroemail
--,	responsavelcadastronome
--,	responsavelcadastrotelefone
--,	sequencialcredenciamento
--,	termosdeclaracaoaceite
--,	usuarioanaliseprocessoid
--,	usuariocredenciadoid
--,	usuariocredenciadoidnaoprodutivo
FROM PNCP_VBL.credenciamento
WHERE excluido = FALSE AND statuscredenciamentoid != 0
;
-- Contagem por statuscredenciamentoid
SELECT statuscredenciamentoid, COUNT(*)
FROM PNCP_VBL.credenciamento
GROUP BY statuscredenciamentoid
;