
------ JSON aninhado dos PGCs

SELECT
	cnpj,
	p.codigoUnidade,
	anoPca,
	numeroItem 					AS 'numeroItem',
	categoriaItemPca			AS 'categoriaItemPca',
	catalogo 					AS 'catalogo',
	classificacaoCatalogo		AS 'classificacaoCatalogo',
	codigoCatalogo				AS 'codigoCatalogo',
	descricao					AS 'descricao',
	unidadeFornecimento			AS 'unidadeFornecimento',
	quantidade					AS 'quantidade',
	valorUnitario				AS 'valorUnitario',
	valorTotal					AS 'valorTotal',
	valorOrcamentoExercicio		AS 'valorOrcamentoExercicio',
	renovacaoContrato			AS 'renovacaoContrato',
	dataDesejada				AS 'dataDesejada',
	unidadeRequisitante			AS 'unidadeRequisitante',
	grupoContratacaoCodigo		AS 'grupoContratacaoCodigo',
	grupoContratacaoNome		AS 'grupoContratacaoNome'
FROM seges_delog_cgscg_stage.pgc.pgc p
LEFT JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.codigoUnidade = u.codigounidade
FOR JSON PATH;

------ JSON dos dos itens dos PGCs

SELECT
	numeroItem 					numeroItem,
	categoriaItemPca			categoriaItemPca,
	catalogo 					catalogo,
	classificacaoCatalogo		classificacaoCatalogo,
	codigoCatalogo				codigoCatalogo,
	descricao					descricao,
	unidadeFornecimento			unidadeFornecimento,
	quantidade					quantidade,
	valorUnitario				valorUnitario,
	valorTotal					valorTotal,
	valorOrcamentoExercicio		valorOrcamentoExercicio,
	renovacaoContrato			renovacaoContrato,
	dataDesejada				dataDesejada,
	unidadeRequisitante			unidadeRequisitante,
	grupoContratacaoCodigo		grupoContratacaoCodigo,
	grupoContratacaoNome		grupoContratacaoNome
FROM seges_delog_cgscg_stage.pgc.pgc p
LEFT JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.codigoUnidade = u.codigounidade
FOR JSON PATH;

------ Table dos PGCs

SELECT DISTINCT
	chavepca					AS 'chavepca',
	cnpj						AS 'unidadecnpjorgao',
	unidadecodigo				AS 'unidadecodigo',
	anopca						AS 'anopca'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade;

------ Table dos Itens de PGC (ANTIGO)

SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	codigoitem					AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO 
												AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
;

------ Table dos Itens de PGC (NOVO)

SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	codigoitem					AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
JOIN seges_delog_cgscg_stage.catalogo.catalogo c 
--	ON ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN (catalogo.fn_StripCharacters(DS_ITCP_PADRAO_DESC_MAT, '^a-z') LIKE ('%' + SUBSTRING(UPPER(pgc.fn_StripCharacters(descricao, '^a-z')),1,20) + '%'))
	ON ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN SUBSTRING(catalogo.fn_StripCharacters(DS_ITCP_PADRAO_DESC_MAT, '^a-z'),1,30) = SUBSTRING(UPPER(pgc.fn_StripCharacters(descricao, '^a-z')),1,30) --  AND codigoitem > 28000
--											   (catalogo.fn_StripCharacters(DS_ITCP_PADRAO_DESC_MAT, '^a-z') NOT LIKE ('%' + SUBSTRING(UPPER(pgc.fn_StripCharacters(descricao, '^a-z')),1,20) + '%') ))
											 THEN 1 ELSE 2 END
   AND ID_ITCP_MATERIAL_SERVICO = codigoitem
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NOT NULL
;

---------

SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	codigoitem					AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c 
	ON ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN SUBSTRING(UPPER(pgc.fn_StripCharacters(descricao, '^a-z')),1,20)  
											 = SUBSTRING(catalogo.fn_StripCharacters(DS_ITCP_PADRAO_DESC_MAT, '^a-z'),1,20) THEN 1 ELSE 2 END
--											 (b.FullName LIKE '%' + a.Name + '%' OR a.Name like '%' + b.FullName + '%')
									AND ID_ITCP_MATERIAL_SERVICO = codigoitem
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NULL

--
SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	codigoitem					AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c 
	ON ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(descricao,
		' ',''),'´',''),'"',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9',''),'0','') -- ,'','') 
		= REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(DS_ITCP_PADRAO_DESC_MAT,
		' ',''),'´',''),'"',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9',''),'0','') THEN 1 ELSE 2 END
									AND ID_ITCP_MATERIAL_SERVICO = codigoitem
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NULL
;

p.descricao = c.DS_ITCP_PADRAO_DESC_MAT THEN (p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO AND c.ID_ITCP_TP_MATERIAL_SERVICO = 1)
															  ELSE (codigoitem = ID_ITCP_MATERIAL_SERVICO AND ID_ITCP_TP_MATERIAL_SERVICO = 2) END
															  
															  AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
;
														
(CONCAT('1', RIGHT(REPLICATE('0', 10) + ID_ITCP_TP_COD_MAT_SERV, 10))) END

AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
;

SELECT (CONCAT('1', RIGHT(REPLICATE('0', 9) + CAST(ID_ITCP_MATERIAL_SERVICO AS VARCHAR(10)), 9)))
FROM seges_delog_cgscg_stage.catalogo.catalogo;

------ Analise dos itens não localizados no catálogo

SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	CAST(codigoitem AS INT)		AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO 
												AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NULL
ORDER BY codigoitem
;

------------------------ UNION
SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	CAST(codigoitem AS INT)		AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.descricao = c.DS_ITCP_PADRAO_DESC_MAT
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO 
												AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NULL
;
UNION
;
SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	CAST(codigoitem AS INT)		AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.descricao = (CONCAT('1', RIGHT(REPLICATE('0', 9) + CAST(ID_ITCP_MATERIAL_SERVICO AS VARCHAR(10)), 9)))

--ORDER BY codigoitem
;
------------------------

SELECT DISTINCT
	chavepcaitem				AS 'chavepcaitem',
	chavepca					AS 'chavepca',
	numeroitem 					AS 'numeroitem',
	categoriaitempcaid			AS 'categoriaitempcaid',
	catalogoid 					AS 'catalogoid',
	CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS 'classificacaosuperiorcodigo',
	DS_ITCP_CLASSE_MAT_SERV0	AS 'classificacaosuperiornome',
	CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE '   -9' THEN 0 ELSE ID_ITCP_PADRAO_DESC_MAT END AS 'pdmcodigo',
	DS_ITCP_PADRAO_DESC_MAT		AS 'pdmdescricao',
	CASE WHEN classificacaocatalogoid = 3 THEN 1
		 WHEN classificacaocatalogoid = 5 THEN 2 END 
		 						AS 'classificacaocatalogoid',
	CAST(codigoitem AS INT)		AS 'codigoitem',
	UPPER(descricao)			AS 'descricao',
	unidadefornecimento			AS 'unidadefornecimento',
	quantidade					AS 'quantidade',
	valorunitario				AS 'valorunitario',
	valortotal					AS 'valortotal',
	valororcamentoexercicio		AS 'valororcamentoexercicio',
	CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS 'renovacaocontrato',
	unidaderequisitante			AS 'unidaderequisitante',
	datadesejada				AS 'datadesejada',
	grupocontratacaocodigo		AS 'grupocontratacaocodigo',
	grupocontratacaonome		AS 'grupocontratacaonome'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO 
												AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NULL
ORDER BY codigoitem

------------------------
SELECT DISTINCT
	CAST(codigoitem AS INT)					AS 'codigoitem',
	UPPER(descricao)			AS 'descricao'
FROM seges_delog_cgscg_stage.pgc.pgc p
JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN seges_delog_cgscg_stage.catalogo.catalogo c ON p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO 
												AND c.ID_ITCP_TP_MATERIAL_SERVICO = CASE WHEN classificacaocatalogoid = 3 THEN 1 WHEN classificacaocatalogoid = 5 THEN 2 END
WHERE c.ID_ITCP_MATERIAL_SERVICO IS NULL
ORDER BY codigoitem
;
------

WITH temp AS (
SELECT p.codigoUnidade, COUNT(DISTINCT numeroItem) AS conta_numeroItem
FROM seges_delog_cgscg_stage.pgc.pgc2 p
LEFT JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.codigoUnidade = u.codigounidade
GROUP BY p.codigoUnidade, anoPca
)
SELECT codigoUnidade, AVG(conta_numeroItem) AS conta_itens
FROM temp
GROUP BY codigoUnidade
ORDER BY conta_itens DESC;

SELECT p.codigoUnidade, MAX(numeroItem)
FROM seges_delog_cgscg_stage.pgc.pgc2 p
LEFT JOIN seges_delog_cgscg_stage.pgc.uasgs_cnpjs u ON p.codigoUnidade = u.codigounidade
GROUP BY p.codigoUnidade;