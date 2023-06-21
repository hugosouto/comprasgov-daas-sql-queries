WITH inativadas as (
	SELECT
		LEFT(u.IT_DA_MOVIMENTO, 6)				AS anomes,
		COUNT(DISTINCT u.IT_CO_UNIDADE_GESTORA)	AS conta_unidades_inativadas,
		GETDATE()								AS datahoraregisto
	FROM Stg_Siasg.siasg.siasg_unidade_gestora 	u
		JOIN Stg_Siasg.siasg.siasg_orgao		o ON u.IT_CO_ORGAO = o.IT_CO_ORGAO
	WHERE
	    u.IT_IN_STATUS <> ''
	    AND u.IT_DA_MOVIMENTO > '20100000'
	    AND u.IT_IN_USO_SISG_UASG = 'S'
	    AND o.IT_NO_ORGAO <> ''
	GROUP BY LEFT(u.IT_DA_MOVIMENTO, 6)
), cadastradas as (
	SELECT
		LEFT(u.IT_DA_IMPLANTACAO_SIDEC, 6)		AS anomes,
		COUNT(DISTINCT u.IT_CO_UNIDADE_GESTORA)	AS conta_unidades_cadastradas,
		GETDATE() 								AS datahoraregisto
	FROM Stg_Siasg.siasg.siasg_unidade_gestora	u
		JOIN Stg_Siasg.siasg.siasg_orgao 		o ON u.IT_CO_ORGAO = o.IT_CO_ORGAO
	WHERE
	    u.IT_IN_STATUS = ''
	    AND u.IT_DA_IMPLANTACAO_SIDEC > '20100000'
	    AND u.IT_IN_USO_SISG_UASG = 'S'
	    AND o.IT_NO_ORGAO <> ''
	 GROUP BY LEFT(u.IT_DA_IMPLANTACAO_SIDEC, 6)
)
SELECT DISTINCT
	COALESCE(c.anomes, i.anomes) AS anomes,
	SUM(COALESCE(conta_unidades_cadastradas, 0) - COALESCE(conta_unidades_inativadas, 0)) OVER(ORDER BY COALESCE(c.anomes, i.anomes)) + 
	(SELECT count(*)
		FROM Stg_Siasg.siasg.siasg_unidade_gestora s
		WHERE it_in_uso_sisg_uasg = 'S'
		AND it_in_status = ''
		AND (it_da_implantacao_sidec < '20100000' or it_da_implantacao_sidec like '')) +
	(SELECT count(*)
		FROM Stg_Siasg.siasg.siasg_unidade_gestora s
		WHERE it_in_uso_sisg_uasg = 'S'
		AND it_in_status <> ''
		AND (it_da_implantacao_sidec < '20100000' or it_da_implantacao_sidec like '')
		AND it_da_movimento >= '20100000') as saldounidades,
	GETDATE() AS datahoraregisto
FROM cadastradas c FULL OUTER JOIN inativadas i ON c.anomes = i.anomes
ORDER BY anomes