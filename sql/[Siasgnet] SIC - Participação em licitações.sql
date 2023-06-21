SELECT
	CAST(numerolicitacao || anolicitacao AS INTEGER) numerodalicitacao,
	codigouasg uasg,
	CASE WHEN codigomodalidade = '0' THEN 'Convite'
		 WHEN codigomodalidade = '1' THEN 'Tomada de Preços'
		 WHEN codigomodalidade = '2' THEN 'Concorrência'
		 WHEN codigomodalidade = '3' THEN 'Concurso'
	ELSE CAST(codigomodalidade AS INTEGER) END modalidadelicitacao,
	LEFT(l.datahoraregistro, 10) datacompra,
	cpfcnpj cnpj,
	nomerazaosocial razaosocial
FROM Siasgnet_sp_VBL.participante pa
JOIN Siasgnet_sp_VBL.fornecedor f ON f.codigofornecedor = pa.codigofornecedor
JOIN Siasgnet_sp_VBL.proposta pr ON pr.codigoparticipante = pa.codigoparticipante
JOIN Siasgnet_sp_VBL.licitacao l ON l.codigolicitacao = pa.codigolicitacao
WHERE f.cpfcnpj IN ('03066528000151','39382692000115','10821252000135','14834948000157','30953791000135','11161040000131')

