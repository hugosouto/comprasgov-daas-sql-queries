-- Consulta limpa para Experimento 002-001
SELECT
    c.id,
    c.datainclusao,
    c.cnpj,
    c.ata,
    c.avisocontratacaodireta,
    c.contrato,
    c.editalcredenciamento,
    c.editallicitacao,
    c.esferadistrital,
    c.esferaestadual,
    c.esferafederal,
    c.esferamunicipal,
    c.nomerazaosocial,
    c.nomesistema,
    c.email,
    c.urlsistema,
    c.statuscredenciamentoid,
    u.uf
FROM PNCP_VBL.credenciamento c
JOIN PNCP_VBL.credenciamentouf u ON c.id = u.credenciamentoid
WHERE 1=1
    AND excluido = FALSE 
    AND statuscredenciamentoid != 0 
    AND id NOT IN (160, 161, 179, 180, 182) 
    AND id NOT BETWEEN 1063 AND 1248
GROUP BY c.id, c.datainclusao, c.cnpj, c.ata, c.avisocontratacaodireta, c.contrato, c.editalcredenciamento, c.editallicitacao, c.esferadistrital, c.esferaestadual, c.esferafederal, c.esferamunicipal, c.nomerazaosocial, c.nomesistema, c.email, c.urlsistema, c.statuscredenciamentoid, u.uf
ORDER BY c.id
;
