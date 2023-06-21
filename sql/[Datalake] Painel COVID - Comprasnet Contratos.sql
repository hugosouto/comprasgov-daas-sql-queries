SELECT
	c.unidade_codigo +
	CASE WHEN c.tipo = 'Contrato' 				THEN '50'
		 WHEN c.tipo = 'Credenciamento'			THEN '51'
		 WHEN c.tipo = 'Comodato'				THEN '52'
		 WHEN c.tipo = 'Arrendamento'			THEN '53'
		 WHEN c.tipo = 'Concessão'				THEN '54'
		 WHEN c.tipo = 'Termo Aditivo'			THEN '55'
		 WHEN c.tipo = 'Termo de Adesão'		THEN '56'
		 WHEN c.tipo = 'Convênio'				THEN '57'
	 	 WHEN c.tipo = 'Termo de Apostilamento'	THEN '60'
		 WHEN c.tipo = 'Empenho'				THEN '99'
		 WHEN c.tipo = 'Outros'					THEN '98'
		 WHEN c.tipo = 'Termo de Execução Descentralizada (TED)'	THEN '97'
		 WHEN c.tipo = 'Acordo de Cooperação Técnica (ACT)' 		THEN '96'
		 WHEN c.tipo = 'Termo de Compromisso' 						THEN '95'
		 WHEN c.tipo = 'Termo de Rescisão' 							THEN '20'
	 	 ELSE '00'													END +
	SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4)	 				COD_COMPRA,
	c.processo																PROCESSO_CONTRATO,
	c.tipo																	IT_CO_CONTRATO,
	CAST(CAST(SUBSTRING(c.numero, 1, 5) AS INTEGER) AS VARCHAR)+ RIGHT(c.numero, 5)	AS IT_NU_CONTRATO,
	CASE 
		WHEN c.fornecedor_tipo = 'JURIDICA' 	--JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.tipo') = 'JURIDICA' 
 		THEN
	 		LEFT(c.fonecedor_cnpj_cpf_idgener, 2) + 
	 		SUBSTRING(c.fonecedor_cnpj_cpf_idgener, 4, 3) + 
	 		SUBSTRING(c.fonecedor_cnpj_cpf_idgener, 8, 3) + 
	 		SUBSTRING(c.fonecedor_cnpj_cpf_idgener, 12, 4) + 
	 		RIGHT(c.fonecedor_cnpj_cpf_idgener, 2) 	
--	 		LEFT(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 2) + 
--	 		SUBSTRING(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 4, 3) + 
--	 		SUBSTRING(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 8, 3) + 
--	 		SUBSTRING(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 12, 4) + 
--	 		RIGHT(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 2) 	
	 	WHEN c.fornecedor_tipo = 'FISICA' 		--JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '0'),'$.tipo') = 'FISICA' 
		THEN
	 		LEFT(c.fonecedor_cnpj_cpf_idgener, 3) + 
	 		SUBSTRING(c.fonecedor_cnpj_cpf_idgener, 5, 3) + 
	 		SUBSTRING(c.fonecedor_cnpj_cpf_idgener, 9, 3) + 
	 		RIGHT(c.fonecedor_cnpj_cpf_idgener, 2) 	
--			LEFT(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 3) + 
--	 		SUBSTRING(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 5, 3) + 
--	 		SUBSTRING(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 9, 3) +  
--	 		RIGHT(JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener'), 2)
	END CNPJ,
	c.valor_inicial																IT_VA_TOTAL,
	c.data_assinatura															IT_DA_ASSINATURA,
	c.vigencia_inicio															IT_DA_INICIO_VIGENCIA,
	c.vigencia_fim																IT_DA_TERMINO_VIGENCIA,
	e.unidade_gestora + e.gestao + e.numero										NOTA_EMPENHO,	
	'http://www.portaltransparencia.gov.br/despesas/empenho/' + RIGHT(REPLICATE('0', 6) + c.unidade_codigo, 6) + RIGHT(REPLICATE('0', 5) + e.gestao, 5) + e.numero + '?ordenarPor=data&direcao=desc' AS LINK_EMPENHO,
	'https://contratos.comprasnet.gov.br/transparencia/contratos/' + CONVERT(VARCHAR, c.id) AS LINK_CONTRATO,
	c.unidade_codigo + 
	CASE WHEN c.tipo = 'Contrato' 				THEN '50'
		 WHEN c.tipo = 'Credenciamento'			THEN '51'
		 WHEN c.tipo = 'Comodato'				THEN '52'
		 WHEN c.tipo = 'Arrendamento'			THEN '53'
		 WHEN c.tipo = 'Concessão'				THEN '54'
		 WHEN c.tipo = 'Termo Aditivo'			THEN '55'
		 WHEN c.tipo = 'Termo de Adesão'		THEN '56'
		 WHEN c.tipo = 'Convênio'				THEN '57'
	 	 WHEN c.tipo = 'Termo de Apostilamento'	THEN '60'
		 WHEN c.tipo = 'Empenho'				THEN '99'
		 WHEN c.tipo = 'Outros'					THEN '98'
		 WHEN c.tipo = 'Termo de Execução Descentralizada (TED)'	THEN '97'
		 WHEN c.tipo = 'Acordo de Cooperação Técnica (ACT)' 		THEN '96'
		 WHEN c.tipo = 'Termo de Compromisso' 						THEN '95'
		 WHEN c.tipo = 'Termo de Rescisão' 							THEN '20'
	 	 ELSE '00'													END +
	CAST(CAST(SUBSTRING(c.numero, 1, 5) AS INTEGER) AS VARCHAR) + RIGHT(c.numero, 4) AS ADITIVOS_CHAVE
FROM DEV_2_COMPRAS_CONTRATOS.contratos c
	JOIN COMPRAS_CONTRATOS.empenhos e ON c.id = e.contrato_id
--WHERE REPLACE(c.vigencia_inicio, '-', '') > '2020%'
;