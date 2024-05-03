-- in_deserto -----------------------------------------------------------------------

WITH temp AS (
	SELECT 
		pri.ipgCod, 
		CASE WHEN COUNT(DISTINCT ppi.prpCod) = 0 THEN True ELSE False END in_deserto,
		pri.ipgValorRef valor_estimado
	FROM Comprasnet_VBL.tbl_pregaoitem pri
		JOIN Comprasnet_VBL.tbl_Pregao pr ON pri.prgCod = pr.prgCod
		LEFT JOIN Comprasnet_VBL.tbl_PropostaItem ppi ON ppi.ipgCod = pri.ipgCod
	WHERE 1=1
		AND pri.ipgItem > 0
		AND pr.prgDataAbertura BETWEEN '2023-00-00 00:00:00' AND '2024-00-00 00:00:00'
		AND pr.prgStatus IN (2, 4) -- 2:homologado
		AND pri.spgCod IN (6, 9) -- 6:Cancelado | 9:Homologado
	GROUP BY pri.ipgCod, pri.ipgValorMinClassif, pri.ipgValorRef
)
SELECT
	in_deserto
	,COUNT (*) contagem
	,COUNT (*) / (1169985.00) percentual
	,SUM(valor_estimado) valor_estimado
FROM temp
GROUP BY in_deserto
;

-- in_sem_competicao ----------------------------------------------------------------

WITH temp AS (
	SELECT
		pri.ipgCod,
		CASE WHEN COUNT(DISTINCT ppi.prpCod) = 1 THEN True ELSE False END in_sem_competicao,
		pri.ipgValorRef valor_estimado,
		CASE WHEN ipgValorMinClassif = ipgValorRef THEN 1 ELSE 0 END sem_reducao
	FROM Comprasnet_VBL.tbl_pregaoitem pri
		JOIN Comprasnet_VBL.tbl_Pregao pr ON pri.prgCod = pr.prgCod
		LEFT JOIN Comprasnet_VBL.tbl_PropostaItem ppi ON ppi.ipgCod = pri.ipgCod
	WHERE 1=1
		AND pri.ipgItem > 0
		AND pr.prgDataAbertura BETWEEN '2023-00-00 00:00:00' AND '2024-00-00 00:00:00'
		AND pr.prgStatus IN (2, 4) -- 2:homologado
		AND pri.spgCod IN (6, 9) -- 6:Cancelado | 9:Homologado
	GROUP BY pri.ipgCod, pri.ipgValorMinClassif, pri.ipgValorRef
	HAVING COUNT(DISTINCT ppi.prpCod) > 0 
)
SELECT
	 in_sem_competicao
	,SUM(sem_reducao) sem_reducao
	,COUNT(*) contagem
	,SUM(sem_reducao) / CAST(COUNT(*) AS FLOAT) percentual_sem_reducao
	,COUNT(*) / (1084730.00) percentual_do_total_nao_deserto
	,COUNT(*) / (1169985.00) percentual_do_total_geral
	,SUM(valor_estimado) valor_estimado
FROM temp
WHERE 1=1 AND sem_reducao IS NOT NULL
GROUP BY in_sem_competicao
;

-- media_reducao --------------------------------------------------------------------

WITH temp AS (
SELECT 
	pri.ipgCod item,
	1-(CAST(pri.ipgValorRef AS FLOAT) - CAST(ppi.ippValorClassif AS FLOAT)) / CAST(pri.ipgValorRef AS FLOAT) reducao
FROM Comprasnet_VBL.tbl_pregaoitem pri
JOIN Comprasnet_VBL.tbl_PropostaItem ppi ON ppi.ipgCod = pri.ipgCod
WHERE pri.ipgFormaJulg = 'V' AND ppi.ippIndAdjudicado = 'S' AND pri.ipgValorRef IS NOT NULL
GROUP BY pri.ipgCod, pri.ipgValorRef, ppi.ippValorClassif
HAVING COUNT(DISTINCT ppi.prpCod) > 1
)
SELECT
	SUM(CAST(item AS FLOAT)) itens,
	AVG(CAST(reducao AS FLOAT)) media_reducao
FROM temp
;