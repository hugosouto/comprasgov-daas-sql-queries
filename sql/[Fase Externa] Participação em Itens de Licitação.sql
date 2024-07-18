SELECT
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
	, CASE pdi.desclassificada
		WHEN 'S' THEN 'Sim'
		WHEN 'N' THEN 'Não'
		ELSE pdi.desclassificada END desclassificada
	, l.identificacao_usuario
	, l.ip_origem
	, l.valor_informado
	, l.valor_calculado
	, l.data_hora_inclusao
	, CASE l.origem
		WHEN 'L' THEN 'Lance'
		WHEN 'P' THEN 'Proposta Inicial'
		WHEN 'M' THEN 'Desempate ME/EPP'
		WHEN '7' THEN 'Desempate 7174'
		ELSE l.origem END AS origem
	, CASE l.origem_sessao_usuario
		WHEN 'W' THEN 'Web'
		WHEN 'A' THEN 'App'
		ELSE l.origem_sessao_usuario END origem_sessao_usuario
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