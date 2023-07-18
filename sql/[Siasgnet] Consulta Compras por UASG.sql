-- Agrupado
SELECT 
	o.numeroorgao,
	c.numerouasgorigem,
	COUNT(c.codigocompra) contagemcompras
FROM Siasgnet_dc_VBL.compra c
JOIN Siasgnet_VBL.uasg u ON c.numerouasgresponsavel = u.numerouasg
JOIN Siasgnet_VBL.orgao o ON u.numeroorgaouasg = o.numeroorgao
WHERE anocompra='2023' AND numerouasgorigem IN (390004, 399008, 400040, 400041, 400042, 400043, 400046, 400047, 400048, 400054, 400055, 400056, 400057, 400059, 400060, 400061, 400062, 400063, 400064, 400065, 400066, 400067, 400069, 400070, 400071, 400072, 400073, 400074, 400075, 400076, 400077, 400078, 400079, 400080, 400081, 400082, 400083, 400084, 400085, 400086, 400087, 400045, 400068)
GROUP BY c.numerouasgorigem, c.numerouasgorigem, o.numeroorgao
;


-- Lista
SELECT
	numeroorgao,
	o.ativo orgaoativo,
	codigoesfera,
	o.nome nomeorgao,
	codigopoder,
	o.sigla siglaorgao,
	codigotipoadministracao,
	numeroorgaovinculado,
	cnpj,
	numerouasg,
	adesaosiasg,
	u.ativo uasgativo,
	centralcompras,
	codigosiorg,
	u.nome nomeuasg,
	u.sigla siglauasg,
	sisg,
	codigomunicipio,
	numeroorgaouasg,
	numerouasgpolo,
	codigocompra,
	codigomodalidadecompra,
	numerocompra,
	anocompra,
	numerouasgorigem,
	numerouasgresponsavel,
	tipocompra,
	cpfusuarioencerramento,
	datahoraencerramento,
	codigopedidodispensaeletronica,
	codigosistemaorigem,
	percentualparagrafounico,
	codigolei,
	outrashipotesesdispensa,
	datahoraregistro,
	anocomprapncp,
	cnpjorgaopncp,
	codigoidunicopncp
FROM Siasgnet_dc_VBL.compra c
JOIN Siasgnet_VBL.uasg u ON c.numerouasgresponsavel = u.numerouasg
JOIN Siasgnet_VBL.orgao o ON u.numeroorgaouasg = o.numeroorgao
WHERE anocompra='2023' AND numerouasgorigem IN (390004, 399008, 400040, 400041, 400042, 400043, 400046, 400047, 400048, 400054, 400055, 400056, 400057, 400059, 400060, 400061, 400062, 400063, 400064, 400065, 400066, 400067, 400069, 400070, 400071, 400072, 400073, 400074, 400075, 400076, 400077, 400078, 400079, 400080, 400081, 400082, 400083, 400084, 400085, 400086, 400087, 400045, 400068)
;