SELECT
	LPAD(c.IT_CO_UNIDADE_GESTORA,6,0)||LPAD(c.IT_CO_MODALIDADE_LICITACAO,2,0)||LPAD(c.IT_NU_AVISO_LICITACAO,9,0) AS COD_COMPRA,
	UPPER(c.IT_NU_PROCESSO) AS PROCESSO_CONTRATO,
	CASE WHEN c.IT_CO_MODALIDADE_TERMO = '55' THEN 'Aditivo'
		 WHEN c.IT_CO_CONTRATO = '50' THEN 'Contrato'
		 WHEN c.IT_CO_CONTRATO = '51' THEN 'Credenciamento' 
		 WHEN c.IT_CO_CONTRATO = '52' THEN 'Comodato'
		 WHEN c.IT_CO_CONTRATO = '53' THEN 'Arrendamento'
		 WHEN c.IT_CO_CONTRATO = '54' THEN 'Concess�o'
		 ELSE c.IT_CO_CONTRATO END AS IT_CO_CONTRATO,
	CAST(SUBSTRING(LPAD(c.IT_NU_CONTRATO,9,0),1,5) AS INTEGER)||'/'||SUBSTRING(c.IT_NU_CONTRATO,-4,4) AS IT_NU_CONTRATO,
	UPPER(c.IT_NU_CGC_CPF_CONTRATADO) AS CNPJ,
	c.IT_VA_TOTAL,
	SUBSTRING(c.IT_DA_ASSINATURA,1,4)||'-'||SUBSTRING(c.IT_DA_ASSINATURA,5,2)||'-'||SUBSTRING(c.IT_DA_ASSINATURA,7,2) AS IT_DA_ASSINATURA,
	SUBSTRING(c.IT_DA_INICIO_VIGENCIA,1,4)||'-'||SUBSTRING(c.IT_DA_INICIO_VIGENCIA,5,2)||'-'||SUBSTRING(c.IT_DA_INICIO_VIGENCIA,7,2) AS IT_DA_INICIO_VIGENCIA,
	SUBSTRING(c.IT_DA_TERMINO_VIGENCIA,1,4)||'-'||SUBSTRING(c.IT_DA_TERMINO_VIGENCIA,5,2)||'-'||SUBSTRING(c.IT_DA_TERMINO_VIGENCIA,7,2) AS IT_DA_TERMINO_VIGENCIA,
	LPAD(e.IT_CO_UG_CONTRATO, 6, 0)||LPAD(e.IT_CO_GESTAO_CONTRATO, 5, 0)||e.IT_NU_EMPENHO_CONTRATO AS NOTA_EMPENHO,
	'http://www.portaltransparencia.gov.br/despesas/empenho/'||LPAD(e.IT_CO_UG_CONTRATO,6,0)||LPAD(e.IT_CO_GESTAO_CONTRATO,5,0)||e.IT_NU_EMPENHO_CONTRATO||'?ordenarPor=data&direcao=desc' AS LINK_EMPENHO,
	'http://compras.dados.gov.br/contratos/doc/contrato/'||LPAD(e.IT_CO_UG_CONTRATO,6,0)||LPAD(c.IT_CO_CONTRATO,2,0)||LPAD(c.IT_NU_CONTRATO,9,0) AS LINK_CONTRATO,
	c.IT_CO_UNIDADE_GESTORA||c.IT_CO_CONTRATO||c.IT_NU_CONTRATO AS ADITIVOS_CHAVE
FROM
	Siasg_oracle_VBL.SIDEC_CONTRATO AS c
	LEFT JOIN Siasg_oracle_VBL.SIDEC_CONTRATO_GR_EMPENHO AS e
		   ON e.ISN_SIDEC_CONTRATO = c.ISN_SIDEC_CONTRATO
WHERE 
	c.IT_DA_ASSINATURA > '20200000'
	AND c.IT_CO_MODALIDADE_TERMO IS NULL;