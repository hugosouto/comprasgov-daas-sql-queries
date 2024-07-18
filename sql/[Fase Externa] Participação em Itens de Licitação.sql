SELECT
--	  pdi.id AS id_participacao_disputa_item
	  pdi.numero_uasg
	, CASE pdi.codigo_modalidade 
		WHEN 5 THEN 'Pregão'
		WHEN 3 THEN 'Concorrência'
		WHEN 5 THEN 'Pregão'
		WHEN 6 THEN 'Dispensa'
		WHEN 20 THEN 'Concurso'
		ELSE pdi.codigo_modalidade END modalidade 
	, pdi.numero_compra
	, pdi.ano_compra
	, pdi.numero_item
--	, pdi.tipo_item
--	, pdi.tipo_participante
--	, pdi.identificacao_participante
--	, pdi.tp_declarante
--	, pdi.ppb_declarante
--	, pdi.me_epp_declarante
--	, pdi.id_disputa_item
--	, pdi.id_participacao_disputa_grupo
--	, pdi.rodada_fechada_modo_af
--	, pdi.situacao_rodada_fechada_modo_af
--	, pdi.ordem_participacao_desempate
--	, pdi.rodada_desempate_com_participacao
--	, pdi.situacao_rodada_desempate_beneficio
--	, pdi.data_hora_inicio_desempate
--	, pdi.data_hora_fim_desempate
--	, pdi.proposta_inicial_valor_informado
--	, pdi.proposta_inicial_valor_calculado
--	, pdi.fator_equalizacao_icms
--	, pdi.melhor_valor_informado
--	, pdi.melhor_valor_calculado
--	, pdi.data_hora_melhor_lance
--	, pdi.origem_melhor_valor
--	, pdi.data_hora_alteracao
--	, pdi.versao
--	, pdi.quantidade_ofertada_subitem_srp
--	, pdi.ordem_sorteio_eletronico
--	, pdi.desclassificada
	, CASE pdi.desclassificada
		WHEN 'S' THEN 'Sim'
		WHEN 'N' THEN 'Não'
		ELSE pdi.desclassificada END desclassificada
--	, pdi.justificativa_desclassificacao
--	, pdi.id_melhor_lance
--	, pdi.situacao
--	, pdi.sequencial
--	, pdi.apelido_item
--	, pdi.id_compra_participante
--	, pdi.diferenciador
--	, pdi.rodada_disputa_final_desempate_valor
--	, pdi.situacao_rodada_disputa_final_desempate_valor
--	, pdi.situacao_solicitacao_desistencia
--	, pdi.motivo_solicitacao_desistencia
--	, pdi.data_hora_solicitacao_desistencia
--	, pdi.qtde_lances_excluidos
--	, pdi.proposta_trabalho_mre
--	, pdi.situacao_rodada_aberta_modo_fa
--	, l.id AS id_lance
	, l.identificacao_usuario
	, l.ip_origem
	, l.valor_informado
	, l.valor_calculado
	, l.data_hora_inclusao
--	, l.id_participacao_disputa_item
--	, l.data_hora_exclusao
--	, l.origem
	, CASE l.origem
		WHEN 'L' THEN 'Lance'
		WHEN 'P' THEN 'Proposta Inicial'
		WHEN 'M' THEN 'Desempate ME/EPP'
		WHEN '7' THEN 'Desempate 7174'
		ELSE l.origem END AS origem
--	, l.id_rodada_disputa_item
--	, l.melhor_lance_atual
--	, l.valor_batido_informado
--	, l.valor_batido_calculado
--	, l.origem_sessao_usuario
	, CASE l.origem_sessao_usuario
		WHEN 'W' THEN 'Web'
		WHEN 'A' THEN 'App'
		ELSE l.origem_sessao_usuario END origem_sessao_usuario
--	, l.ip_origem_exclusao
--	, l.identificacao_usuario_exclusao
--	, cp.tipo
	, CASE cp.tipo
		WHEN 'J' THEN 'Pessoa Jurídica'
		WHEN 'F' THEN 'Pessoa Física'
		WHEN 'E' THEN 'Pessoa Estrangeiro'
		ELSE cp.tipo END AS tipo
	, cp.identificacao
	, cp.nome
FROM ComprasGov_SalaDisputa_VBL.lance l
JOIN ComprasGov_SalaDisputa_VBL.participacao_disputa_item pdi ON pdi.id = l.id_participacao_disputa_item
JOIN ComprasGov_SalaDisputa_VBL.compra_participante cp ON cp.id = pdi.id_compra_participante
WHERE
	1 = 1
	AND pdi.numero_uasg IN (120039)
	AND pdi.codigo_modalidade IN (5)
	AND pdi.ano_compra IN (2023)
	AND pdi.numero_compra IN (23, 85, 90, 93)
;