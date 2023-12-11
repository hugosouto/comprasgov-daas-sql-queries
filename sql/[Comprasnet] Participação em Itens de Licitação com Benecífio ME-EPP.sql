SELECT DISTINCT
	 p.coduasg CodigoUasg
	,'Pregão' Modalidade
	,CASE p.prgIndElet WHEN 'S' THEN 'Eletrônico' WHEN 'N' THEN 'Presencial' ELSE p.prgIndElet END Formato
	,p.numprp NumeroPregao
	,pp.prpCNPJ CNPJ
	,pp.prpRazaoSocial RazaoSocial
	,p.prgDataAbertura DataAbertura
	,CASE pri.ippIndAdjudicado
		WHEN 'S' THEN 'Adjudicado'
--		WHEN IS NULL THEN 'Não'
		ELSE 'Não Adjudicado'
		END IndicadorAdjudicado
	,CASE pi.ipgTipoBeneficio
		WHEN '0' THEN 'Sem Benefício para ME/EPP/Cooperativa'
		WHEN '1' THEN 'TIPO I - Participação Exclusiva de ME/EPP/Cooperativa'
		WHEN '2' THEN 'TIPO II - Exigência de Sub-contratação de ME/EPP/Cooperativas'
		WHEN '3' THEN 'TIPO III - Cota para Participação Exclusiva de ME/EPP/Cooperativas'
		END TipoBeneficio
	,pi.ipgItem ItemPregao
	,pi.ipgNomeItem DescricaoItem
FROM Comprasnet_VBL.tbl_Pregao p
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON pi.prgCod = p.prgCod
JOIN Comprasnet_VBL.tbl_Proposta pp ON pp.prgCod = p.prgCod
JOIN Comprasnet_VBL.tbl_PropostaItem pri ON pri.prpCod = pp.prpCod
WHERE 1=1
	AND pp.prpData > '2021-01-01 00:00:00'
	AND pp.prpCNPJ IN ('')
	AND pi.ipgItem > 0
--	AND (pi.ipgTipoBeneficio = '1' OR pri.ippIndAdjudicado = 'S')
	AND p.prgStatus = 2
ORDER BY CodigoUasg,NumeroPregao,ItemPregao
;