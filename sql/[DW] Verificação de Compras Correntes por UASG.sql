SELECT
    C.DS_CMPR_COMPRA,
    S.DS_CMPR_SIT_ATUAL_COMPRA,
    C.DT_CMPR_RESULTADO_COMPRA
FROM
    D_CMPR_COMPRA C
    JOIN D_CMPR_SIT_ATUAL_COMPRA S ON C.ID_CMPR_SIT_ATUAL_COMPRA = S.ID_CMPR_SIT_ATUAL_COMPRA
WHERE
    ID_UNDD_RESP_COMPRA IN (
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
    AND DT_REFERENCIA_COMPRA >= '2022-01-01'