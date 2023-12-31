SELECT
	UPPER(c.SP_MODALIDADE_AVISO_LICITACAO) AS COD_COMPRA,
	UPPER(c.SP_MODALIDADE_AVISO_ITEM) AS COD_ITEM,
	UPPER(c.IT_NU_ITEM_MATERIAL) AS NUM_ITEM,
	CAST(IFNULL(c.IT_QT_MATERIAL_SERVICO, IT_QT_MATERIAL_ALT) AS INTEGER) AS QUANTIDADE,
	CASE WHEN c.IT_CO_SERVICO IS NOT NULL THEN 'Servi�o' ELSE 'Material' END AS TIPO,
	CASE WHEN c.IT_CO_SERVICO IS NOT NULL THEN c.IT_CO_SERVICO ELSE IT_CO_CONJUNTO_MATERIAIS END AS CATMAT_CATSER,
	UPPER(c.IT_TX_DESCRICAO_MATERIAL) AS ITEM_DESCRICAO,
	UPPER(c.IT_NO_UNIDADE_MEDIDA) AS UNIDADE,
	c.IT_VA_PRECO_UNITARIO_ITEM AS PRECO_UNITARIO,
	c.IT_VA_ESTIMADO AS PRECO_TOTAL,
	UPPER(c.IT_NU_CGC_CPF_VENCEDOR) AS FORNECEDOR_CNPJ_CPF, 
	UPPER(c.IT_NO_RAZAO_SOCIAL_VENCEDOR) AS FORNECEDOR_RAZAO_SOCIAL,
	CAST(IFNULL(SUBSTRING(c.IT_DA_RESULTADO_ITEM,1,4)||'-'||SUBSTRING(c.IT_DA_RESULTADO_ITEM,5,2)||'-'||SUBSTRING(c.IT_DA_RESULTADO_ITEM,7,2), SUBSTRING(c.IT_DA_TRANSACAO,1,4)||'-'||SUBSTRING(c.IT_DA_TRANSACAO,5,2)||'-'||SUBSTRING(c.IT_DA_TRANSACAO,7,2)) AS DATE) AS DATA
FROM
	Siasg_VBL.SIDEC_RESULTADO_COMPRA AS c
WHERE
   (SUBSTRING(c.SP_MODALIDADE_AVISO_LICITACAO,14,4) = '2020' OR
	SUBSTRING(c.SP_MODALIDADE_AVISO_LICITACAO,14,4) = '2019') AND
	c.IT_CO_MODALIDADE_LICITACAO IN ('05', '06', '07') AND
	c.IT_NO_RAZAO_SOCIAL_VENCEDOR IS NOT NULL AND
	c.IT_DA_TRANSACAO BETWEEN '20200000' AND '20210000'
ORDER BY c.SP_MODALIDADE_AVISO_LICITACAO ASC;

SELECT
	COUNT(DISTINCT c.SP_MODALIDADE_AVISO_LICITACAO)
FROM
	Siasg_VBL.SIDEC_RESULTADO_COMPRA AS c
WHERE
	c.IT_DA_TRANSACAO BETWEEN '20200000' AND '20210000'