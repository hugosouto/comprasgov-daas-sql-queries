SELECT 'Lance' tipo, COUNT(DISTINCT id) propostas_e_lances_por_app
FROM ComprasGov_SalaDisputa_VBL.lance
WHERE 1=1
	AND origem_sessao_usuario = 'A'
	AND data_hora_inclusao >= '2024-01-01'
UNION
SELECT 'Proposta' tipo, COUNT(DISTINCT id) propostas_e_lances_por_app
FROM ComprasGov_FaseExterna_VBL.proposta_item
WHERE 1=1
	AND origem_sessao_usuario = 'A'
	AND data_hora_inclusao >= '2024-01-01'
;