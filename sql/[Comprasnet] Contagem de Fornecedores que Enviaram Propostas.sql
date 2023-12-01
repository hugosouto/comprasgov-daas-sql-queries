SELECT COUNT(DISTINCT pr.prpCNPJ) contagem_fornecedores
FROM Comprasnet_VBL.tbl_Pregao p
	JOIN Comprasnet_VBL.tbl_pregaoitem pi ON p.prgCod = pi.prgCod
	JOIN Comprasnet_VBL.tbl_PropostaItem pri ON pi.ipgCod = pri.prpCod
	JOIN Comprasnet_VBL.tbl_Proposta pr ON pr.prpCod = pri.prpCod
WHERE pr.prpData > '2023-01-01 00:00:00'