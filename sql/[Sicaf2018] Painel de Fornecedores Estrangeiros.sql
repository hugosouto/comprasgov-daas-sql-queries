SELECT
	f.id_fornecedor_estrangeiro,
	f.dsc_identificador,
	f.nom_empresa,
	f.dsc_email,
	f.cod_pais,
	f.cod_area,
	f.num_telefone,
	f.id_pais,
	p.dsc_pais,
	f.nom_cidade,
	f.dsc_endereco,
	f.dt_cadastramento,
	f.id_responsavel_cadastro,
	f.dt_ultima_atualizacao,
	f.dt_validacao_credenciamento
FROM Sicaf2018_VBL.fornecedor_estrangeiro f
JOIN Sicaf2018_VBL.pais p ON p.id_pais = f.id_pais  
WHERE dt_cadastramento >= '2020-10-01'
ORDER BY f.id_fornecedor_estrangeiro