SELECT DISTINCT
    chavepcaitem                AS chavepcaitem,
    chavepca                    AS chavepca,
    numeroitem                     AS numeroitem,
    categoriaitempcaid            AS categoriaitempcaid,
    catalogoid                     AS catalogoid,
    CASE WHEN DS_ITCP_CLASSE_MAT_SERV = -7 THEN 0 ELSE DS_ITCP_CLASSE_MAT_SERV END AS classificacaosuperiorcodigo,
    CASE WHEN DS_ITCP_CLASSE_MAT_SERV0 = 'INVALIDO' THEN 'OUTROS' ELSE DS_ITCP_CLASSE_MAT_SERV0 END AS classificacaosuperiornome,
    CASE WHEN ID_ITCP_PADRAO_DESC_MAT LIKE ('   -9') THEN '0' ELSE ID_ITCP_PADRAO_DESC_MAT END AS pdmcodigo,
    DS_ITCP_PADRAO_DESC_MAT        AS pdmdescricao,
    classificacaocatalogoid 		AS classificacaocatalogoid,
    codigoitem                    AS codigoitem,
    UPPER(descricao)            AS descricao,
    unidadefornecimento            AS unidadefornecimento,
    quantidade                    AS quantidade,
    valorunitario                AS valorunitario,
    valortotal                    AS valortotal,
    valororcamentoexercicio        AS valororcamentoexercicio,
    CASE WHEN renovacaocontrato LIKE 'true' THEN 'true' ELSE 'false' END AS renovacaocontrato,
    unidaderequisitante            AS unidaderequisitante,
    datadesejada                AS datadesejada,
    grupocontratacaocodigo        AS grupocontratacaocodigo,
    grupocontratacaonome        AS grupocontratacaonome
FROM itens_resultado p
INNER JOIN uasgs_cnpjs u ON p.unidadecodigo = u.codigounidade
LEFT JOIN catalogo_pgc c ON p.codigoitem = c.ID_ITCP_MATERIAL_SERVICO
                                AND c.ID_ITCP_TP_MATERIAL_SERVICO = classificacaocatalogoid
where p.situacao in ('EN','EL');

------

SELECT
	CONCAT(i.id_plano_anual, LPAD(i.id_uasg,6,0))						chavepca,
	u.uasg																unidadecodigo,
	pa.ano																anopca,
	CONCAT(i.id_plano_anual, LPAD(i.id_uasg,6,0), LPAD(i.id,9,0))	 	chavepcaitem,
	i.numeroitem														numeroitem,
	CASE WHEN i.tipo_item = 'M' THEN 1
		 WHEN i.tipo_item = 'S' THEN 2
		 WHEN i.tipo_item = 'O' THEN 3
		 WHEN i.tipo_item = 'E' THEN 4
		 WHEN i.tipo_item = 'T' THEN 5
		 END															categoriaitempcaid,
	1																	catalogoid,
	CASE WHEN i.id_sub_item IN (5,6,10) OR i.tipo_item = 'M' THEN 3 	-- Material
		 WHEN i.tipo_item = 'T' AND id_sub_item IS NULL AND codigoitem > 28000 THEN 3
		 WHEN i.id_sub_item IN (7,8,9,11) THEN 5 						-- Serviço
		 WHEN i.id_sub_item IS NULL AND i.tipo_item != 'M' THEN 5		-- Serviço
		 WHEN i.tipo_item = 'T' AND id_sub_item IS NULL AND codigoitem < 28000 THEN 5
		 END 															classificacaocatalogoid,
	i.codigo_item 														codigoitem, 
	SUBSTRING(i.descricao,1,2048)										descricao,
	SUBSTRING(i.descricao_detalhada,1,2048)								descricaodetalhada, 
	LTRIM(i.unidade_fornecimento)										unidadefornecimento,
	i.quantidade_total													quantidade, 
	i.valor_unitario													valorunitario,
	i.valor_total														valortotal,
	IF(i.valor_orcamentario IS NULL, 0, i.valor_orcamentario) 			valororcamentoexercicio,
	CASE WHEN i.renovacao_contrato = 1 THEN "true"
		 WHEN i.renovacao_contrato = 0 THEN "false"
		 ELSE i.renovacao_contrato END									renovacaocontrato,
	SUBSTRING(i.unidade_responsavel,1,100)								unidaderequisitante,
	DATE(i.periodo_estimado)											datadesejada,
	i.id_grupo															grupocontratacaocodigo,
	g.nome																grupocontratacaonome,
	MAX(h.updated_at) 													situacao_updated_at
FROM pgc.itens i
	JOIN pgc.uasgs  u ON i.id_uasg = u.id
	JOIN pgc.planos_anuais pa ON pa.id = i.id_plano_anual
	LEFT JOIN pgc.grupos g ON g.id = i.id_grupo
	JOIN pgc.historico_tramitacoes h ON h.id_item = i.id
WHERE
-- 	classificacaocatalogoid IS NULL AND
-- 	(h.situacao LIKE ('EN') OR h.situacao LIKE ('EL'))	
-- 	AND
-- 	i.id_uasg = 3797
-- 	AND
	i.id_plano_anual = 6
GROUP BY i.id
;