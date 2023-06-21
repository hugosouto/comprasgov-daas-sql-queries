SELECT DISTINCT
	p.num_cpf_cnpj,
	p.nom_nome,
	CASE p.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		ELSE p.tp_vinculo_fornecedor 
		END tp_vinculo_fornecedor, 
	t.num_ddd || t.num_telefone AS num_telefone,
	p.dsc_email
FROM pessoa p  
	JOIN fornecedor f			ON p.id_pessoa = f.id_fornecedor
	INNER JOIN telefone t		ON p.id_pessoa = t.id_pessoa
WHERE p.num_cpf_cnpj IN ('')
	AND num_telefone IS NOT NULL
;

SELECT DISTINCT
	p2.num_cpf_cnpj 					cnpjfornecedor,
	p2.nom_nome							nomefornecedor,
	CASE p2.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		ELSE p1.tp_vinculo_fornecedor 
		END 							tipofornecedor,
	p2.dsc_email						emailfornecedor,
	t2.num_ddd || t2.num_telefone	 	telefonefornecedor,
	p1.num_cpf_cnpj						cpfcnpjpessoa,
	p1.nom_nome							nomepessoa,
	CASE p1.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		ELSE p1.tp_vinculo_fornecedor 
		END 							vinculo_pessoa,
	t1.num_ddd || t1.num_telefone		telefonepessoa,
	p1.dsc_email						emailpessoa
FROM pessoa p1  
	JOIN fornecedor f		ON p1.id_fornecedor_proprietario = f.id_fornecedor
	JOIN pessoa p2			ON f.id_fornecedor = p2.id_pessoa
	JOIN telefone t1		ON p1.id_pessoa = t1.id_pessoa
	JOIN telefone t2		ON p2.id_pessoa = t2.id_pessoa
WHERE p2.num_cpf_cnpj IN ('')
	AND t1.num_telefone IS NOT NULL AND t2.num_telefone IS NOT NULL
;

SELECT DISTINCT
	p.num_cpf_cnpj 					cnpj,
	p.nom_nome						razaosocial,
	CASE p.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		ELSE p.tp_vinculo_fornecedor 
		END 						vinculo,
	p.dsc_email						email,
	t.num_ddd || t.num_telefone		telefone,
	r.nom_nome						nomeresponsavelcadastro,
	r.dsc_email						emailresponsavelcadastro
FROM pessoa p  
	JOIN telefone t					ON p.id_pessoa = t.id_pessoa
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro= r.id_responsavel_cadastro
WHERE p.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL AND t.num_telefone IS NOT NULL;

-------------------------------------------------------------------

SELECT DISTINCT
	LPAD(p.num_cpf_cnpj,14,0)		cnpj,
	p.nom_nome						razaosocial,
	'Respons�vel pelo Cadastro'		vinculo,
	r.nom_nome						contato,
	LOWER(p.dsc_email)				email,
	'('||t.num_ddd||') '||t.num_telefone	telefone
FROM pessoa p  
	JOIN telefone t					ON p.id_pessoa = t.id_pessoa
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
WHERE p.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL AND t.num_telefone IS NOT NULL
UNION
SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)		cnpj,
	p2.nom_nome						razaosocial,
	CASE p2.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE p.tp_vinculo_fornecedor 
		END 						vinculo,
	p.nom_nome						contato,
	LOWER(p.dsc_email)				email,
	'('||t.num_ddd||') '||t.num_telefone	telefone
FROM pessoa p
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN pessoa p2					ON fj.id_pessoa_juridica = p2.id_pessoa
	JOIN telefone t					ON p.id_pessoa = t.id_pessoa
WHERE p.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL AND t.num_telefone IS NOT NULL
ORDER BY cnpj
;

------------------------------------------------------------------- 

SELECT DISTINCT
	LPAD(p.num_cpf_cnpj,14,0)		cnpj,
	p.nom_nome						razaosocial,
	'Respons�vel pelo Cadastro'		vinculo,
	r.nom_nome						nomecontato,
	'Email'							tipocontato,
	LOWER(p.dsc_email)				contato
FROM pessoa p  
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
WHERE p.num_cpf_cnpj IN ('')
UNION
SELECT DISTINCT
	LPAD(p.num_cpf_cnpj,14,0)				cnpj,
	p.nom_nome								razaosocial,
	'Respons�vel pelo Cadastro'				vinculo,
	r.nom_nome								nomecontato,
	'Telefone'								tipocontato,
	'('||t.num_ddd||') '||t.num_telefone	contato
FROM pessoa p  
	JOIN telefone t					ON p.id_pessoa = t.id_pessoa
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
WHERE p.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL AND t.num_telefone IS NOT NULL
UNION
SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)		cnpj,
	p2.nom_nome						razaosocial,
	CASE p2.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE p.tp_vinculo_fornecedor 
		END 						vinculo,
	p.nom_nome						nomecontato,
	'Email'							tipocontato,
	LOWER(p.dsc_email)				contato
FROM pessoa p
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN pessoa p2					ON fj.id_pessoa_juridica = p2.id_pessoa
WHERE p.num_cpf_cnpj IN ('')
UNION
SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)		cnpj,
	p2.nom_nome						razaosocial,
	CASE p2.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE p.tp_vinculo_fornecedor 
		END 								vinculo,
	p.nom_nome								nomecontato,
	'Telefone'								tipocontato,
	'('||t.num_ddd||') '||t.num_telefone	contato
FROM pessoa p
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN pessoa p2					ON fj.id_pessoa_juridica = p2.id_pessoa
	JOIN telefone t					ON p.id_pessoa = t.id_pessoa
WHERE p.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL AND t.num_telefone IS NOT NULL
ORDER BY cnpj, vinculo, nomecontato, tipocontato
;

------------------------------------------------------------------- 

SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)		cnpj,
	p2.nom_nome						razaosocial,
	p.tp_vinculo_fornecedor,
	CASE p2.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE p.tp_vinculo_fornecedor 
		END 						vinculo,
	p.nom_nome						nomecontato,
	'Email'							tipocontato,
	LOWER(p.dsc_email)				contato,
	r.nom_nome						responsavelcadastro
FROM pessoa p
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
	JOIN pessoa p2					ON fj.id_pessoa_juridica = p2.id_pessoa
WHERE p.num_cpf_cnpj IN ('')
UNION
SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)		cnpj,
	p2.nom_nome						razaosocial,
	p.tp_vinculo_fornecedor,
	CASE p.tp_vinculo_fornecedor
		WHEN 1 THEN 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE p.tp_vinculo_fornecedor 
		END 								vinculo,
	p.nom_nome								nomecontato,
	'Telefone'								tipocontato,
	'('||t.num_ddd||') '||t.num_telefone	contato,
	r.nom_nome								responsavelcadastro
FROM pessoa p
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
	JOIN pessoa p2					ON fj.id_pessoa_juridica = p2.id_pessoa
	JOIN telefone t					ON p.id_pessoa = t.id_pessoa
WHERE p2.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL AND t.num_telefone IS NOT NULL
ORDER BY cnpj, vinculo, nomecontato, tipocontato
;

------------------------------------------------------------------- 

SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)				cnpj,
	p2.nom_nome								razaosocial,
	CASE p.tp_vinculo_fornecedor 
		WHEN 1 THEN r.nom_nome
		ELSE p.nom_nome END					nomecontato,
	CASE p.tp_vinculo_fornecedor
		WHEN 1 THEN 'Respons�vel pelo Cadastro' -- 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE p2.tp_vinculo_fornecedor 
		END 								vinculo,
	'Email'									tipocontato,
	LOWER(p.dsc_email)						contato
FROM pessoa p
	JOIN pessoa p2					ON p.id_fornecedor_proprietario = p2.id_fornecedor_proprietario
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
WHERE p2.num_cpf_cnpj IN ('')
	AND p.dsc_email IS NOT NULL
UNION
SELECT DISTINCT
	LPAD(p2.num_cpf_cnpj,14,0)				cnpj,
	p2.nom_nome								razaosocial,
	CASE MAX(p.tp_vinculo_fornecedor) 
		WHEN 1 THEN MAX(r.nom_nome)
		ELSE MAX(p.nom_nome) END			nomecontato,
	CASE MAX(p.tp_vinculo_fornecedor)
		WHEN 1 THEN 'Respons�vel pelo Cadastro' -- 'Fornecedor'
		WHEN 3 THEN 'Sócio'
		WHEN 4 THEN 'Dirigente'
		WHEN 7 THEN 'Sócio e Dirigente'
		WHEN 8 THEN 'Sócio e Fornecedor'
		WHEN 9 THEN 'Representante Legal'
		WHEN 10 THEN 'Responsavel Legal'
		WHEN 11 THEN 'Cônjuge do Dirigente'
		WHEN 12 THEN 'Sócio/Admin e Respons�vel Legal'
		ELSE MAX(p.tp_vinculo_fornecedor) 
		END 								vinculo,
	'Telefone'								tipocontato,
	'('||t.num_ddd||') '||t.num_telefone 	contato
FROM pessoa p
	JOIN pessoa p2					ON p.id_fornecedor_proprietario = p2.id_fornecedor_proprietario
	JOIN fornecedor_juridico fj		ON p.id_fornecedor_proprietario = fj.id_pessoa_juridica
	JOIN responsavel_cadastro r		ON fj.id_responsavel_cadastro = r.id_responsavel_cadastro
	JOIN telefone t					ON p2.id_pessoa = t.id_pessoa
WHERE p2.num_cpf_cnpj IN ('')
	AND t.num_telefone IS NOT NULL
GROUP BY t.num_telefone, p2.num_cpf_cnpj, p2.nom_nome, t.num_ddd
ORDER BY cnpj, nomecontato, vinculo, tipocontato