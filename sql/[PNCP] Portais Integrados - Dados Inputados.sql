SELECT
	7986 qt_contratos_pncp,
	76728 qt_compras,
	'05/08/2021' datainclusao,
	3 id,
	'Compras.gov.brTeste2' nomerazaosocial,
	'00394460000141' cpfcnpj
FROM PNCP_VBL.usuario u
	JOIN PNCP_VBL.compra cp ON u.id = cp.usuarioid
	JOIN PNCP_VBL.contrato ct ON u.id = ct.usuarioid
LIMIT 100