SELECT DISTINCT situacao, id_item, updated_at
FROM pgc.historico_tramitacoes h
WHERE id_item = 5847520
	AND situacao IN ('EN','EL')
ORDER BY updated_at DESC
;

SELECT id,situacao,id_item,updated_at FROM pgc.historico_tramitacoes x
WHERE updated_at > '2021-01-01 00:00:00'
ORDER BY x.updated_at DESC;