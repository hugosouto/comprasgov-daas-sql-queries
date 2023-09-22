SELECT
	CASE IT_IN_STATUS
		WHEN '' THEN 'Ativa'
		WHEN '*' THEN 'Inativa'
	END AS "Status da Unidade",
	IT_CO_UNIDADE_GESTORA AS "Código da Unidade",
	IT_NO_UNIDADE_GESTORA AS "Nome da Unidade",
--	RIGHT(REPLICATE('0', 6) + RTRIM(IT_CO_UNIDADE_GESTORA), 6) AS "Código da UASG (Preenchido)",
	CASE IT_NU_CGC_CPF
		WHEN '0' THEN NULL
		ELSE RIGHT(REPLICATE('0', 14) + RTRIM(IT_NU_CGC_CPF), 14)
	END AS "CNPJ da Unidade",
	CASE IT_IN_USO_SISG_UASG
		WHEN 'S' THEN 'Sim'
		WHEN 'N' THEN 'Não'
	END AS "Indicador SISG",
	CASE IT_IN_ADESAO_SIASG
		WHEN 'S' THEN 'Sim'
		WHEN 'N' THEN 'Não'
	END AS "Indicador Adesão SIASG",
--	CASE IT_DA_IMPLANTACAO_SIDEC
--		WHEN '0' THEN NULL
--		ELSE IT_DA_IMPLANTACAO_SIDEC
--	END AS "Data da Implantação SIDEC",
	IT_SG_UF AS "UF da Unidade",
--	SG_UF,
	CASE IT_CO_MUNICIPIO
		WHEN '0' THEN NULL
		ELSE IT_CO_MUNICIPIO
	END AS "Código do Município da Unidade",
	NOME_MUN_SIASG AS "Nome do Município da Unidade",
	NOME_MUN_IBGE AS "Nome do Município da Unidade(IBGE)",
--	CASE IT_CO_UNIDADE_POLO
--		WHEN '0' THEN NULL
--		ELSE IT_CO_UNIDADE_POLO
--	END AS "Código da Unidade Polo",
--	IT_NO_UNIDADE_GESTORA_POLO AS "Nome da Unidade Polo",
--	CASE IT_CO_UNIDADE_ESPELHO
--		WHEN '0' THEN NULL
--		ELSE IT_CO_UNIDADE_ESPELHO
--	END AS "Código da Unidade Espelo",
--	IT_NO_UNIDADE_GESTORA_ESPELHO AS "Nome da Unidade Espelo",
--	CASE IT_IN_UASG_CADASTRADORA
--		WHEN 'S' THEN 'Sim'
--		WHEN 'N' THEN 'Não'
--	END AS "Indicador de Unidade Cadastradora",
	CASE IT_IN_STATUS_ORGAO
		WHEN '' THEN 'Ativa'
		WHEN '*' THEN 'Inativa'
	END AS "Status do Órgão",
	IT_CO_ORGAO AS "Código do Órgão",
	IT_NO_ORGAO AS "Nome do Órgão",
	IT_NO_MNEMONICO AS "Sigla do Órgão",
	CASE IT_NU_CGC_CPF_ORGAO
		WHEN '0' THEN NULL
		ELSE IT_NU_CGC_CPF_ORGAO
	END AS "CNPJ do Órgão",
	IT_CO_ORGAO_VINCULADO AS "Código do Órgão Vinculado",
	IT_NO_ORGAO_VINCULADO AS "Nome do Órgão Vinculado",
	iT_CO_ORGAO_SUPERIOR AS "Código do Órgão Superior",
	IT_NO_ORGAO_SUPERIOR AS "Nome do Órgão Superior",
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
	CASE IT_IN_ESFERA
		WHEN 'M' THEN 'Municipal'
		WHEN 'E' THEN 'Estadual'
		WHEN 'F' THEN 'Federal'
		WHEN '' THEN NULL
		ELSE IT_IN_ESFERA
	END AS "Esfera",
	IT_DA_MOVIMENTO AS "Data de Movimento"
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos
WHERE 1=1
	AND IT_IN_TIPO_ADMINISTRACAO IN (5, 8)
	AND IT_IN_STATUS = ''
	AND IT_IN_STATUS_ORGAO = ''; 