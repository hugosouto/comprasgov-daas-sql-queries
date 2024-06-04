SELECT
	criterio_julgamento codigo_criterio_julgamento,
	CASE criterio_julgamento
		WHEN 1 THEN 'Menor Preco'
		WHEN 2 THEN 'Maior Desconto'
		WHEN 3 THEN 'Melhor Tecnica'
		WHEN 4 THEN 'Tecnica e Preco'
		WHEN 5 THEN 'Conteudo Artistico'
		WHEN 6 THEN 'Maior Retorno Economico'
		WHEN 7 THEN 'Menor Preco ou Maior Desconto'
		WHEN 8 THEN 'Melhor Tecnica ou Conteudo Artistico'
		ELSE criterio_julgamento END criterio_julgamento,		
	COUNT(id) contagem
FROM ComprasGov_FaseExterna_VBL.item
GROUP BY criterio_julgamento;