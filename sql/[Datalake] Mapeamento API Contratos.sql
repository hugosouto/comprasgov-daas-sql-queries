---------------------------------------------------------------------------- contratos
SELECT
	c.codigo_unidade + 															-- RIGHT(REPLICATE('0', 6) + JSON_VALUE(REPLACE(REPLACE(contratos.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.codigo'), 6) +
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
		SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4)	 				id_contrato,
	''																			id_licitacao,
	RIGHT(REPLICATE('0', 5) + JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.codigo'), 5) as co_orgao,
	RIGHT(REPLICATE('0', 6) + JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.codigo'), 6) as co_uasg,
	JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.nome') as no_uasg,
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
		 WHEN c.tipo = 'Outros '				THEN '98'
		 WHEN c.tipo = 'Termo de Execução Descentralizada (TED)'	THEN '97'
		 WHEN c.tipo = 'Acordo de Cooperação Técnica (ACT)' 		THEN '96'
		 WHEN c.tipo = 'Termo de Compromisso' 						THEN '95'
		 WHEN c.tipo = 'Termo de Rescisão' 							THEN '20'
	 	 ELSE '00'													END			co_contrato,
	UPPER(c.tipo)																no_tipo_contrato,
	SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4)						nu_contrato,
	''																			co_uasg_licitacao,
	CASE WHEN c.modalidade = 'Convite'											THEN '1'
		 WHEN c.modalidade = 'Tomada de Preços'									THEN '2'
		 WHEN c.modalidade = 'Concorrência' 									THEN '3'
		 WHEN c.modalidade = 'Concorrência Internacional'						THEN '4'
		 WHEN c.modalidade = 'Pregão' 											THEN '5'
		 WHEN c.modalidade = 'Dispensa'											THEN '6'
		 WHEN c.modalidade = 'Inexigibilidade'									THEN '7'
		 WHEN c.modalidade = 'Concurso'											THEN '20'
		 WHEN c.modalidade = 'Tomada de Preços por Técnica e Preço'				THEN '22'
		 WHEN c.modalidade = 'Concorrência por Técnica e Preço'					THEN '33'
		 WHEN c.modalidade = 'Concorrência Internacional por Técnica e Preço'	THEN '44'
	 	 WHEN c.modalidade = 'Regime Diferenciado de Contratações'				THEN '99' END 			co_modalidade_licitacao,
	UPPER(c.modalidade)																					no_modalidade_licitacao,
	SUBSTRING(c.licitacao_numero, 1, 5) + SUBSTRING(c.licitacao_numero, 7, 4)							nu_aviso_licitacao,
	c.processo																							nu_processo,
	JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '0'),'$.tipo')							tp_pessoa,
	CASE WHEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.tipo') = 'JURIDICA' 
		 THEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.cnpj_cpf_idgener')	END nu_cnpj_contratada,
	CASE WHEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.tipo') = 'JURIDICA' 
		 THEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '""'),'$.nome')				END no_contratada_pj,
	''																									id_contratada,
		CASE WHEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '0'),'$.tipo') = 'FISICA' 
		 THEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '0'),'$.cnpj_cpf_idgener')	END nu_cpf_contratada,
	CASE WHEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '0'),'$.tipo') = 'FISICA' 
		 THEN JSON_VALUE(REPLACE(REPLACE(c.fornecedor, '''','"'), 'None', '0'),'$.nome')				END no_contratada_pf,
	''																			nu_cnpj_contratante,
	''																			no_contratante_pj,
	''																			nu_cpf_contratante,
	''																			no_contratante_pf,
	''																			id_contratante,
	c.objeto																	tx_objeto_contrato,
	''																			tx_fundamento_legal,
	c.valor_inicial																vr_inicial,
	c.data_assinatura															dt_assinatura,
	c.vigencia_inicio															dt_inicio_vigencia,
	c.vigencia_fim																dt_termino_vigencia,
	''																			co_uasg_subrogada,
	''																			no_uasg_subrogada,
	(SELECT COUNT(h2.numero)												
		FROM COMPRAS_CONTRATOS.contratos c2
			LEFT JOIN COMPRAS_CONTRATOS.historico h2 ON c2.id = h2.contrato_id
		WHERE h2.tipo in ('Termo Aditivo')
		AND c2.id = c.id)														nu_aditivo,
	CASE WHEN JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.sisg') = 'Sim' THEN 'true'
		 WHEN JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.sisg') = 'Não' THEN 'false' END contrato_sisg,
	''																			sg_origem_licitacao
FROM COMPRAS_CONTRATOS.contratos c
--WHERE c.codigo_unidade BETWEEN 130000 AND 140000
;
---------------------------------------------------------------------------- empenhos
SELECT
	e.unidade_gestora																					co_uasg,
	JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.nome')	no_uasg,
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
		 WHEN c.tipo = 'Outros '				THEN '98'
		 WHEN c.tipo = 'Termo de Execução Descentralizada (TED)'	THEN '97'
		 WHEN c.tipo = 'Acordo de Cooperação Técnica (ACT)' 		THEN '96'
		 WHEN c.tipo = 'Termo de Compromisso' 						THEN '95'
		 WHEN c.tipo = 'Termo de Rescisão' 							THEN '20'
	 	 ELSE '00'													END			co_contrato,
	UPPER(c.tipo)																no_tipo_contrato,
	SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4)						nu_contrato,
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
	 	 ELSE '00'													END 		co_modalidade_termo,
	'' 																			no_tipo_modalidade_termo,
	''																			nu_termo,
	c.codigo_unidade															co_ug_contrato,
	e.gestao 																	co_gestao_contrato,
	'' 																			co_fonte_recurso,
	LEFT(e.naturezadespesa, 6)						 							co_natureza_despesa,
	'' 																			co_programa_trabalho,
	e.numero																	nu_empenho_contrato
FROM COMPRAS_CONTRATOS.empenhos e
	JOIN COMPRAS_CONTRATOS.contratos c ON c.id = e.contrato_id
	JOIN COMPRAS_CONTRATOS.historico h ON c.id = h.contrato_id
--WHERE c.codigo_unidade BETWEEN 130000 AND 140000
;
---------------------------------------------------------------------------- aditivos
SELECT
	c.codigo_unidade +
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
		SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4) +
	CASE WHEN h.tipo = 'Contrato' 				THEN '50'
		 WHEN h.tipo = 'Credenciamento'			THEN '51'
		 WHEN h.tipo = 'Comodato'				THEN '52'
		 WHEN h.tipo = 'Arrendamento'			THEN '53'
		 WHEN h.tipo = 'Concessão'				THEN '54'
		 WHEN h.tipo = 'Termo Aditivo'			THEN '55'
		 WHEN h.tipo = 'Termo de Adesão'		THEN '56'
		 WHEN h.tipo = 'Convênio'				THEN '57'
	 	 WHEN h.tipo = 'Termo de Apostilamento'	THEN '60'
		 WHEN h.tipo = 'Empenho'				THEN '99'
		 WHEN h.tipo = 'Outros'					THEN '98'
		 WHEN h.tipo = 'Termo de Execução Descentralizada (TED)'	THEN '97'
		 WHEN h.tipo = 'Acordo de Cooperação Técnica (ACT)' 		THEN '96'
		 WHEN h.tipo = 'Termo de Compromisso' 						THEN '95'
		 WHEN h.tipo = 'Termo de Rescisão' 							THEN '20'
	 	 ELSE '00'													END +
		SUBSTRING(h.numero, 1, 5) + SUBSTRING(h.numero, 7, 4)	 																		id_contrato_aditivo,
	RIGHT(REPLICATE('0', 5) + JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.codigo'), 5)	 				co_orgao,
	RIGHT(REPLICATE('0', 6) + JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.codigo'), 6)	co_uasg,
	JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.nome')									no_uasg,
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
	 	 ELSE '00'													END			co_contrato,
	UPPER(c.tipo)																no_tipo_contrato,
	SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4)						nu_contrato,
	CASE WHEN h.tipo = 'Contrato' 				THEN '50'
		 WHEN h.tipo = 'Credenciamento'			THEN '51'
		 WHEN h.tipo = 'Comodato'				THEN '52'
		 WHEN h.tipo = 'Arrendamento'			THEN '53'
		 WHEN h.tipo = 'Concessão'				THEN '54'
		 WHEN h.tipo = 'Termo Aditivo'			THEN '55'
		 WHEN h.tipo = 'Termo de Adesão'		THEN '56'
		 WHEN h.tipo = 'Convênio'				THEN '57'
	 	 WHEN h.tipo = 'Termo de Apostilamento'	THEN '60'
		 WHEN h.tipo = 'Empenho'				THEN '99'
		 WHEN h.tipo = 'Outros'					THEN '98'
		 WHEN h.tipo = 'Termo de Execução Descentralizada (TED)'	THEN '97'
		 WHEN h.tipo = 'Acordo de Cooperação Técnica (ACT)' 		THEN '96'
		 WHEN h.tipo = 'Termo de Compromisso' 						THEN '95'
		 WHEN h.tipo = 'Termo de Rescisão' 							THEN '20'
	 	 ELSE '00'													END 		co_modalidade_termo,
	UPPER(h.tipo) 																no_tipo_modalidade_termo,
	SUBSTRING(h.numero, 1, 5) + SUBSTRING(h.numero, 7, 4)						nu_termo,
	c.processo																	nu_processo,
	h.observacao																tx_objeto_aditivo,
	'' 																			tx_fundamento_legal_aditivo,
	h.data_assinatura															dt_assinatura_aditivo,
	h.vigencia_inicio															dt_inicio_vigencia_aditivo,
	h.vigencia_fim																dt_termino_vigencia_aditivo,
	h.data_publicacao															dt_publicacao_aditivo,
	h.valor_global																vr_total,
	'' 																			co_uasg_subrogacao,
	'' 																			no_uasg_subrogada
FROM COMPRAS_CONTRATOS.contratos c
	JOIN COMPRAS_CONTRATOS.historico h ON c.id = h.contrato_id
WHERE h.tipo IN ('Termo Aditivo')
WHERE RIGHT(REPLICATE('0', 6) + JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.codigo'), 6) = '130024'
;
---------------------------------------------------------------------------- apostilamentos
SELECT
	c.codigo_unidade +
	SUBSTRING(g.numero, 1, 5) + SUBSTRING(g.numero, 7, 4) +
	RIGHT(REPLICATE('0', 13) + SUBSTRING(h.numero, 1, 5), 13) + SUBSTRING(h.numero, 7, 4) 				id_contrato_apostilamento,
	'' 																									in_status,
	'' 																									no_status,
	RIGHT(REPLICATE('0', 6) + JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.codigo'), 6) co_uasg,
	SUBSTRING(g.numero, 1, 5) + SUBSTRING(g.numero, 7, 4) 												co_cronograma_apostilamento,
	JSON_VALUE(REPLACE(REPLACE(c.contratante, '''','"'), 'None', '0'),'$.orgao.unidade_gestora.nome') 	no_uasg,
	e.gestao nu_gestao,
		CASE WHEN c.tipo = 'Contrato' 				THEN '50'
		 WHEN c.tipo = 'Credenciamento'			THEN '51'
		 WHEN c.tipo = 'Comodato'				THEN '52'
		 WHEN c.tipo = 'Arrendamento'			THEN '53'
		 WHEN c.tipo = 'Concessão'				THEN '54'
		 WHEN c.tipo = 'Termo Aditivo'			THEN '55'
		 WHEN c.tipo = 'Termo de Adesão'		THEN '56'
		 WHEN c.tipo = 'Convênio'				THEN '57'
	 	 WHEN c.tipo = 'Termo de Apostilamento'	THEN '60' END 											co_contrato,
	UPPER(c.tipo) 																						no_tipo_contrato,
	SUBSTRING(c.numero, 1, 5) + SUBSTRING(c.numero, 7, 4)												nu_contrato,
	SUBSTRING(h.numero, 1, 5) + SUBSTRING(h.numero, 7, 4)												nu_apostilamento,
	e.numero																							nu_empenho,
	CASE WHEN c.modalidade = 'Convite'											THEN '1'
		 WHEN c.modalidade = 'Tomada de Preços'									THEN '2'
		 WHEN c.modalidade = 'Concorrência' 									THEN '3'
		 WHEN c.modalidade = 'Concorrência Internacional'						THEN '4'
		 WHEN c.modalidade = 'Pregão' 											THEN '5'
		 WHEN c.modalidade = 'Dispensa'											THEN '6'
		 WHEN c.modalidade = 'Inexigibilidade'									THEN '7'
		 WHEN c.modalidade = 'Concurso'											THEN '20'
		 WHEN c.modalidade = 'Tomada de Preços por Técnica e Preço'				THEN '22'
		 WHEN c.modalidade = 'Concorrência por Técnica e Preço'					THEN '33'
		 WHEN c.modalidade = 'Concorrência Internacional por Técnica e Preço'	THEN '44'
	 	 WHEN c.modalidade = 'Regime Diferenciado de Contratações'				THEN '99' END 			co_modalidade_licitacao,
	UPPER(c.modalidade)																					no_modalidade_licitacao,
	h.data_assinatura																					dt_apostilamento,
	h.valor_global																						vr_apostilamento,
	h.observacao																						it_tx_justificativa,
	'' 																									isn_siasg_cronograma_apostilamento
FROM COMPRAS_CONTRATOS.contratos c
	JOIN COMPRAS_CONTRATOS.empenhos e 	ON c.id = e.contrato_id
	JOIN COMPRAS_CONTRATOS.historico h 	ON c.id = h.contrato_id
	JOIN COMPRAS_CONTRATOS.cronograma g	ON c.id = g.contrato_id
WHERE h.tipo IN ('Termo de Apostilamento')
--WHERE c.codigo_unidade BETWEEN 130000 AND 140000
;
