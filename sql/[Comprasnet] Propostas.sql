SELECT
	prpCod,
	prgCod,
	prpData,
	prpCNPJ,
	prpRazaoSocial,
	prpDataRetif,
	prpPorteEmpresa,
	prpIndParticiparConvocacao,
	prpDataParticiparConvocacao,
	prpDeclaracaoInfantil,
	prpDeclaracaoSuperveniente,
	prpDataDeclaracao,
	prpIndConvocarDeclaracao,
	prpDeclaracaoPropIndependente,
	prpDecTrabForcado,
	prpDecAcessibilidade,
	prpDeclaracaoCotaAprendizagem,
	prpUnico,
	dataInclusao,
	dataAlteracao
FROM Comprasnet_VBL.tbl_Proposta
WHERE prpPorteEmpresa IS NOT NULL
ORDER BY prpCod
LIMIT 11000000, 1000000