SELECT
	numprp,coduasg,'Pregão' AS modalidade,prgDataAbertura,prpCNPJ,prpRazaoSocial
FROM Comprasnet_VBL.tbl_Pregao p
JOIN Comprasnet_VBL.tbl_Proposta pp ON pp.prgCod = p.prgCod
WHERE pp.prpData > '2017-01-01 00:00:00'
AND pp.prpCNPJ IN ('')
;

SELECT
	numprp,
	coduasg,
	CASE WHEN modprp = 1 THEN 'Convite'
		 WHEN modprp = 2 THEN 'Tomada de Preços'
		 WHEN modprp = 3 THEN 'Concorrência'
		 WHEN modprp = 4 THEN 'Concorrência Internacional'
		 WHEN modprp = 5 THEN 'Pregão'
--		 WHEN modprp = 8 THEN '???' -- Código 8 (desconhecido) existe em apenas 10 compras a última foi de 2011.
		 WHEN modprp = 20 THEN 'Concurso'
		 WHEN modprp = 99 THEN 'Regime Diferenciado de Contratações'
	ELSE CAST(modprp AS INTEGER) END modalidadelicitacao,
	prgDataAbertura,
	prpCNPJ,prpRazaoSocial
FROM Comprasnet_VBL.tbl_Proposta pp
LEFT JOIN Comprasnet_VBL.tb_compras c ON c.prgCod = pp.prpCod
WHERE pp.prpData > '2017-04-01 00:00:00'
AND pp.prpCNPJ IN ('')

SELECT 
--	DISTINCT modprp
	CASE WHEN modprp = 1 THEN 'Convite'
		 WHEN modprp = 2 THEN 'Tomada de Preços'
		 WHEN modprp = 3 THEN 'Concorrência'
		 WHEN modprp = 4 THEN 'Concorrência Internacional'
		 WHEN modprp = 5 THEN 'Pregão'
--		 WHEN modprp = 8 THEN '???' -- Código 8 (desconhecido) existe em apenas 10 compras a última foi de 2011.
		 WHEN modprp = 20 THEN 'Concurso'
		 WHEN modprp = 99 THEN 'Regime Diferenciado de Contratações'
	ELSE CAST(modprp AS INTEGER) END modalidadelicitacao
FROM Comprasnet_VBL.tb_compras;