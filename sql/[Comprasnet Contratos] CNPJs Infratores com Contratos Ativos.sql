SELECT LPAD(REPLACE(REPLACE(REPLACE(cpf_cnpj_idgener,'.',''),'/',''),'-',''), 14, 0) pk_cpf_cnpj,cpf_cnpj_idgener,f.nome razaosocial,
	gestao,codigosiasg,c.nome unidade,esfera,poder,tipo_adm,numero,ci1.descricao tipo,ci2.descricao categoria,processo,objeto,ci3.descricao modalidade,licitacao_numero,data_assinatura,data_publicacao,vigencia_inicio,vigencia_fim,valor_inicial,valor_global,valor_acumulado
FROM fornecedores f
JOIN contratos c ON f.id = c.fornecedor_id
JOIN codigoitens ci1 ON ci1.id = c.tipo_id
JOIN codigoitens ci2 ON ci2.id = c.categoria_id
JOIN codigoitens ci3 ON ci3.id = c.modalidade_id
WHERE tipo_fornecedor IN ('JURIDICA', 'FISICA') AND cpf_cnpj_idgener NOT LIKE 'E%' AND cpf_cnpj_idgener NOT LIKE '\_%' ESCAPE '\'
	AND vigencia_fim >= CAST(NOW() AS Date)
ORDER BY cpf_cnpj_idgener;

SELECT ;
FROM contratos;
