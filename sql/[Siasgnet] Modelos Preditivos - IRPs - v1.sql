SELECT DISTINCT 
	ii.datainclusao,
	i.numeroirp||LPAD(ii.numeroordemitem,5,0) codirpitem,
	ii.numeroordemitem,
	i.numerouasg,
	SUM(CASE WHEN ie.numerouasg = i.numerouasg THEN ie.quantidade END) quantgeren,
	SUM(ie.quantidade) quantidadetotal,
	f.quantidadehomologada,
	ii.valorestimado,
	f.valorhomologadounitario,
	COUNT(DISTINCT ie.numerouasg) contagerenpartic,
	SUM(CAST(ie.quantidade AS FLOAT))/SUM(CASE WHEN ie.numerouasg = i.numerouasg THEN CAST(ie.quantidade AS FLOAT) END) razaoquantidade,
	(ii.valorestimado-f.valorhomologadounitario)/ii.valorestimado valorreducaopercentual,
	ii.codigocatitem,
	ia.descricao,
	ii.unidadefornecimento
FROM Siasgnet_irp_VBL.irpitem ii
	JOIN Siasgnet_irp_VBL.irpitemmentrega ie ON ie.codigoirpitem = ii.codigoirpitem
	JOIN Siasgnet_irp_VBL.minteresseitem mi ON mi.codigoirpitem = ii.codigoirpitem
	JOIN Siasgnet_irp_VBL.minteresse m ON m.codigomi = mi.codigomi
	JOIN Siasgnet_irp_VBL.irp i ON i.codigoirp = ii.codigoirp
	JOIN Siasgnet_atasrp_VBL.licitacaosrp l ON UPPER(l.numerouasggerenciadora||l.anoirp||l.numeroirp) = i.numeroirp
	JOIN Siasgnet_atasrp_VBL.itematasrp ia ON UPPER(ia.codigolicitacaosrp||ia.numeroitem) = UPPER(l.codigolicitacaosrp||ii.numeroordemitem) -- ia.codigolicitacaosrp = l.codigolicitacaosrp AND ia.numeroitem = ii.numeroordemitem
	JOIN Siasgnet_atasrp_VBL.fornecedor f ON f.codigoitematasrp = ia.codigoitematasrp
WHERE ii.datainclusao BETWEEN '2016-00-00 00:00:00' AND '2018-00-00 00:00:00' -- l.anoirp = '2021'  
	AND i.codigoirpsit IN (6)
	AND mi.codigomiitemsit IN (3)
	AND f.valido IN ('T')
	AND f.classificacao IN (1)
GROUP BY ii.datainclusao, i.numeroirp, ii.numeroordemitem, i.numerouasg, f.quantidadehomologada, ii.valorestimado, f.valorhomologadounitario, ii.codigocatitem, ia.descricao, ii.unidadefornecimento
;
