SELECT *
FROM Comprasnet_faseinterna_VBL.item_secao i
	JOIN Comprasnet_faseinterna_VBL.secao_artefato s ON i.id_secao_artefato = s.id_secao_artefato
	JOIN Comprasnet_faseinterna_VBL.artefato e ON s.id_artefato = e.id_artefato
ORDER BY e.id_artefato DESC, s.id_secao_artefato, i.nr_ordem ASC