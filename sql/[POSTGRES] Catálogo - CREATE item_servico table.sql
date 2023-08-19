-- Original
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
JOIN catalogo.agrupamento_servico ag ON ag.codigo_agrupamento_servico = s.codigo_agrupamento_servico
JOIN catalogo.servico_cpc sc ON sc.codigo_servico = s.codigo_servico
LEFT JOIN catalogo.subclasse_servico sb ON sb.codigo_classe = sc.codigo_subclasse
LEFT JOIN catalogo.classe_servico cs ON cs.codigo_classe = sc.codigo_classe  
LEFT JOIN catalogo.grupo_servico gs ON gs.codigo_grupo = sc.codigo_grupo 
LEFT JOIN catalogo.divisao_servico ds ON ds.codigo_divisao = gs.codigo_divisao 
LEFT JOIN catalogo.secao_servico ss ON ss.codigo_secao = ds.codigo_secao;

-- Condicional
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
JOIN catalogo.agrupamento_servico ag ON ag.codigo_agrupamento_servico = s.codigo_agrupamento_servico
JOIN catalogo.servico_cpc sc ON CASE s.codigo_cpc > 1000 THEN s.codigo_cpc = sc.codigo_grupo  = s.codigo_servico
--LEFT JOIN catalogo.subclasse_servico sb ON sb.codigo_classe = sc.codigo_subclasse
--LEFT JOIN catalogo.classe_servico cs ON cs.codigo_classe = sc.codigo_classe  
--LEFT JOIN catalogo.grupo_servico gs ON gs.codigo_grupo = sc.codigo_grupo 
--LEFT JOIN catalogo.divisao_servico ds ON ds.codigo_divisao = gs.codigo_divisao 
--LEFT JOIN catalogo.secao_servico ss ON ss.codigo_secao = ds.codigo_secao;

-- Reduzida
SELECT
	ss.codigo_secao,
	ss.nome_secao,
	ds.codigo_divisao,
	ds.nome_divisao,
	gs.codigo_grupo,
	gs.nome_grupo,
	s.codigo_servico,
	s.nome_servico,
	s.tipo_servico,
	s.codigo_agrupamento_servico,
	ag.nome_agrupamento_servico
FROM catalogo.servico s
JOIN catalogo.agrupamento_servico ag ON ag.codigo_agrupamento_servico = s.codigo_agrupamento_servico
JOIN catalogo.servico_cpc sc ON sc.codigo_servico = s.codigo_servico
	--JOIN (
	--	SELECT
	--		 CASE WHEN codigo_grupo IS NULL THEN (CASE WHEN codigo_classe IS NOT NULL THEN codigo_classe WHEN codigo_subclasse IS NOT NULL THEN codigo_subclasse END) ELSE codigo_grupo END novo_codigo_grupo
	--		,CASE WHEN codigo_classe IS NULL THEN codigo_grupo END novo_codigo_classe
	--		,CASE WHEN codigo_subclasse IS NULL THEN codigo_grupo END novo_codigo_subclasse
	--	FROM catalogo.servico_cpc
	--	END
	--	) novo_codigo_grupo ng ON CASE WHEN ng.novo_codigo_grupo < 1000 THEN ng.novo_codigo_grupo =   
--LEFT JOIN catalogo.subclasse_servico sb ON sb.codigo_classe = sc.codigo_subclasse
--LEFT JOIN catalogo.classe_servico cs ON cs.codigo_classe = sc.codigo_classe  
--LEFT JOIN catalogo.grupo_servico gs ON gs.codigo_grupo = sc.codigo_grupo 
--LEFT JOIN catalogo.divisao_servico ds ON ds.codigo_divisao = gs.codigo_divisao 
--LEFT JOIN catalogo.secao_servico ss ON ss.codigo_secao = ds.codigo_secao;
;

-- Tabela Temporária
SELECT
	 codigo_servico
	,CASE WHEN codigo_grupo IS NULL THEN (CASE WHEN codigo_classe IS NOT NULL THEN codigo_classe ELSE codigo_subclasse END) ELSE codigo_grupo END novo_codigo_grupo
	,CASE WHEN codigo_classe IS NULL THEN (CASE WHEN codigo_grupo IS NOT NULL THEN codigo_grupo ELSE codigo_subclasse END) ELSE codigo_classe END novo_codigo_classe
	,CASE WHEN codigo_subclasse IS NULL THEN (CASE WHEN codigo_classe IS NOT NULL THEN codigo_classe ELSE codigo_grupo END) ELSE codigo_subclasse END novo_codigo_subclasse	 	
FROM catalogo.servico_cpc
;

-- Final
WITH novo_servico_cpc AS (
	SELECT
		 codigo_servico
		,CASE WHEN sc.codigo_grupo IS NULL THEN (CASE WHEN sc.codigo_classe IS NOT NULL THEN gs2.codigo_grupo ELSE gs3.codigo_grupo END) ELSE sc.codigo_grupo END novo_codigo_grupo
		,CASE WHEN sc.codigo_classe IS NULL THEN (CASE WHEN sc.codigo_grupo IS NOT NULL THEN sc.codigo_grupo ELSE ss.codigo_classe END) ELSE sc.codigo_classe END novo_codigo_classe
--		(SELECT codigo_classe FROM catalogo.servico_cpc JOIN catalogo.subclasse_servico ss ON ss.codigo_subclasse = s.codigo_subclasse)
		,CASE WHEN sc.codigo_subclasse IS NULL THEN (CASE WHEN sc.codigo_classe IS NOT NULL THEN sc.codigo_classe ELSE sc.codigo_grupo END) ELSE sc.codigo_subclasse END novo_codigo_subclasse	 	
	FROM catalogo.servico_cpc sc
	LEFT JOIN catalogo.subclasse_servico ss ON ss.codigo_subclasse = sc.codigo_subclasse
	LEFT JOIN catalogo.classe_servico cs ON cs.codigo_classe = sc.codigo_classe
	LEFT JOIN catalogo.classe_servico cs2 ON cs2.codigo_classe = ss.codigo_classe -- Quando só subclasse está preenchido na tabela servico_cpc 
	LEFT JOIN catalogo.grupo_servico gs ON gs.codigo_grupo = sc.codigo_grupo
	LEFT JOIN catalogo.grupo_servico gs2 ON gs2.codigo_grupo = cs.codigo_grupo -- Quando só classe está preenchido na tabela servico_cpc
	LEFT JOIN catalogo.grupo_servico gs3 ON gs3.codigo_grupo = cs2.codigo_grupo -- Quando só subclasse está preenchido na tabela servico_cpc
)
SELECT
	ss.codigo_secao,
	ss.nome_secao,
	ds.codigo_divisao,
	ds.nome_divisao,
	gs.codigo_grupo,
	gs.nome_grupo,
	s.codigo_servico,
	s.nome_servico,
	s.tipo_servico,
	s.codigo_agrupamento_servico,
	ag.nome_agrupamento_servico
FROM catalogo.servico s
JOIN catalogo.agrupamento_servico ag ON ag.codigo_agrupamento_servico = s.codigo_agrupamento_servico
JOIN novo_servico_cpc sc ON sc.codigo_servico = s.codigo_servico
JOIN catalogo.grupo_servico gs ON gs.codigo_grupo = sc.novo_codigo_grupo 
JOIN catalogo.divisao_servico ds ON ds.codigo_divisao = gs.codigo_divisao 
JOIN catalogo.secao_servico ss ON ss.codigo_secao = ds.codigo_secao
ORDER BY ss.codigo_secao, ds.codigo_divisao, gs.codigo_grupo, s.codigo_servico
;