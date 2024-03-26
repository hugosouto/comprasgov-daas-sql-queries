SELECT
--	  isn_siads_ext_patrim
	  it_nu_patrimonial
	, it_da_tombamento
	, it_co_orgao				-- Verificar 
	, it_co_ug
	, it_co_gestao				-- Relevante como informação, mas talvez não como filtro
	, CASE it_co_gestao WHEN 1 THEN 'Administração Direta' ELSE 'Outros' END in_adm_direta
	, it_va_liq_bem				-- Valor líquido atual
	, it_co_conta_contabil		-- Cruzar com dados de Plano de Contas
	, it_co_tipo_bem
	, it_no_tipo_bem
	, it_co_situacao
	, it_no_situacao
	, it_co_destinacao				-- Utilizar como filtro de extração dos dados / Fazer agrupamento
	, it_no_destinacao				-- Utilizar como filtro de extração dos dados / Fazer agrupamento
	, it_co_item_material		-- Código do catálogo SIADS
	, it_no_material
--	, it_in_status 				-- Identificar o significado dos STATUS
--	, it_co_cpf_usuario
--	, it_da_movimento
--	, it_ho_movimento
--	, it_co_netname
--	, it_nu_patrimonial_ant 	-- Código de sistemas legados
--	, it_no_marca
--	, it_no_modelo
--	, it_nu_serie
--	, it_no_fabricante
--	, it_nu_processo
--	, it_co_terceiros
--	, it_va_inicial_bem			-- Valor de compra?
--	, it_va_bem					-- Valor de compra?
--	, it_va_bem_depre			-- Valor atual da depreciação
--	, it_va_doacao_venda		
--	, it_co_uorg				-- Detalhamento excessivo
--	, it_tp_plaqueta
--	, it_no_plaqueta
--	, it_no_aquisicao
--	, it_ed_endereco
--	, it_no_garantidor
--	, it_nu_contrato_garan_comp
--	, it_da_inicio_garantia
--	, it_da_fim_garantia
--	, it_da_previsao_devolucao
--	, it_nu_cpf_responsavel
--	, it_no_responsavel
--	, it_qt_vida_util
--	, it_no_terceiros
--	, it_co_resp_uorg
--	, it_no_resp_uorg
--	, it_tx_descricao_complementar
--	, it_da_atualizacao
FROM siads_ger_pt_me.siads_ext_patrim x
WHERE 1=1
	AND it_co_tipo_bem != 3 -- NOT IN ('PROVISORIO')
	AND it_co_destinacao NOT IN (6, 12, 13, 15, 23, 39)
	AND it_da_tombamento > 20240000
	AND it_in_status = 'A'
;

-------------------- TESTES --------------------

SELECT DISTINCT it_co_destinacao, it_no_destinacao, COUNT(it_nu_patrimonial), COUNT(DISTINCT it_nu_patrimonial)
FROM siads_ger_pt_me.siads_ext_patrim
GROUP BY it_co_destinacao, it_no_destinacao
;

SELECT * --DISTINCT it_in_status, COUNT(it_in_status)
FROM siads_ger_pt_me.siads_ext_patrim
WHERE it_in_status = 'I';
--GROUP BY it_in_status;
--AND it_da_tombamento BETWEEN 20180000 AND 20190000
;

SELECT DISTINCT it_co_tipo_bem, it_no_tipo_bem, COUNT(it_nu_patrimonial)
FROM siads_ger_pt_me.siads_ext_patrim
GROUP BY it_co_tipo_bem, it_no_tipo_bem
;

SELECT DISTINCT it_in_status,it_co_orgao,it_no_mnemonico,it_co_orgao_vinc,it_no_orgao,it_nu_cgc_cpf_orgao,it_in_administracao,it_in_utilizacao,it_in_poder,it_co_municipio_orgao
FROM siads_ger_pt_me.siorg_orgao
;

SELECT DISTINCT COUNT(it_co_ug)
FROM siads_ger_pt_me.siorg_unidade_gestora
--WHERE it_co_uasg != 0
GROUP BY it_co_ug
--ORDER BY it_co_ug
;

SELECT DISTINCT B.it_no_destinacao
FROM siads_ger_pt_me.siads_ext_orgao_ug A
RIGHT JOIN (SELECT DISTINCT * FROM siads_ger_pt_me.siads_ext_patrim) B ON A.it_co_ug = B.it_co_ug
WHERE A.it_co_ug IS NULL
;

SELECT DISTINCT it_co_ug, 
FROM siads_ger_pt_me.siads_ext_patrim
--GROUP BY it_co_ug
;