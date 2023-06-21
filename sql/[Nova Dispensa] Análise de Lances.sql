SELECT
	SUBSTRING(data_hora_melhor_proposta_lance,1,7) ano_mes,
	origem_melhor_valor,
	COUNT(DISTINCT id_item) contagem
FROM Comprasnet_fase_externa_VBL.proposta_item pri 
--JOIN Comprasnet_fase_externa_VBL.item i ON i.id = pri.id_item
--WHERE 
--	i.homologado='S' AND
--	pri.data_hora_inclusao > '2022-08-01 00:00:00' AND 
--	id_item > 57000
GROUP BY SUBSTRING(data_hora_melhor_proposta_lance,1,7),origem_melhor_valor;

SELECT
	SUBSTRING(data_hora_melhor_proposta_lance,1,7) ano_mes,
	origem_melhor_valor,
	COUNT(id_item) contagem
FROM Comprasnet_fase_externa_VBL.proposta_item
WHERE situacao=6
GROUP BY SUBSTRING(data_hora_melhor_proposta_lance,1,7),origem_melhor_valor;