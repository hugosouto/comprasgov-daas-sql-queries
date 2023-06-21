SELECT
	LPAD(c.codigo,6,0)||LPAD(codmod.descres,2,0)||LPAD(SUBSTRING(c.licitacao_numero, 1, 5),5,0)||LPAD(SUBSTRING(c.licitacao_numero, 7, 4),4,0) AS COD_COMPRA,
	REPLACE(REPLACE(REPLACE(c.processo, '/', ''), '.', ''), '-', '') AS PROCESSO_CONTRATO,
	CAST(codtip.descricao AS STRING) AS IT_CO_CONTRATO,
	CAST(c.licitacao_numero AS STRING) IT_NU_CONTRATO,
	REPLACE(REPLACE(REPLACE(f.cpf_cnpj_idgener, '/', ''), '.', ''), '-', '') AS CNPJ,
	CAST(c.valor_inicial AS FLOAT) AS IT_VA_TOTAL,
	SUBSTRING(c.data_assinatura, 9, 2)||'/'||SUBSTRING(c.data_assinatura, 3, 2)||'/'||SUBSTRING(c.data_assinatura, 1, 4) AS IT_DA_ASSINATURA,
	SUBSTRING(c.vigencia_inicio, 9, 2)||'/'||SUBSTRING(c.vigencia_inicio, 3, 2)||'/'||SUBSTRING(c.vigencia_inicio, 1, 4) AS IT_DA_INICIO_VIGENCIA,
	SUBSTRING(c.vigencia_fim, 9, 2)||'/'||SUBSTRING(c.vigencia_fim, 3, 2)||'/'||SUBSTRING(c.vigencia_fim, 1, 4) AS IT_DA_TERMINO_VIGENCIA,
	'http://www.portaltransparencia.gov.br/despesas/empenho/'||LPAD(c.codigo, 6, 0)||LPAD(c.gestao, 5, 0)||e.numero||'?ordenarPor=data&direcao=desc' AS LINK_EMPENHO,
	'https://contratos.comprasnet.gov.br/transparencia/contratos/'||c.id_1 AS LINK_CONTRATO,
	'' AS ADITIVOS_CHAVE,
	(SELECT COUNT(DISTINCT h.id)
		FROM ComprasnetContrato_vbl.contratohistorico h
		WHERE c.id_1 = h.contrato_id AND h.tipo_id = 65
		GROUP BY c.id_1) AS ADITIVOS
FROM
	ComprasnetContrato_vbl.contratos c
	JOIN ComprasnetContrato_vbl.codigoitens codmod ON codmod.id = c.modalidade_id 
	JOIN ComprasnetContrato_vbl.codigoitens codtip ON codtip.id = c.tipo_id
	JOIN ComprasnetContrato_vbl.fornecedores f ON f.id = c.fornecedor_id
	JOIN ComprasnetContrato_vbl.contratoempenhos ce ON ce.contrato_id = c.id_1
	JOIN ComprasnetContrato_vbl.empenhos e ON ce.empenho_id = e.id;