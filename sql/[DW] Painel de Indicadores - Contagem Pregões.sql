WITH temp1 AS (
    SELECT
      a11.ID_FRND_FORNECEDOR_COMPRA  	AS ID_FRND_FORNECEDOR,
      a12.ID_CMPR_COMPRA  				AS ID_CMPR_COMPRA,
      a11.ID_ITCP_ITEM_COMPRA  			AS ID_ITCP_ITEM_COMPRA
    FROM	Siasg_DW_VBL.F_ITEM_FORNECEDOR			a11
      JOIN	Siasg_DW_VBL.D_CMPR_COMPRA				a12
        ON 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
      JOIN	Siasg_DW_VBL.D_DT_DATA					a13
        ON 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
      JOIN	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a14
        ON 	(a12.ID_CMPR_MODALIDADE_COMPRA = a14.ID_CMPR_MODALIDADE_COMPRA)
	WHERE	(a14.ID_CMPR_MODALIDADE_GRUPO in (5)
	 AND a13.ID_DT_ANO IN ('2022')
--	 AND a13.ID_DT_MES IN ('202205')
	 AND a12.ID_CMPR_TP_PREGAO in (1))
	GROUP BY	
		a13.ID_DT_MES,
		a11.ID_FRND_FORNECEDOR_COMPRA,
		a12.ID_CMPR_COMPRA,
		a11.ID_ITCP_ITEM_COMPRA
	HAVING	SUM(a11.VL_ULT_LANCE) > 0.0
)
, temp2 AS (
SELECT DISTINCT
	CAST(a14.ID_DT_MES AS STRING)		AS ID_DT_MES,
	CASE WHEN a16.ID_ITCP_IN_COMPRA_GRUPO = 0 THEN a16.CH_ITCP_ITEM_COMPRA_EDIT
		 WHEN a16.ID_ITCP_IN_COMPRA_GRUPO != 0 THEN a13.DS_CMPR_COMPRA_EDIT||'GR'||LPAD(a16.ID_ITCP_IN_COMPRA_GRUPO, 3, 0) END COD_ITEM_GRUPO,
	COUNT(DISTINCT a11.ID_FRND_FORNECEDOR) 		AS CONTA_FORNECEDOR
FROM	Siasg_DW_VBL.D_FRND_FORNECEDOR				a11
	JOIN	temp1									pa12
	  ON 	(a11.ID_FRND_FORNECEDOR = pa12.ID_FRND_FORNECEDOR)
	JOIN	Siasg_DW_VBL.D_CMPR_COMPRA				a13
	  ON 	(pa12.ID_CMPR_COMPRA = a13.ID_CMPR_COMPRA)
	JOIN	Siasg_DW_VBL.D_DT_DATA					a14
	  ON 	(a13.DT_CMPR_RESULTADO_COMPRA = a14.ID_DT_DATA)
	JOIN	Siasg_DW_VBL.D_ITCP_ITEM_COMPRA			a16
	  ON 	(pa12.ID_ITCP_ITEM_COMPRA = a16.ID_ITCP_ITEM_COMPRA)
	JOIN	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a17
	  ON 	(a13.ID_CMPR_MODALIDADE_COMPRA = a17.ID_CMPR_MODALIDADE_COMPRA)
WHERE	(a17.ID_CMPR_MODALIDADE_GRUPO in (5)
	 AND a14.ID_DT_ANO IN ('2022')
--	 AND a14.ID_DT_MES IN ('202205')
	 AND a13.ID_CMPR_TP_PREGAO in (1))
GROUP BY
	a14.ID_DT_MES,
	CASE WHEN a16.ID_ITCP_IN_COMPRA_GRUPO = 0 then a16.CH_ITCP_ITEM_COMPRA_EDIT
		 WHEN a16.ID_ITCP_IN_COMPRA_GRUPO != 0 then a13.DS_CMPR_COMPRA_EDIT||'GR'||LPAD(a16.ID_ITCP_IN_COMPRA_GRUPO, 3, 0) END
)
SELECT ID_DT_MES AS anomes, CAST(AVG(CONTA_FORNECEDOR) AS FLOAT) AS mediaparticipantespregao, COUNT(DISTINCT SUBSTRING(COD_ITEM_GRUPO, 1, 17)) AS contapregao, SUM(CONTA_FORNECEDOR) AS contapropostaspregao, NOW() AS datahoraregisto
FROM temp2
GROUP BY ID_DT_MES
ORDER BY ID_DT_MES;