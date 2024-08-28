--·       Data de cadastro da proposta
--·       Data da licitação
--·       UASG / órgão
--·       Cidade/Estado da UASG
--·       Item (descrição)
--·       Valor da proposta
--·       Se participou ou não
--·       Classificação (caso tenha) (não é obrigatório)
--·       E os campos que conseguirem incluir na pesquisa...

SELECT DISTINCT
	pp.prpCNPJ 						"CNPJ",
	pp.prpRazaoSocial 				"Razão Social",
	pp.prpData						"Data de Cadastro da Proposta",
--	''								"Data da Licitação",
--	'Pregão' 						"Modalidade",
--	''								"Órgão",
	p.coduasg						"UASG",
	p.numprp						"Numero da Licitação",
--	''								"Cidade/Estado da UASG",
	pi.ipgItem						"ItemPregao",
	pi.ipgNomeItem 					"Item (Descrição)",
	pri.ippValor					"Valor da Proposta",
	pri.prpSequencial				"Classificação",
	CASE pri.ippIndAdjudicado
		WHEN 'S' THEN 'Adjudicado'
		ELSE 'Não Adjudicado' END	"Indicador de Adjudicado",
	p.prgDataAbertura 				"DataAbertura"
--	CASE p.prgIndElet WHEN 'S' THEN 'Eletrônico' WHEN 'N' THEN 'Presencial' ELSE p.prgIndElet END Formato
FROM Comprasnet_VBL.tbl_Pregao p
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.prgCod = p.prgCod
JOIN Comprasnet_VBL.tbl_Proposta pp ON pp.prgCod = p.prgCod
JOIN Comprasnet_VBL.tbl_PropostaItem pri ON pri.prpCod = pp.prpCod
JOIN Comprasnet_VBL.tb_uasg u ON u.coduasg = p.coduasg
JOIN Comprasnet_VBL.tb_municipio m ON m.
JOIN Comprasnet_VBL.tb_orgao o ON o.
WHERE 1=1
--	AND pp.prpData > '2021-01-01 00:00:00'
	AND pp.prpCNPJ IN ('26427482000154')
	AND pi.ipgItem > 0
--	AND (pi.ipgTipoBeneficio = '1' OR pri.ippIndAdjudicado = 'S')
--	AND p.prgStatus = 2
ORDER BY p.coduasg, p.numprp, pi.ipgItem
;

SELECT
FROM Comprasnet_VBL.tbl_Pregao p
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.prgCod = p.prgCod
JOIN Comprasnet_VBL.tbl_Proposta pp ON pp.prgCod = p.prgCod
JOIN Comprasnet_VBL.tbl_PropostaItem pri ON pri.prpCod = pp.prpCod
WHERE 1=1
--	AND pp.prpData > '2021-01-01 00:00:00'
	AND pp.prpCNPJ IN ('26427482000154')
	AND pi.ipgItem > 0
--	AND (pi.ipgTipoBeneficio = '1' OR pri.ippIndAdjudicado = 'S')
--	AND p.prgStatus = 2
ORDER BY p.coduasg, p.numprp, pi.ipgItem
;