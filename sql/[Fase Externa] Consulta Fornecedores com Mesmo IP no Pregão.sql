/*
	1. Todas as licitações que as empresas M.A.P DOS SANTOS (CNPJ 08.830.492/0001-54) e
	AGROMOTORES MÁQUINAS E IMPLEMENTOS LTDA (CNPJ 03.881.622/0001-64)
	compartilharam os mesmos endereços de IP;
*/
SELECT DISTINCT
	  p.identificacao_participante
	, p.nome_participante
	, e.numero_uasg
	, CAST(e.numero_compra||e.ano_compra AS INTEGER) numeroano_compra
	, 'PREGÃO' modalidade
	, e.login_usuario
	, e.nome_usuario
	, e.ip_usuario
FROM
	ComprasGov_FaseExterna_VBL.participacao p
	JOIN ComprasGov_FaseExterna_VBL.evento_item e ON p.responsavel = e.login_usuario
WHERE 1=1
	AND codigo_modalidade = 5
	AND p.identificacao_participante IN ('08830492000154', '03881622000164');
;
/*
	2. Todas as licitações que as empresas M.A.P DOS SANTOS (CNPJ 08.830.492/0001-54) e
	AGROMOTORES MÁQUINAS E IMPLEMENTOS LTDA (CNPJ 03.881.622/0001-64)
	competiram no mesmo item; e
	3. Se é possível identificar eventual sobrepreço nos itens contratados.
*/
SELECT DISTINCT
	  p.identificacao_participante
	, p.nome_participante
	, c.numero_uasg
	, c.numero_compra||c.ano_compra numeroano_compra
	, 'PREGÃO' modalidade
	, i.numero_item
	, pri.quantidade_ofertada quantidade
	, UPPER(i.unidade_fornecimento) unidade_fornecimento
	, COALESCE(pri.valor_lance_calculado, pri.valor_proposta_calculado) valor_unitario
	, UPPER(i.descricao) descricao
FROM ComprasGov_FaseExterna_VBL.participacao p
	JOIN ComprasGov_FaseExterna_VBL.proposta_item pri 	ON p.id = pri.id_participacao
	JOIN ComprasGov_FaseExterna_VBL.compra c			ON c.id = p.id_compra
	JOIN ComprasGov_FaseExterna_VBL.item i 				ON pri.id_item = i.id
WHERE 1=1
	AND c.codigo_modalidade = 5
	AND i.numero_item > 0
	AND p.identificacao_participante IN ('08830492000154', '03881622000164');