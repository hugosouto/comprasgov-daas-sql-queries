SELECT
    'Pregão Eletrônico' modalidade,
    p.prgCod idcompra,
    pi.ipgCod iditemcompra,
    p.coduasg coduasg,
    u.nomuasg nomuasg,
    CAST(SUBSTRING(LPAD(p.numprp, 9, 0), 1, 5) AS INTEGER) numcompra,
    CAST(SUBSTRING(LPAD(p.numprp, 9, 0), 6, 4) AS INTEGER) anocompra,
    pi.ipgItem itemcompra,
    pi.spgCod statusitemcod,
    TRIM(spi.spgDescricao) statusitem
FROM
    Comprasnet_VBL.tbl_Pregao p
    JOIN Comprasnet_VBL.tbl_pregaoitem pi ON p.prgCod = pi.prgCod
    JOIN Comprasnet_VBL.tbb_StatusPregaoItem spi ON pi.spgCod = spi.spgCod
    JOIN Comprasnet_VBL.tb_uasg u ON p.coduasg = u.coduasg
WHERE
    p.coduasg IN (
        928138,
        926683,
        926366,
        926382,
        926095,
        925012,
        925061,
        926346,
        925086,
        925063,
        926392,
        926361,
        926387,
        926728,
        926192
    )
    AND pi.spgCod NOT IN (6, 9, 10, 11) -- 6 = Cancelado, 9 = Homologado, 10 = Cancelado no julgamento, 11 = Cancelado na adjudicação
UNION
SELECT
    'Cotação Eletrônica' modalidade,
    c.COT_CODIGO,
    ci.ITC_CODIGO,
    c.COT_UASG,
    u.nomuasg,
    CAST(SUBSTRING(LPAD(c.COT_NUMPRP, 9, 0), 1, 5) AS INTEGER),
    CAST(SUBSTRING(LPAD(c.COT_NUMPRP, 9, 0), 6, 4) AS INTEGER),
    ci.ITC_NUMERO,
    ci.STA_CODIGO,
    cs.STA_DESCRICAO
FROM
    Comprasnet_VBL.TBL_COT_COTACAO c
    JOIN Comprasnet_VBL.TBL_COT_ITENS_COTACAO ci ON c.COT_CODIGO = ci.COT_CODIGO
    JOIN Comprasnet_VBL.TBB_COT_STATUS cs ON ci.STA_CODIGO = cs.STA_CODIGO
    JOIN Comprasnet_VBL.tb_uasg u ON c.COT_UASG = u.coduasg
WHERE
    c.COT_UASG IN (
        928138,
        926683,
        926366,
        926382,
        926095,
        925012,
        925061,
        926346,
        925086,
        925063,
        926392,
        926361,
        926387,
        926728,
        926192
    )
    AND ci.STA_CODIGO NOT IN (102, 106, 110) -- 102 = Cancelado, 106 = Homologado, 110 = Revogado
ORDER BY
    idcompra,
    iditemcompra,
    itemcompra