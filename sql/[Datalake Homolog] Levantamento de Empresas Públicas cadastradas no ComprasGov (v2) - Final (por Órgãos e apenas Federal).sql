SELECT
	CASE IT_IN_STATUS
		WHEN '' THEN 'Ativa'
		WHEN '*' THEN 'Inativa'
	END AS "Status da Unidade",
	CASE IT_IN_STATUS_ORGAO
		WHEN '' THEN 'Ativa'
		WHEN '*' THEN 'Inativa'
	END AS "Status do Órgão",
	IT_CO_ORGAO AS "Código do Órgão",
	IT_NO_ORGAO AS "Nome do Órgão",
	IT_NO_MNEMONICO AS "Sigla do Órgão",
	CASE 
		WHEN IT_CO_ORGAO = 45282 THEN '33657248000189' -- BNDES: input de dado nulo
		WHEN IT_CO_ORGAO = 25301 THEN '04527335000113' -- EMGEA: input de dado nulo
		WHEN IT_NU_CGC_CPF_ORGAO = '0' THEN NULL
		ELSE RIGHT(REPLICATE('0', 14) + RTRIM(IT_NU_CGC_CPF_ORGAO), 14)
	END AS "CNPJ do Órgão",
	IT_CO_ORGAO_VINCULADO AS "Código do Órgão Vinculado",
	IT_NO_ORGAO_VINCULADO AS "Nome do Órgão Vinculado",
--	IT_CO_ORGAO_SUPERIOR AS "Código do Órgão Superior",
--	IT_NO_ORGAO_SUPERIOR AS "Nome do Órgão Superior",
	CASE CAST(IT_IN_TIPO_ADMINISTRACAO AS VARCHAR)
		WHEN '1' THEN 'Administração Direta'
		WHEN '2' THEN 'Estatal'
		WHEN '3' THEN 'Autarquia'
		WHEN '4' THEN 'Fundação'
		WHEN '5' THEN 'Empresa Pública Com. e Fin.'
		WHEN '6' THEN 'Economia Mista'
		WHEN '7' THEN 'Fundos'
		WHEN '8' THEN 'Empresa Pública Ind. E agric.'
		WHEN '11' THEN 'Administração Direta Estadual'
		WHEN '12' THEN 'Administração Direta Municipal'
		WHEN '13' THEN 'Administração Indireta Estadual'
		WHEN '14' THEN 'Administração Indireta Municipal'
		WHEN '15' THEN 'Empresa Privada'
		WHEN '' THEN NULL
		ELSE CAST(IT_IN_TIPO_ADMINISTRACAO AS VARCHAR)
	END AS "Tipo de Administração",
	CASE CAST(IT_IN_TIPO_PODER AS VARCHAR)
		WHEN '0' THEN 'Executivo'
		WHEN '1' THEN 'Legislativo'
		WHEN '2' THEN 'Judiciário'
		WHEN '' THEN NULL
		ELSE CAST(IT_IN_TIPO_PODER AS VARCHAR)
	END AS "Poder",
	CASE
		WHEN IT_CO_ORGAO = 45282 THEN 'Federal' -- BNDES: input de dado nulo
		WHEN IT_CO_ORGAO = 25220 THEN 'Federal' -- CEF: input de dado nulo
		WHEN IT_CO_ORGAO = 20502 THEN 'Federal' -- FINEP: input de dado nulo
		WHEN IT_IN_ESFERA = 'M' THEN 'Municipal'
		WHEN IT_IN_ESFERA = 'E' THEN 'Estadual'
		WHEN IT_IN_ESFERA = 'F' THEN 'Federal'
		WHEN IT_IN_ESFERA = '' THEN NULL
		ELSE IT_IN_ESFERA
	END AS "Esfera"
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos
WHERE 1=1
	AND IT_IN_TIPO_ADMINISTRACAO IN (5, 8)
	AND IT_IN_STATUS = ''
	AND IT_IN_STATUS_ORGAO = ''
	AND IT_IN_ESFERA NOT IN ('E', 'M')
	AND IT_CO_UNIDADE_POLO = '0'
--	AND IT_IN_ESFERA = ''
	AND IT_CO_ORGAO NOT IN (20605, 29203) -- Removidos por não ser federal ou não mais existir: CODEBAR, GEIPOT-LIQUIDACAO
GROUP BY IT_CO_ORGAO, IT_IN_STATUS, IT_IN_STATUS_ORGAO, IT_CO_ORGAO, IT_NO_ORGAO, IT_NO_MNEMONICO, IT_NU_CGC_CPF_ORGAO, IT_CO_ORGAO_VINCULADO, IT_NO_ORGAO_VINCULADO, IT_IN_TIPO_ADMINISTRACAO, IT_IN_TIPO_PODER, IT_IN_ESFERA -- , IT_CO_ORGAO_SUPERIOR, IT_NO_ORGAO_SUPERIOR 
ORDER BY IT_NO_ORGAO
;