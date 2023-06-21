----- Classifica itens de catálogo mais usados
SELECT codigo_item_catalogo, descricao_item, COUNT(id_item_catalogo) count_codigo_item_catalogo 
FROM Pesquisa_de_Precos_vbl.item_catalogo
GROUP BY codigo_item_catalogo, descricao_item
ORDER BY COUNT(id_item_catalogo) DESC

----- Analisa unidade de fornecimento, unidade de medida e capacidade
SELECT codigo_item_catalogo, descricao_item, nome_unidade_fornecimento, nome_unidade_medida, capacidade_unidade_fornecimento, COUNT(id_item_catalogo) count_codigo_item_catalogo 
FROM Pesquisa_de_Precos_vbl.item_catalogo
WHERE codigo_item_catalogo IN (445485)
GROUP BY codigo_item_catalogo, descricao_item, nome_unidade_fornecimento, nome_unidade_medida, capacidade_unidade_fornecimento
ORDER BY COUNT(id_item_catalogo) DESC

----- Obtém combinação de item, unidade de fornecimento, unidade de medida e capacidade
SELECT
	ica.codigo_item_catalogo,
	ica.descricao_item,
	ica.sigla_unidade_fornecimento,
	ica.sigla_unidade_medida,
	ica.capacidade_unidade_fornecimento,
	ico.quantidade,
	ico.preco_unitario
FROM
	Pesquisa_de_Precos_vbl.item_catalogo ica
	JOIN Pesquisa_de_Precos_vbl.item_compra ico ON ica.codigo_item_catalogo = ico.codigo_item_catalogo 
WHERE
	ica.codigo_item_catalogo IN (445485) AND ica.sigla_unidade_medida IN ('L') AND ica.capacidade_unidade_fornecimento = 20
GROUP BY
	ica.codigo_item_catalogo,
	ica.descricao_item,
	ica.sigla_unidade_fornecimento,
	ica.nome_unidade_fornecimento,
	ica.sigla_unidade_medida,
	ica.nome_unidade_medida,
	ica.capacidade_unidade_fornecimento,
	ico.quantidade,
	ico.sigla_unidade_medida, 
	ico.preco_unitario
ORDER BY
	preco_unitario DESC
;
----- Normaliza unidades de fornecimento, unidade de medida e capacidade conhecidas
SELECT
	codigo_item_catalogo,
	descricao_item,
	sigla_unidade_fornecimento,
	nome_unidade_fornecimento,
	sigla_unidade_medida,
	nome_unidade_medida,
	capacidade_unidade_fornecimento,
	CASE sigla_unidade_medida
		WHEN 'ML' THEN capacidade_unidade_fornecimento * 0.001
		ELSE capacidade_unidade_fornecimento
	END capacidade_unidade_fornecimento_ajustada,
	COUNT(id_item_catalogo) count_codigo_item_catalogo
FROM
	Pesquisa_de_Precos_vbl.item_catalogo
WHERE
	codigo_item_catalogo IN (445485)
GROUP BY
	codigo_item_catalogo,
	descricao_item,
	sigla_unidade_fornecimento,
	nome_unidade_fornecimento,
	sigla_unidade_medida,
	nome_unidade_medida,
	capacidade_unidade_fornecimento
ORDER BY
	COUNT(id_item_catalogo) DESC
	
----- Junta itens normalizados com item da compra
SELECT
--	ica.id_item_catalogo,
	ica.codigo_item_catalogo,
	ica.descricao_item,
	ica.sigla_unidade_fornecimento,
	ica.sigla_unidade_medida,
	ica.capacidade_unidade_fornecimento,
	CASE ica.sigla_unidade_medida
		WHEN 'ML' THEN ica.capacidade_unidade_fornecimento * 0.001
		ELSE ica.capacidade_unidade_fornecimento
	END capacidade_unidade_fornecimento_ajustada,
	ico.quantidade,
	ico.preco_unitario,
	CASE ica.sigla_unidade_medida
		WHEN 'L' THEN ico.preco_unitario
		WHEN 'ML' THEN ico.preco_unitario * 0.001
	END preco_unitario_ajustado
--	preco_unitario
--	COUNT(DISTINCT ico.id_item_compra)
FROM
	Pesquisa_de_Precos_vbl.item_catalogo ica
	JOIN Pesquisa_de_Precos_vbl.item_compra ico ON ica.codigo_item_catalogo = ico.codigo_item_catalogo 
WHERE
	ica.codigo_item_catalogo IN (445485)
GROUP BY
--	ica.id_item_catalogo,
	ica.codigo_item_catalogo,
	ica.descricao_item,
	ica.sigla_unidade_fornecimento,
	ica.nome_unidade_fornecimento,
	ica.sigla_unidade_medida,
	ica.nome_unidade_medida,
	ica.capacidade_unidade_fornecimento,
	ico.quantidade,
	ico.sigla_unidade_medida, 
	ico.preco_unitario
ORDER BY
	ico.quantidade DESC