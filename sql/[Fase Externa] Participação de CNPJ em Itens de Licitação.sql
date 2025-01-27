SELECT 
	p.identificacao_participante	"CNPJ",
	p.nome_participante 			"Razão Social",
	pi.data_hora_inclusao 			"Data da Proposta",
	c.numero_uasg 					"UASG",
	'' 								"Nome da UASG",
	'' 								"Órgão",
	'' 								"Município",
	'' 								"UF",
	'Pregão' 						"Modalidade",
	c.numero_compra||c.ano_compra 	"Numero da Licitação",
	ti.numero_item 					"Item da Licitação",
	ti.descricao 					"Descrição do Item",
	pi.valor_proposta_calculado 	"Valor da Proposta",
	ti.valor_estimado 				"Valor Estimado do Item",
	c.data_hora_inclusao 			"Data da Inclusão da Licitação",
	c.data_hora_abertura_sp 		"Data da Abertura da Licitação",
	CASE WHEN pi.situacao = 6 THEN 'Adjudicado'
		ELSE 'Não Adjudicado' END 	"Indicador de Adjudicação"
FROM ComprasGov_FaseExterna_VBL.proposta_item AS pi
INNER JOIN ComprasGov_FaseExterna_VBL.item AS ti ON pi.id_item = ti.id 
INNER JOIN ComprasGov_FaseExterna_VBL.participacao AS p ON p.id = pi.id_participacao
INNER JOIN ComprasGov_FaseExterna_VBL.compra as c ON c.id = p.id_compra 
WHERE 1=1
	AND p.identificacao_participante = '26427482000154'
	AND pi.data_hora_inclusao > '2023-08-27 00:00:00' 
	AND c.codigo_modalidade = 5
	AND ti.numero_item > 0
;