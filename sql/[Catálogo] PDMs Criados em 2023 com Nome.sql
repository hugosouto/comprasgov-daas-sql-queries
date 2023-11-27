SELECT
	 a.id
--	,a.cpf_usuario
	,a.uasg_usuario
--	,a.ip_usuario
--	,a.tipo_alteracao
	,a.data_hora
	,a.id_item AS pdm
	,p.nome_pdm
	-- dados_alterados 
FROM
	Novo_Catalogo_VBL.auditoria a
	JOIN Novo_Catalogo_VBL.pdm_material p ON a.id_item = p.codigo_pdm  
WHERE
	tipo_alteracao LIKE 'gravardadospdmcompleto%'
	AND data_hora > '2023-00-00'