SELECT 
	a.id_artefato 					AS id,
	STRING_AGG(i.conteudo, ' | ') 	AS texto,
	i.valor 						AS valor_total_estimado,
	a.id_uasg						AS uasg,
	CASE WHEN a.in_categoria = '1' THEN 'Bens'
		 WHEN a.in_categoria = '2' THEN 'Serviços'
		 WHEN a.in_categoria = '3' THEN 'Contratações de TIC'
		 WHEN a.in_categoria = '4' THEN 'Obras e serviços especiais de engenharia'
		 WHEN a.in_categoria = '5' THEN 'Locação de Imóveis'
		 WHEN a.in_categoria = '6' THEN 'Alienação / Concessão / Permissão' 
	 	 ELSE a.in_categoria END 	AS categoria,
	a.in_categoria					AS id_categoria,
	STRING_AGG(r.cpf, ',') 		AS equipe,
	'etp'							AS tipo_trilha
FROM ComprasnetETP_VBL.item_secao i
	JOIN ComprasnetETP_VBL.secao_artefato s ON i.id_item_secao = s.id_secao_artefato
	JOIN ComprasnetETP_VBL.artefato a ON a.id_artefato = s.id_artefato
	JOIN ComprasnetETP_VBL.responsavel_artefato r ON r.id_artefato = a.id_artefato 
WHERE i.conteudo IS NOT NULL AND i.conteudo != '' AND a.in_estado IN (3, 5) AND (i.conteudo LIKE '%(UST)%' OR i.conteudo LIKE '% UST %')
GROUP BY a.id_artefato, i.valor, a.id_uasg, a.in_categoria
ORDER BY a.id_artefato DESC