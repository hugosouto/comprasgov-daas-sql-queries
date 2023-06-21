WITH 
siasgnet_uniq AS (
	SELECT es.*
	FROM Stg_Siasg.covid19_v2.extracao_siasg_net es
	JOIN
		(
			SELECT
			    COD_COMPRA_SIASGNET,
			    max(codigoversaocompra) as max_versao
			FROM Stg_Siasg.covid19_v2.extracao_siasg_net
			GROUP BY COD_COMPRA_SIASGNET
		) suv
        ON es.COD_COMPRA_SIASGNET = suv.COD_COMPRA_SIASGNET
        AND es.codigoversaocompra = suv.max_versao
),
join_comprasnet AS (
    SELECT
        ec.COD_ITEM,
        ec.STATUS_1,
        esc.COD_COMPRA,
        esc.STATUS_2,
        esc.NUM_ITEM,
        esc.QUANTIDADE,
        esc.TIPO,
        esc.CATMAT_CATSER,
        esc.ITEM_DESCRICAO,
        esc.UNIDADE,
        esc.PRECO_UNITARIO,
        esc.PRECO_TOTAL,
        esc.CNPJ,
        esc.RAZAO_SOCIAL,
        esc.[DATA]
    FROM covid19_v2.extracao_siasg_compras esc
    LEFT JOIN covid19_v2.extracao_comprasnet ec
    ON ec.COD_ITEM = esc.COD_ITEM
),
join_compras AS (
    SELECT
        jc.*,
        su.*,
        CASE
            WHEN (jc.STATUS_1 = '' OR jc.STATUS_1 IS NULL)
            AND (jc.STATUS_2 = '' OR jc.STATUS_2 IS NULL)
                THEN 'OUTROS'
            ELSE LTRIM(CONCAT(jc.STATUS_1, jc.STATUS_2))
            END AS STATUS_ITEM
    FROM join_comprasnet jc
    JOIN siasgnet_uniq su
        ON jc.COD_COMPRA = su.COD_COMPRA_SIASGNET
),
join_aditivos AS (
    SELECT
        esc.COD_COMPRA,
        esc.PROCESSO_CONTRATO,
        esc.IT_CO_CONTRATO,
        esc.IT_NU_CONTRATO,
        esc.CNPJ,
        esc.IT_VA_TOTAL,
        esc.IT_DA_ASSINATURA,
        esc.IT_DA_INICIO_VIGENCIA,
        esc.IT_DA_TERMINO_VIGENCIA,
        REPLACE(esc.NOTA_EMPENHO, '  ', 'NE') as NOTA_EMPENHO,
        REPLACE(esc.LINK_EMPENHO, '  ', 'NE') as LINK_EMPENHO,
        esc.LINK_CONTRATO,
        esc.ADITIVOS_CHAVE,
        COALESCE(esa.ADITIVOS, 0) as ADITIVOS
    FROM Stg_Siasg.covid19_v2.extracao_siasg_contratos esc
    LEFT JOIN covid19_v2.extracao_siasg_aditivos  esa
        ON esc.ADITIVOS_CHAVE = esa.ADITIVOS_CHAVE
),
join_aditivos_unique AS (
    SELECT ja. *
    FROM join_aditivos ja
    JOIN
        (
            SELECT
                COD_COMPRA,
                max(NOTA_EMPENHO) as max_nota_empenho
            FROM join_aditivos
            GROUP BY COD_COMPRA
        ) mne
        ON ja.COD_COMPRA = mne.COD_COMPRA
        AND ja.NOTA_EMPENHO = mne.max_nota_empenho
)
--INSERT INTO Stg_Siasg.covid19_v2.resultado
--(COD_COMPRA,
-- COD_ITEM,
-- NUM_ITEM,
-- QUANTIDADE,
-- TIPO,
-- CATMAT_CATSER,
-- ITEM_DESCRICAO,
-- UNIDADE,
-- PRECO_UNITARIO,
-- VALOR_TOTAL,
-- CNPJ,
-- RAZAO_SOCIAL,
-- [DATA],
-- SISG,
-- COD_UASG,
-- UASG,
-- ORGAO,
-- PODER,
-- ESFERA,
-- UF,
-- MUNICIPIO,
-- MODALIDADE,
-- FORMATO,
-- SRP,
-- NUM_COMPRA,
-- ANO_COMPRA,
-- PROCESSO,
-- OBJETO,
-- LEI_NOME,
-- LINK_COMPRA,
-- PROCESSO_CONTRATO,
-- IT_CO_CONTRATO,
-- IT_NU_CONTRATO,
-- IT_VA_TOTAL,
-- IT_DA_ASSINATURA,
-- IT_DA_INICIO_VIGENCIA,
-- IT_DA_TERMINO_VIGENCIA,
-- NOTA_EMPENHO,
-- LINK_EMPENHO,
-- LINK_CONTRATO,
-- ADITIVOS,
-- STATUS_ITEM)
SELECT
    jc.COD_COMPRA,
    jc.COD_ITEM,
    NUM_ITEM,
    QUANTIDADE,
    TIPO,
    CATMAT_CATSER,
    ITEM_DESCRICAO,
    UNIDADE,
    PRECO_UNITARIO,
    PRECO_TOTAL as VALOR_TOTAL,
    jc.CNPJ,
    RAZAO_SOCIAL,
    [DATA],
    SISG,
    COD_UASG,
    UASG,
    ORGAO,
    PODER,
    ESFERA,
    UF,
    MUNICIPIO,
    MODALIDADE,
    FORMATO,
    SRP,
    NUM_COMPRA,
    ANO_COMPRA,
    PROCESSO,
    OBJETO,
    LEI_NOME,
    LINK_COMPRA,
    PROCESSO_CONTRATO,
    IT_CO_CONTRATO,
    IT_NU_CONTRATO,
    IT_VA_TOTAL,
    IT_DA_ASSINATURA,
    IT_DA_INICIO_VIGENCIA,
    IT_DA_TERMINO_VIGENCIA,
    NOTA_EMPENHO,
    LINK_EMPENHO,
    LINK_CONTRATO,
    ADITIVOS,
    STATUS_ITEM
FROM join_compras jc
LEFT JOIN join_aditivos_unique jau
    ON jc.COD_COMPRA = jau.COD_COMPRA
    AND jc.CNPJ = jau.CNPJ;
    