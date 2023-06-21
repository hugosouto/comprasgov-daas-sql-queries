SELECT DISTINCT a.tipo_item||a.codigo_item_catalogo codigo, UPPER(a.descricao_item) descricao
FROM Pesquisa_de_Precos_vbl.item_catalogo a
	JOIN (
		SELECT b.tipo_item||b.codigo_item_catalogo codigo, COUNT(DISTINCT UPPER(b.descricao_item)) contagem
		FROM Pesquisa_de_Precos_vbl.item_catalogo b
		GROUP BY b.tipo_item||b.codigo_item_catalogo
		HAVING COUNT(DISTINCT UPPER(b.descricao_item)) > 1
		) c ON c.codigo = a.tipo_item||a.codigo_item_catalogo
ORDER BY codigo;