SELECT
	ss.codigo_secao,
	ss.nome_secao,
	ds.codigo_divisao,
	ds.nome_divisao,
	gs.codigo_grupo,
	gs.nome_grupo,
	cs.codigo_classe,
	cs.nome_classe,
	s.codigo_servico,
	s.nome_servico,
	s.tipo_servico,
	s.codigo_agrupamento_servico,
	ag.nome_agrupamento_servico
FROM catalogo.servico s
LEFT JOIN catalogo.agrupamento_servico ag ON ag.codigo_agrupamento_servico = s.codigo_agrupamento_servico
LEFT JOIN catalogo.servico_cpc sc ON sc.codigo_servico = s.codigo_servico
LEFT JOIN catalogo.classe_servico cs ON cs.codigo_classe = sc.codigo_classe  
LEFT JOIN catalogo.grupo_servico gs ON gs.codigo_grupo = sc.codigo_grupo 
LEFT JOIN catalogo.divisao_servico ds ON ds.codigo_divisao = gs.codigo_divisao 
LEFT JOIN catalogo.secao_servico ss ON ss.codigo_secao = ds.codigo_secao;