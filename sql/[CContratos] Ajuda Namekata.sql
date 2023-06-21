--	1. Empenhos gerados Comprasnet Contratos sem a respectiva minuta no Comprasnet Contratos.
--		Gera Empenho pelo Comprasnet Contratos.
--		(CASO   158293 Empenho 3) (ver banco do comprasnet contratos)
--		Buscar 'Sistema de Origem' = Comprasnet Contratos, tem Empenho mas não tem a Minuta do Empenho
--		Eliminar os 'Em Processamento'
--
--	2. Empenho SIAFI diferente do Comprasnet Contratos

SELECT u.codigo||u.gestao||me.mensagem_siafi
FROM ComprasnetContrato_vbl.minutaempenhos me
	LEFT JOIN ComprasnetContrato_vbl.saldo_contabil sc  ON me.saldo_contabil_id = sc.id
	LEFT JOIN ComprasnetContrato_vbl.unidades u 		ON sc.unidade_id = u.id
WHERE me.situacao_id = '217' AND me.mensagem_siafi IS NOT NULL AND me.data_emissao < '2021-08-03'
ORDER BY u.codigo||u.gestao||me.mensagem_siafi
;

SELECT DISTINCT e.id --, e.numero, me.informacao_complementar, e.unidade_id, e.fornecedor_id, e.empenhado, e.created_at, e.updated_at
FROM ComprasnetContrato_vbl.empenhos e
	JOIN ComprasnetContrato_vbl.minutaempenhos me ON e.numero = me.mensagem_siafi
WHERE me.situacao_id != '215'
;

