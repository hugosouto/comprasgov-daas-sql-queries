SELECT
	'2023001' id_requisicao,
	'2023-05-01718:23:10.0002' ts_requisicao,
    a.id_uasg uasg_comprador,
	CAST(REPLACE(a.tx_descricao, '/', '') AS INTEGER) numart,
	i.valor valor_estimado,
	CASE a.in_tipo
		WHEN 0 THEN 'ETP' -- "Estudo Técnico Preliminar"
		WHEN 1 THEN 'MR' -- "Matriz de Riscos" 
		WHEN 2 THEN 'ETP_TIC' -- "Estudo Técnico Preliminar (TIC)" 
		WHEN 3 THEN 'PGC' -- "Programação e Gestão de Contratações" 
		WHEN 4 THEN 'DFD' -- "Documento de Formalização de Demanda" 
		WHEN 5 THEN 'PC'-- "Processo de Compra"
		WHEN 6 THEN 'TR' -- "Termo de Referência"
		END etapa,
	a.in_tipo cod_etapa,
    1 versao_art,
	'FaseInterna' fase_licitacao,
	a.dt_hora_operacao data_publicacao	
FROM artefato a
JOIN secao_artefato s ON a.id_artefato = s.id_artefato
JOIN item_secao i ON i.id_item_secao = s.id_secao_artefato
;