SELECT
	pi.data_hora_inclusao data_proposta,
	pi.valor_proposta_calculado valor_da_proposta,
	ti.numero_item,
	ti.descricao descricao_item,
	p.identificacao_participante,
	p.nome_participante cnpj,
	c.numero_uasg,
	c.data_hora_inclusao data_inclusao_compra,
	c.numero_compra,
	c.ano_compra,
	c.codigo_modalidade
FROM ComprasGov_FaseExterna_VBL.proposta_item AS pi	
JOIN ComprasGov_FaseExterna_VBL.item AS ti 			ON pi.id_item = ti.id
JOIN ComprasGov_FaseExterna_VBL.participacao AS p 	ON p.id = pi.id_participacao
JOIN ComprasGov_FaseExterna_VBL.compra as c 		ON c.id = p.id_compra
WHERE 1=1
	AND p.identificacao_participante = '26427482000154'
	AND ti.numero_item > 0
	AND c.codigo_modalidade = 5
;