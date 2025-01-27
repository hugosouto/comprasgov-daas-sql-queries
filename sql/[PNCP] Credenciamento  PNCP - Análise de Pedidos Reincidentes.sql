SELECT cnpj, COUNT(*) contagem
FROM credenciamento
GROUP BY cnpj
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

SELECT
	DISTINCT cnpj
	, COUNT(*)
	--statuscredenciamentoid
FROM
	credenciamento c
GROUP BY
--	  id
	  termosdeclaracaoaceite
	, cnpj
	, nomerazaosocial
	, email
	, urlsistema
	, nomesistema
	, responsavelcadastronome
	, responsavelcadastrocpf
	, responsavelcadastroemail
	, responsavelcadastrotelefone
	, esferafederal
	, esferaestadual
	, esferamunicipal
	, esferadistrital
	, disponibilizaartefatolicitacao
	, editalcredenciamento
	, urleditalcredenciamento
	, avisocontratacaodireta
	, urlavisocontratacaodireta
	, editallicitacao
	, urleditallicitacao
	, ata
	, urlata
	, contrato
	, urlcontrato
--	, usuarioanaliseprocessoid
--	, dataanaliseprocesso
--	, justificativaanalise
--	, usuariocredenciadoid
--	, datainclusao
--	, excluido
--	, sequencialcredenciamento
	, ano
--	, usuariocredenciadoidnaoprodutivo
--	, loginnaoprodutivo
HAVING COUNT(*) > 1
ORDER BY
	COUNT(*) DESC;