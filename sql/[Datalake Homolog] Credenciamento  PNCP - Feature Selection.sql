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
,	REPLACE(REPLACE(email, '@',' '), '.', ' ') emailproc
,	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		urlsistema,
		'https://',''), 'http://', ''), 'www.', ''),'/', ' '), '.', ' ') urlsistemaproc
,	urlsistema
,	CASE statuscredenciamentoid WHEN 1 THEN True WHEN 2 THEN FALSE END statuscredenciamentoidproc
FROM PNCP_VBL.credenciamento
WHERE excluido = FALSE AND statuscredenciamentoid != 0
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