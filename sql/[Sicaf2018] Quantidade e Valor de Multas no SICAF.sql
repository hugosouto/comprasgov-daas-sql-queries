------ Agregado por Ano 
SELECT 
	SUBSTRING(dt_aplicacao, 1, 4) Ano,
	COUNT(id_ocorrencia_multa) as Qtd_Total, 
	SUM(vl_multa) as Valor_Total
FROM ocorrencia_multa om
JOIN ocorrencia o ON o.id_ocorrencia = om.id_ocorrencia_multa
LEFT JOIN motivo_ocorrencia_dinamica mo ON mo.id_motivo_ocorrencia_dinamica = om.id_motivo
WHERE dt_aplicacao >= '2019-01-01' AND o.ind_excluida = 'N' AND vl_multa < 900000000
GROUP BY SUBSTRING(dt_aplicacao, 1, 4)
ORDER BY SUBSTRING(dt_aplicacao, 1, 4)
;

------ Agregado por Ano e Motivo
SELECT 
	SUBSTRING(dt_aplicacao, 1, 4) Ano,
	CASE id_motivo
		WHEN 1 THEN 'Inabilitação ou Desclassificação por Irregularidade ou Inexequibilidade da Proposta'
		WHEN 2 THEN 'Inexecução Total ou Parcial do Contrato'
		WHEN 3 THEN 'Recusa em celebrar contrato'
		WHEN 4 THEN 'Outros' END Motivo,
	COUNT(id_ocorrencia_multa) as Qtd_Total, 
	SUM(vl_multa) as Valor_Total
FROM ocorrencia_multa om
JOIN ocorrencia o ON o.id_ocorrencia = om.id_ocorrencia_multa
LEFT JOIN motivo_ocorrencia_dinamica mo ON mo.id_motivo_ocorrencia_dinamica = om.id_motivo
WHERE dt_aplicacao >= '2019-01-01' AND o.ind_excluida = 'N' AND vl_multa < 900000000
GROUP BY SUBSTRING(dt_aplicacao, 1, 4),
	CASE id_motivo
		WHEN 1 THEN 'Inabilitação ou Desclassificação por Irregularidade ou Inexequibilidade da Proposta'
		WHEN 2 THEN 'Inexecução Total ou Parcial do Contrato'
		WHEN 3 THEN 'Recusa em celebrar contrato'
		WHEN 4 THEN 'Outros' END
ORDER BY SUBSTRING(dt_aplicacao, 1, 4)
;

------ Outliers
SELECT
	id_ocorrencia,
	SUBSTRING(dt_aplicacao, 1, 4) Ano,
	id_ocorrencia_multa as Qtd_Total, 
	vl_multa as Valor_Total
FROM ocorrencia_multa om
JOIN ocorrencia o ON o.id_ocorrencia = om.id_ocorrencia_multa
LEFT JOIN motivo_ocorrencia_dinamica mo ON mo.id_motivo_ocorrencia_dinamica = om.id_motivo
WHERE dt_aplicacao >= '2019-01-01' AND o.ind_excluida = 'N' AND vl_multa > 900000000
--GROUP BY SUBSTRING(dt_aplicacao, 1, 4)
ORDER BY SUBSTRING(dt_aplicacao, 1, 4)
;

------ Consulta original
SELECT COUNT(id_ocorrencia_multa) as Qtd_Total, SUM(vl_multa) as Valor_Total
FROM ocorrencia_multa
WHERE dt_aplicacao BETWEEN '2019-01-01' AND '2019-12-31'
;

------ Agregado por Ano e Motivo
SELECT 
	SUBSTRING(dt_aplicacao, 1, 4) Ano,
	CASE id_motivo
		WHEN 1 THEN 'Inabilitação ou Desclassificação por Irregularidade ou Inexequibilidade da Proposta'
		WHEN 2 THEN 'Inexecução Total ou Parcial do Contrato'
		WHEN 3 THEN 'Recusa em celebrar contrato'
		WHEN 4 THEN 'Outros' END Motivo,
	COUNT(id_ocorrencia_multa) as Qtd_Total, 
	SUM(vl_multa) as Valor_Total
FROM ocorrencia_multa om
JOIN ocorrencia o ON o.id_ocorrencia = om.id_ocorrencia_multa
LEFT JOIN motivo_ocorrencia_dinamica mo ON mo.id_motivo_ocorrencia_dinamica = om.id_motivo
WHERE dt_aplicacao >= '2019-01-01' AND o.ind_excluida = 'N' AND vl_multa < 900000000
GROUP BY SUBSTRING(dt_aplicacao, 1, 4),
	CASE id_motivo
		WHEN 1 THEN 'Inabilitação ou Desclassificação por Irregularidade ou Inexequibilidade da Proposta'
		WHEN 2 THEN 'Inexecução Total ou Parcial do Contrato'
		WHEN 3 THEN 'Recusa em celebrar contrato'
		WHEN 4 THEN 'Outros' END
ORDER BY SUBSTRING(dt_aplicacao, 1, 4)
;
