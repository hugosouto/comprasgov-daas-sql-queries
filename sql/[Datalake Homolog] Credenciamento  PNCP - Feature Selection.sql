-- Consulta limpa com enriquecimento
SELECT
	id
,	datainclusao
,	cnpj
,	a.codigo_atividade_principal
,	a.descricao_atividade_principal
,	n.cod_natureza_juridica
,	n.descricao_natureza_juridica 
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
,	emailproc
,	urlsistema
,	urlsistemaproc
,	statuscredenciamentoidproc
FROM credenciamento_pncp.credenciamentoproc c
LEFT JOIN credenciamento_pncp.atividade_principal a ON a.cnpj_atividade_principal = c.cnpj
LEFT JOIN credenciamento_pncp.natureza_juridica n ON n.cnpj_natureza_juridica = c.cnpj
ORDER BY id
;

-- Contagem por statuscredenciamentoid
SELECT statuscredenciamentoidproc, COUNT(*)
FROM credenciamento_pncp.credenciamentoproc
GROUP BY statuscredenciamentoidproc
;