SELECT
	l.id,
	l.identificacao_usuario,
	l.valor_informado,
	l.id_participacao_disputa_item,
	l.origem,
	l.melhor_lance_atual,
	l.valor_batido_informado,
	l.origem_sessao_usuario,
	l.id_rodada_disputa_item,
	rdi.data_hora_inicio,
	rdi.data_hora_fim,
	l.data_hora_inclusao,
	COUNT(*) OVER (PARTITION BY l.id_rodada_disputa_item) AS qtd_lances,
	di.quantidade_solicitada * di.valor_estimado_original AS valor_total_estimado_item,
	di.ano_compra
FROM
	lance l
	JOIN rodada_disputa_item rdi ON l.id_rodada_disputa_item = rdi.id
	JOIN disputa_item di ON rdi.id_disputa_item = di.id
WHERE
	data_hora_inicio > '2022-10-01 00:00:00' AND data_hora_fim < '2023-01-01 00:00:00'
--	AND origem = 'L'
ORDER BY
	l.id_rodada_disputa_item
;