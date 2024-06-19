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
WHERE 1=1
	AND excluido = FALSE 
	AND statuscredenciamentoid != 0 
	AND id NOT IN (160, 161, 179, 180, 182) 
	AND id NOT BETWEEN 1063 AND 1248
--	AND c.datainclusao > '2024-04-26 21:57:53.756'
GROUP BY c.id, c.datainclusao, c.cnpj, c.ata, c.avisocontratacaodireta, c.contrato, c.disponibilizaartefatolicitacao, c.editalcredenciamento, c.editallicitacao, c.esferadistrital, c.esferaestadual, c.esferafederal, c.esferamunicipal, c.nomerazaosocial, c.nomesistema, c.email, c.urlsistema, c.statuscredenciamentoid
ORDER BY id
;