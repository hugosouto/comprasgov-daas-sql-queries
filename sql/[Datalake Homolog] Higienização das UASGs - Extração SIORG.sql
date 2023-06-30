-- Extração SIORG

SELECT
	IT_IN_STATUS_ORGAO AS 'Situação do Órgão',
	IT_CO_ORGAO AS 'Código do Órgão',
	IT_NO_ORGAO AS 'Nome do Órgão',
	IT_NO_MNEMONICO AS 'Sigla do Órgão',
	IT_NU_CGC_CPF_ORGAO AS 'CNPJ do Órgão',
	IT_CO_ORGAO_VINCULADO AS 'Código do Órgão Vinculado',
	IT_NO_ORGAO_VINCULADO AS 'Nome do Órgão Vinculado',
	IT_CO_ORGAO_SUPERIOR AS 'Código do Órgão Superior',
	IT_NO_ORGAO_SUPERIOR AS 'Nome do Órgão Superior',
	IT_IN_TIPO_ADMINISTRACAO AS 'Tipo Administração',
	IT_IN_TIPO_PODER AS 'Tipo Poder',
	IT_IN_ESFERA AS 'Esfera',
	IT_IN_STATUS AS 'Situação da UASG',
	IT_NU_CGC_CPF AS 'CNPJ da UASG',
	IT_CO_UNIDADE_GESTORA AS 'Código da UASG',
	IT_NO_UNIDADE_GESTORA AS 'Nome da UASG',
	IT_IN_USO_SISG_UASG AS 'Uso SISG (S / N)',
	IT_IN_ADESAO_SIASG AS 'Adesão ao SIASG (S / N)',
	--IT_DA_MOVIMENTO,
	--IT_DA_IMPLANTACAO_SIDEC,
	IT_SG_UF AS 'UF da UASG',
	IT_CO_MUNICIPIO AS 'Código do Município',
	NOME_MUN_SIASG AS 'Nome do Município',
	SG_UF AS 'UF do Município',
	--NOME_MUN_IBGE,
	--IT_CO_UNIDADE_POLO,
	--IT_NO_UNIDADE_GESTORA_POLO,
	--IT_CO_UNIDADE_ESPELHO,
	--IT_NO_UNIDADE_GESTORA_ESPELHO,
	IT_IN_UASG_CADASTRADORA AS 'UASG Cadastradora (S / N)'
FROM seges_delog_cgscg_stage.dbo.siasg_uasgs_orgaos
WHERE IT_CO_ORGAO IN (22000, 49000, 58000, 55000, 51000, 56000, 53000, 46000, 25000, 28000, 20113, 65000, 81000, 68000, 39000, 33000, 38000, 54000, 42000, 43000, 23000, 84000, 44000, 57000, 29000, 40000)

--Informações do Órgão:																			
	--Código do Órgão	
	--Nome do Órgão	
	--Sigla do Órgão	
	--CNPJ do Órgão	
	--Código do Órgão Vinculado	
	--Nome do Órgão Vinculado	
	--Tipo Administração	
	--Esfera	

--Informações da UASG:

	--Código da UASG
	--Situação da UASG	
	--Nome da UASG	
	----Sigla da UASG	-- Não consta
	--Uso SISG (S / N)	
	--Adesão ao SIASG (S / N)	
	--UF da UASG	
	--Código do Município	
	----CEP do Município	-- Não consta
	--Nome do Município	
	--UF do Município
	----Uso SIAFI (S / N) -- Não consta