SELECT
    UPPER(vc.numeroprocesso) AS PROCESSO,
    CASE WHEN u.sisg = 'T' THEN 'SISG'
    WHEN u.sisg = 'F' THEN 'Não SISG' END AS SISG,
    UPPER(c.numerouasgresponsavel) AS COD_UASG,
    UPPER(u.nome) AS UASG,
    UPPER(o.nome) AS ORGAO,
    CASE WHEN o.codigopoder = 0 THEN 'Executivo'
    WHEN o.codigopoder = 1 THEN 'Legislativo'
    WHEN o.codigopoder = 2 THEN 'Judiciário'
    ELSE o.codigopoder END AS PODER,
    CASE WHEN o.codigoesfera = 0 THEN 'Federal'
    WHEN o.codigoesfera = 1 THEN 'Municipal'
    WHEN o.codigoesfera = 2 THEN 'Estadual'
    ELSE o.codigoesfera END AS ESFERA,
    UPPER(m.uf) AS UF,
    CASE WHEN m.nome = 'BRASÍLIA' THEN 'Brasília' ELSE m.nome END AS MUNICIPIO,
    'Pregão' AS MODALIDADE,
    CASE WHEN vcl.codigoformarealizacao = 2 THEN 'Presencial' ELSE 'Eletrônico' END AS FORMATO,
    CASE WHEN vcl.codigocaracteristicalicitacao = 2 THEN 'Registro de Preços' ELSE ' ' END AS SRP,
    CAST(c.numerocompra AS INTEGER) AS NUM_COMPRA,
    CAST(c.anocompra AS INTEGER) AS ANO_COMPRA,
    vcl.cpfresponsavelautorizacaocompra AS RESPONSAVEL_CPF,
    vcl.nomeresponsavelautorizacaocompra AS RESPONSAVEL_NOME,
    vcl.funcaoresponsavelautorizacaocompra AS RESPONSAVEL_FUNCAO,
    UPPER(vc.objeto) AS OBJETO,
    'Lei nº 13.979 (Emergência Coronavírus)' AS LEI_NOME,
    'http://compras.dados.gov.br/licitacoes/doc/licitacao/'||LPAD(c.numerouasgresponsavel,6,'0')||LPAD(c.codigomodalidadecompra,2,'0')||LPAD(c.numerocompra,5,'0')||LPAD(c.anocompra,4,'0') AS LINK_COMPRA,
    LPAD(c.numerouasgresponsavel,6,'0')||LPAD(c.codigomodalidadecompra,2,'0')||LPAD(c.numerocompra,5,'0')||LPAD(c.anocompra,4,'0') AS COD_COMPRA_SIASGNET,
    vc.codigoversaocompra
FROM
    Siasgnet_dc_VBL.versaocompra AS vc
LEFT JOIN Siasgnet_dc_VBL.versaocompracomlicitacao AS vcl
    ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao
INNER JOIN Siasgnet_dc_VBL.compra AS c
    ON vc.codigocompra = c.codigocompra
INNER JOIN Siasgnet_VBL.uasg AS u
    ON c.numerouasgresponsavel = u.numerouasg
INNER JOIN Siasgnet_VBL.orgao AS o
    ON u.numeroorgaouasg = o.numeroorgao
INNER JOIN Siasgnet_VBL.municipio AS m
    ON u.codigomunicipio = m.codigomunicipio
WHERE
    SUBSTRING(vcl.datahoraregistro,1,10) > '2020-00-00'
    AND c.codigomodalidadecompra = 5
    AND vcl.covid19 = 1

UNION

SELECT
    UPPER(vc.numeroprocesso) AS PROCESSO,
    CASE WHEN u.sisg = 'T' THEN 'SISG'
    WHEN u.sisg = 'F' THEN 'Não SISG' END AS SISG,
    UPPER(c.numerouasgresponsavel) AS COD_UASG,
    UPPER(u.nome) AS UASG,
    UPPER(o.nome) AS ORGAO,
    CASE WHEN o.codigopoder = 0 THEN 'Executivo'
    WHEN o.codigopoder = 1 THEN 'Legislativo'
    WHEN o.codigopoder = 2 THEN 'Judiciário'
    ELSE o.codigopoder END AS PODER,
    CASE WHEN o.codigoesfera = 0 THEN 'Federal'
    WHEN o.codigoesfera = 1 THEN 'Municipal'
    WHEN o.codigoesfera = 2 THEN 'Estadual'
    ELSE o.codigoesfera END AS ESFERA,
    UPPER(m.uf) AS UF,
    CASE WHEN m.nome = 'BRASÍLIA' THEN 'Brasília' ELSE m.nome END AS MUNICIPIO,
    'Dispensa de Licitação' AS MODALIDADE,
    CASE WHEN c.codigopedidodispensaeletronica IS NOT NULL THEN 'Cotação Eletrônica' ELSE 'Tradicional' END AS FORMATO,
    CASE WHEN vsl.codigocaracteristicalicitacao = 2 THEN 'Registro de Preços' ELSE ' ' END AS SRP,
    CAST(c.numerocompra AS INTEGER) AS NUM_COMPRA,
    CAST(c.anocompra AS INTEGER) AS ANO_COMPRA,
    vsl.cpfresponsaveldeclaracao AS RESPONSAVEL_CPF,
    vsl.nomeresponsaveldeclaracao AS RESPONSAVEL_NOME,
    vsl.funcaoresponsaveldeclaracao AS RESPONSAVEL_FUNCAO,
    UPPER(vc.objeto) AS OBJETO,
    l.descricaocurta||' ('||l.nomelei||')' AS LEI_NOME,
    'http://compras.dados.gov.br/compraSemLicitacao/doc/compra_slicitacao/'||LPAD(c.numerouasgresponsavel,6,'0')||LPAD(c.codigomodalidadecompra,2,'0')||LPAD(c.numerocompra,5,'0')||LPAD(c.anocompra,4,'0') AS LINK_COMPRA,
    LPAD(c.numerouasgresponsavel,6,'0')||LPAD(c.codigomodalidadecompra,2,'0')||LPAD(c.numerocompra,5,'0')||LPAD(c.anocompra,4,'0') AS COD_COMPRA_SIASGNET,
    vc.codigoversaocompra
FROM
    Siasgnet_dc_VBL.versaocompra AS vc
LEFT JOIN Siasgnet_dc_VBL.versaocomprasemlicitacao AS vsl
    ON vc.codigoversaocompra = vsl.codigoversaocomprasemlicitacao
INNER JOIN Siasgnet_dc_VBL.compra AS c
    ON vc.codigocompra = c.codigocompra
INNER JOIN Siasgnet_VBL.uasg AS u
    ON c.numerouasgresponsavel = u.numerouasg
INNER JOIN Siasgnet_VBL.orgao AS o
    ON u.numeroorgaouasg = o.numeroorgao
INNER JOIN Siasgnet_VBL.municipio AS m
    ON u.codigomunicipio = m.codigomunicipio
INNER JOIN Siasgnet_VBL.artigo AS a
    ON vsl.codigoartigo = a.codigoartigo
INNER JOIN Siasgnet_VBL.lei AS l
    ON l.codigolei = a.codigolei
WHERE
    SUBSTRING(vsl.datahoraregistro,1,10) > '2020-00-00'
    AND c.codigomodalidadecompra = 6
    AND (l.nomelei = 'Emergência Coronavírus' OR
    UPPER(vc.objeto) LIKE '%COVID%' OR
    UPPER(vc.objeto) LIKE '%CORONA%' OR
    UPPER(vc.objeto) LIKE '%PANDEMIA%' OR
    UPPER(vc.objeto) LIKE '%ENFRENTAMENTO%' OR
    UPPER(vc.objeto) LIKE '%SARS_COV_2%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%COVID%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%CORONA%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%PANDEMIA%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%ENFRENTAMENTO%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%SARS_COV_2%')
;