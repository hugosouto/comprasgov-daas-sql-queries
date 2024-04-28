-- Valores Separados ----------------------------
SELECT
	'Lance por App' tipo,
	COUNT(DISTINCT id) quantidade
FROM ComprasGov_SalaDisputa_VBL.lance
WHERE origem_sessao_usuario = 'A' AND data_hora_inclusao >= '2024-01-01'
UNION
SELECT 
	'Total de Lances' tipo,
	COUNT(DISTINCT id) quantidade
FROM ComprasGov_SalaDisputa_VBL.lance
WHERE data_hora_inclusao >= '2024-01-01'
UNION
SELECT 
	'Proposta por App' tipo, 
	COUNT(DISTINCT id) quantidade
FROM ComprasGov_FaseExterna_VBL.proposta_item
WHERE origem_sessao_usuario = 'A' AND data_hora_inclusao >= '2024-01-01'
UNION
SELECT 
	'Total de Propostas' tipo, 
	COUNT(DISTINCT id) quantidade
FROM ComprasGov_FaseExterna_VBL.proposta_item
WHERE data_hora_inclusao >= '2024-01-01'
;

-- Valores Agregados [erro] ---------------------
SELECT
	'Lances' tipo,
	(
	SELECT COUNT(DISTINCT id) propostas_e_lances_por_app
	FROM ComprasGov_SalaDisputa_VBL.lance
	WHERE origem_sessao_usuario = 'A' AND data_hora_inclusao >= '2024-01-01'
	) / (
	SELECT COUNT(DISTINCT id) propostas_e_lances_por_app
	FROM ComprasGov_SalaDisputa_VBL.lance
	WHERE data_hora_inclusao >= '2024-01-01'
	) as proporcao_propostas_e_lances_por_app
FROM ComprasGov_SalaDisputa_VBL.lance
UNION
SELECT
	'Proposta' tipo,
	(
	SELECT COUNT(DISTINCT id) propostas_e_lances_por_app
	FROM ComprasGov_FaseExterna_VBL.proposta_item
	WHERE origem_sessao_usuario = 'A' AND data_hora_inclusao >= '2024-01-01'
	) / (
	SELECT COUNT(DISTINCT id) propostas_e_lances_por_app
	FROM ComprasGov_FaseExterna_VBL.proposta_item
	WHERE data_hora_inclusao >= '2024-01-01'
	)
FROM ComprasGov_FaseExterna_VBL.proposta_item
;