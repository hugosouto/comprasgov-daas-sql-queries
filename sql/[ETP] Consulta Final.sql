SELECT 
	a.id_artefato 					AS id,
	SUBSTRING(i.conteudo, 1,200)	AS texto,
	i.valor 						AS valor_total_estimado,
	a.id_uasg						AS uasg,
	CASE WHEN a.in_categoria = '1' THEN 'Bens'
		 WHEN a.in_categoria = '2' THEN 'Servi�os'
		 WHEN a.in_categoria = '3' THEN 'Contrata��es de TIC'
		 WHEN a.in_categoria = '4' THEN 'Obras e servi�os especiais de engenharia'
		 WHEN a.in_categoria = '5' THEN 'Loca��o de Im�veis'
		 WHEN a.in_categoria = '6' THEN 'Aliena��o / Concess�o / Permiss�o' 
	 	 ELSE a.in_categoria END 	AS categoria,
	a.in_categoria					AS id_categoria,
	CAST(CASE WHEN COUNT(DISTINCT r.cpf) > 1 THEN STRING_AGG(DISTINCT r.cpf, ',')
		 ELSE MAX(r.cpf) 
		 END AS STRING) 			AS equipe_cpf,
	'etp'							AS tipo_trilha
FROM Comprasnet_faseinterna_VBL.item_secao i
	JOIN Comprasnet_faseinterna_VBL.secao_artefato s ON i.id_item_secao = s.id_secao_artefato
	JOIN Comprasnet_faseinterna_VBL.artefato a ON a.id_artefato = s.id_artefato
	JOIN Comprasnet_faseinterna_VBL.responsavel_artefato r ON r.id_artefato = a.id_artefato 
WHERE (i.conteudo IS NOT NULL AND i.conteudo != '')
--	AND a.nr_ano = 2021
	AND a.id_artefato > 110000
GROUP BY a.id_artefato, i.valor, a.id_uasg, a.in_categoria, i.conteudo
ORDER BY a.id_artefato DESC;