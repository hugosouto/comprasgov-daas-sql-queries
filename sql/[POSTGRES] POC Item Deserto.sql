SELECT 
	 i.*
	,u.it_sg_uf
	,u.it_co_orgao
	,u.it_no_orgao
	,u.it_co_orgao_vinculado
	,u.it_no_orgao_vinculado
	,u.it_co_orgao_superior
	,u.it_no_orgao_superior
	,u.it_in_tipo_administracao
	,u.it_in_tipo_poder
	,u.it_in_esfera
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.codigo_grupo
		WHEN 'S' THEN s.codigo_divisao
		END codigo_grupo_divisao
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.codigo_classe
		WHEN 'S' THEN s.codigo_grupo
		END codigo_grupo_classe
	,CASE i.tipo_item_catalogo
		WHEN 'M' THEN m.codigo_pdm
		WHEN 'S' THEN CASE WHEN s.codigo_classe IS NULL THEN s.codigo_grupo ELSE s.codigo_classe END 
		END codigo_pdm_grupo
FROM analises.poc_item_deserto i
	JOIN estrutura.siasg_uasgs_orgaos u ON u.it_co_unidade_gestora = i.numero_uasg
	JOIN catalogo.item_material m ON i.codigo_item_catalogo = m.codigo_item
	LEFT JOIN catalogo.item_servico s ON i.codigo_item_catalogo = s.codigo_servico