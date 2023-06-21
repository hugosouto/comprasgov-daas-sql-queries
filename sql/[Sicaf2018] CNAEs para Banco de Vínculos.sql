SELECT 
	fjc.id_cnae, 
	dsc_cnae,
	p.num_cpf_cnpj,
	fj.id_fornecedor_juridico,
	id_fornecedor_proprietario,
	tp_vinculo_fornecedor
FROM Sicaf2018_VBL.pessoa p
	JOIN Sicaf2018_VBL.fornecedor f 				ON p.id_pessoa = f.id_fornecedor
	JOIN Sicaf2018_VBL.fornecedor_juridico fj 		ON p.id_pessoa = fj.id_fornecedor_juridico
	JOIN Sicaf2018_VBL.fornecedor_juridico_cnae fjc	ON p.id_pessoa = fjc.id_fornecedor_juridico
	JOIN Sicaf2018_VBL.cnae c 						ON fjc.id_cnae = c.id_cnae
WHERE fjc.id_cnae BETWEEN 6200000 AND 6400000 AND tp_pessoa = 2 AND tp_vinculo_fornecedor = 1 AND fj.id_fornecedor_juridico = id_fornecedor_proprietario
ORDER BY fjc.id_cnae;


SELECT DISTINCT p.tp_vinculo_fornecedor, p.num_cpf_cnpj, p2.num_cpf_cnpj
FROM Sicaf2018_VBL.pessoa p 
	JOIN Sicaf2018_VBL.fornecedor f ON p.id_pessoa = f.id_fornecedor
	LEFT JOIN Sicaf2018_VBL.pessoa p2 	ON p.id_fornecedor_proprietario = p2.num_cpf_cnpj
--WHERE p.tp_pessoa = 2 AND p.tp_vinculo_fornecedor = 3 AND ind_ativo = 'S'
--ORDER BY id_fornecedor_proprietario DESC
;