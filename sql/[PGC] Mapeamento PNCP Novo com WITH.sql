WITH h AS (
	SELECT id_item, situacao, MAX(updated_at)
	FROM pgc.historico_tramitacoes
	GROUP BY id_item
)
SELECT * -- DISTINCT
-- 	h.situacao, MAX(h.updated_at), i.*
-- 	h.situacao
FROM pgc.itens i
	JOIN pgc.uasgs  u ON i.id_uasg = u.id
	JOIN pgc.planos_anuais pa ON pa.id = i.id_plano_anual
	LEFT JOIN pgc.grupos g ON g.id = i.id_grupo
-- 	JOIN pgc.orgaos o ON o.id = u.orgao_id
-- 	JOIN pgc.users usr ON usr.cpf = i.cpf_cadastrou
-- 	JOIN pgc.sub_itens sub ON sub.id = i.id_sub_item
	JOIN h ON i.id = h.id_item 
WHERE
-- 	h.updated_at = MAX(h.updated_at) AND
-- 	h.situacao IN ('EN','EL') AND
-- 	h.situacao = MAX(h.updated_at)
-- 	i.id_uasg = 837
	i.id_uasg = 3797
	AND i.id_plano_anual = 6
-- GROUP BY h.id_item
;