
-- Original Selection
SELECT 
	 c.codigocompra
	,c.codigomodalidadecompra
	,c.numerocompra
	,c.anocompra
	,c.numerouasgorigem
	,c.numerouasgresponsavel
	,c.tipocompra
	,c.cpfusuarioencerramento
	,c.datahoraencerramento
	,c.codigopedidodispensaeletronica
	,c.codigosistemaorigem
	,c.percentualparagrafounico
	,c.codigolei
	,c.outrashipotesesdispensa
	,c.datahoraregistro
	,c.anocomprapncp
	,c.cnpjorgaopncp
	,c.codigoidunicopncp
	,ic.codigoitemcompra
	,ic.descricao
	,ic.descricaodetalhada
	,ic.quantidade
	,ic.numeroitem
	,ic.codigotipoitem
	,ic.codigosituacaoitemcompra
	,ic.codigoitemcatalogo
	,ic.quantidadeconsistente
	,ic.unidadefornecimento
	,ic.siglaunidadefornecimento
	,ic.capacidadeunidademedida
	,ic.nomeunidademedida
	,ic.siglaunidademedida
	,ic.nomeunidadefornecimento
	,ic.datahoraregistro
	,ic.itemsustentavel
	,ic.codigoitemcomprasrp
	,ic.quantidadetotalitemsrp
	,ic.valortotalitemsrp
FROM Siasgnet_dc_VBL.itemcompra ic
	JOIN Siasgnet_dc_VBL.versaocompraitemcompra vci ON vci.codigoitemcompra = ic.codigoitemcompra
	JOIN Siasgnet_dc_VBL.versaocompra vc ON vc.codigoversaocompra = vci.codigoversaocompra
	JOIN Siasgnet_dc_VBL.compra c ON c.codigocompra = vc.codigocompra
ORDER BY ic.numeroitem;

-- Table for Experimento v5-XGBC
SELECT 
	 ic.codigoitemcompra id
	,ic.numeroitem numero_item
	,ic.quantidade quantidade_solicitada
	,CASE c.codigomodalidadecompra
		WHEN 5 THEN vcl.horaaberturaproposta
		WHEN 6 THEN pde.datahoraaberturacotacaodispensaeletronica
	END data_hora_prevista_abertura_sp
	,CASE ic.codigotipoitem 
		WHEN 0 THEN 'M'
		WHEN 1 THEN 'S'
	END	AS tipo_item_catalogo
	,CAST(ic.codigoitemcatalogo AS INTEGER) codigo_item_catalogo
	,CAST(o.numeroorgao AS STRING) it_co_orgao
	,CASE WHEN numerogrupo IS NOT NULL THEN True ELSE False END in_agrupado
	,m.uf it_sg_uf
	--
	,c.codigomodalidadecompra
	,c.numerouasgorigem numero_uasg
	,CAST(c.numerocompra AS INTEGER) numerocompra
	,c.anocompra
FROM Siasgnet_dc_VBL.itemcompra ic
	LEFT JOIN Siasgnet_dc_VBL.itemlicitacao il ON il.codigoitemlicitacao = ic.codigoitemcompra
	JOIN Siasgnet_dc_VBL.versaocompraitemcompra vci ON vci.codigoitemcompra = ic.codigoitemcompra
	JOIN Siasgnet_dc_VBL.versaocompra vc ON vc.codigoversaocompra = vci.codigoversaocompra
	JOIN Siasgnet_dc_VBL.compra c ON c.codigocompra = vc.codigocompra
	LEFT JOIN Siasgnet_dc_VBL.versaocompracomlicitacao AS vcl ON vcl.codigoversaocompracomlicitacao = vc.codigoversaocompra
	LEFT JOIN Siasgnet_dc_VBL.pedidodispensaeletronica AS pde ON pde.codigopedidodispensaeletronica = c.codigopedidodispensaeletronica
	JOIN Siasgnet_VBL.uasg u ON c.numerouasgorigem = u.numerouasg
	JOIN Siasgnet_VBL.orgao o ON u.numeroorgaouasg = o.numeroorgao
	LEFT JOIN Siasgnet_VBL.municipio m ON m.codigomunicipio = u.codigomunicipio
WHERE 1=1
	AND tipocompra = 'C'
	AND CASE c.codigomodalidadecompra WHEN 5 THEN vcl.horaaberturaproposta WHEN 6 THEN pde.datahoraaberturacotacaodispensaeletronica END IS NOT NULL
	AND c.anocompra IN (2022)
	AND c.datahoraregistro BETWEEN '2022-08-21 00:00:00.000' AND '2022-08-29 00:00:00.000'
ORDER BY ic.numeroitem;