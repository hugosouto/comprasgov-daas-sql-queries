-- Query Completa

SELECT
	CASE WHEN ID_UNDD_IN_SISG = '-7' THEN 'Inv�lido'
		 WHEN ID_UNDD_IN_SISG = '-8' THEN 'N�o Informado'
		 WHEN ID_UNDD_IN_SISG = '-9' THEN 'N�o se Aplica'
		 WHEN ID_UNDD_IN_SISG = '1' THEN 'Unidade SISG'
		 WHEN ID_UNDD_IN_SISG = '2' THEN 'N�o � Unidade SISG'
		 END AS SISG,
	ID_UNDD_UNIDADE AS UASG,
	NO_UNDD_UNIDADE AS UASG_NOME,
	ID_LCAL_UF_UNIDADE,
	ID_LCAL_REGIAO_UNIDADE,
	ID_UNDD_ORGAO,
	ID_UNDD_ORGAO_SUP,
	ID_UNDD_ORGAO_VINC,
	ID_UNDD_ESFERA AS ESFERA,
	ID_UNDD_PODER,
	ID_UNDD_SIT_ATUAL_UNIDADE,
	ID_UNDD_TP_ADM,
	ID_UNDD_IN_ADESAO_SIASG
FROM Siasg_DW_VBL.D_UNDD_UNIDADE;

-- Query Simplificada

SELECT DISTINCT 
	CASE WHEN u.ID_UNDD_IN_SISG = '-7' THEN 'Inv�lido'
		 WHEN u.ID_UNDD_IN_SISG = '-8' THEN 'N�o Informado'
		 WHEN u.ID_UNDD_IN_SISG = '-9' THEN 'N�o se Aplica'
		 WHEN u.ID_UNDD_IN_SISG = '1' THEN 'Unidade SISG'
		 WHEN u.ID_UNDD_IN_SISG = '2' THEN 'N�o � Unidade SISG'
		 END AS SISG,
	u.ID_UNDD_UNIDADE 	AS UASG_COD,
	u.NO_UNDD_UNIDADE 	AS UASG_NOM,
	u.ID_UNDD_ORGAO 	AS ORGAO_COD,
	o.DS_UNDD_ORGAO 	AS ORGAO_NOM,
	u.ID_UNDD_ORGAO_SUP 	AS ORGAO_SUP_COD,
	s.DS_UNDD_ORGAO_SUP 	AS ORGAO_SUP_NOM
FROM Siasg_DW_VBL.D_UNDD_UNIDADE 		AS u
	JOIN Siasg_DW_VBL.D_UNDD_ORGAO 		AS o ON u.ID_UNDD_ORGAO = o.ID_UNDD_ORGAO
	JOIN Siasg_DW_VBL.D_UNDD_ORGAO_SUP 	AS s ON u.ID_UNDD_ORGAO_SUP = s.ID_UNDD_ORGAO_SUP
WHERE ID_UNDD_SIT_ATUAL_UNIDADE = 1 --AND (ID_UNDD_IN_SISG = 1 OR ID_UNDD_IN_SISG = 2 OR ID_UNDD_IN_SISG = -8)
ORDER BY SISG DESC;