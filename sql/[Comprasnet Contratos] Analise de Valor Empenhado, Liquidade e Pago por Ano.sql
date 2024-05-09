SELECT
--	e.id id_empenho,
	LPAD(u.codigo,6,0)||LPAD(u.gestao,5,0)||LPAD(e.numero,14,0) AS id_empenho,
	e.ano_emissao ano_empenho,
--	e.numero empenho,
	CASE
		WHEN nd.codigo IN ('339037', '339039', '339040', '339139', '339014') THEN 'Serviço'
		ELSE 'Material' END tipo_item,
	nd.codigo nd_codigo,
	nd.descricao nd_descricao,
	empenhado,liquidado,pago,rppago
--	CAST(c.valor_inicial AS FLOAT) AS valor_inicial,
--	'http://www.portaltransparencia.gov.br/despesas/empenho/'||LPAD(c.codigo, 6, 0)||LPAD(c.gestao, 5, 0)||e.numero||'?ordenarPor=data&direcao=desc' AS LINK_EMPENHO,
--	'https://contratos.comprasnet.gov.br/transparencia/contratos/'||c.id_1 AS LINK_CONTRATO
FROM
	ComprasnetContrato_vbl.empenhos e
	JOIN ComprasnetContrato_vbl.unidades u ON u.id = e.unidade_id
	JOIN ComprasnetContrato_vbl.naturezadespesa nd ON nd.id = e.naturezadespesa_id
--	JOIN ComprasnetContrato_vbl.codigoitens codmod ON codmod.id = c.modalidade_id 
--	JOIN ComprasnetContrato_vbl.codigoitens codtip ON codtip.id = c.tipo_id
--	JOIN ComprasnetContrato_vbl.fornecedores f ON f.id = c.fornecedor_id
--	JOIN ComprasnetContrato_vbl.contratoempenhos ce ON ce.contrato_id = c.id_1
--	JOIN ComprasnetContrato_vbl.contratos c ON ce.empenho_id = e.id
WHERE e.ano_emissao IN ('2022') -- AND c.sisg = TRUE
;

SELECT DISTINCT
--	LPAD(u.codigo,6,0)||LPAD(u.gestao,5,0)||LPAD(e.numero,14,0) AS id_empenho,
	e.ano_emissao ano,
	nd.codigo nd_codigo,
	nd.descricao nd_descricao,
	SUM(empenhado) empenhado,
	SUM(liquidado) liquidado,
	SUM(pago) pago,
	SUM(rppago) rppago
FROM
	ComprasnetContrato_vbl.empenhos e
	JOIN ComprasnetContrato_vbl.unidades u ON u.id = e.unidade_id
	JOIN ComprasnetContrato_vbl.naturezadespesa nd ON nd.id = e.naturezadespesa_id
WHERE 1=1
	AND e.ano_emissao IN ('2022') -- AND u.sisg = TRUE
	AND e.data_emissao BETWEEN '2022-01-01' AND '2022-02-00'
	AND e.sistema_origem IN ('COMPRASNET CONTRATOS') --, 'SIAFI - SISTEMA INTEGRADO DE ADMINISTRACAO FINANCEIRA')
--	AND u.codigo='130024'
	AND nd.codigo NOT IN ('339014' , '339018', '339020', '339030', '339031', '339032', '339033', '449014', '449020', '449030', '449033')
GROUP BY nd.codigo, nd.descricao, e.ano_emissao --, u.codigo, u.gestao, e.numero
ORDER BY nd.codigo
;