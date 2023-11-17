SELECT
	SUM(ipgValorRef) ipgValorRef,
	SUM(ipgValorMinClassif) ipgValorMinClassif,
	SUM(ipgValorRef)-SUM(ipgValorMinClassif) economy
FROM Comprasnet_VBL.tbl_Pregao p
JOIN Comprasnet_VBL.tbl_pregaoitem pi ON p.prgCod = pi.prgCod
WHERE 1=1
	AND (prgPregoeiroCad = 'CPF' OR prgPregoeiroExec = 'CPF')
	AND pi.ipgItem >= 0
	AND ipgValorMinClassif IS NOT NULL