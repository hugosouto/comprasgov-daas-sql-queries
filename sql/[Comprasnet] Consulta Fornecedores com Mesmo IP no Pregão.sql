/*
	1. Todas as licitações que as empresas M.A.P DOS SANTOS (CNPJ 08.830.492/0001-54) e
	AGROMOTORES MÁQUINAS E IMPLEMENTOS LTDA (CNPJ 03.881.622/0001-64)
	compartilharam os mesmos endereços de IP;
*/
SELECT DISTINCT
	  pp.prpCNPJ identificacao_participante
	, pp.prpRazaoSocial nome_participante
	, p.coduasg numero_uasg 
	, p.numprp numeroano_compra
	, 'PREGÃO' modalidade
	, COALESCE(u.CodigoAcesso, u.Login) login_usuario
	, u.Nome nome_usuario
	, l.ipUsuario ip_usuario
FROM Comprasnet_VBL.tbl_Proposta pp
JOIN Comprasnet_VBL.tbl_Pregao p 			ON pp.prgCod = p.prgCod
JOIN Comprasnet_VBL.tb_Log_PregaoFornec l 	ON pp.prpCNPJ = l.cpfCnpj
JOIN Comprasnet_VBL.tb_Usuario u 			ON l.login = u.Login
WHERE pp.prpCNPJ IN ('08830492000154', '03881622000164')
UNION
SELECT DISTINCT
	  pp.prpCNPJ identificacao_participante
	, pp.prpRazaoSocial nome_participante
	, l.coduasg numero_uasg
	, l.numprp numeroano_compra
	, 'PREGÃO' modalidade
	, COALESCE(u.CodigoAcesso, u.Login) login_usuario
	, u.Nome nome_usuario
	, l.ipUsuario ip_usuario
FROM Comprasnet_VBL.tbl_Proposta pp
JOIN Comprasnet_VBL.tb_Log_PregaoFornec_hist l 	ON pp.prpCNPJ = l.cpfCnpj
JOIN Comprasnet_VBL.tb_Usuario u 				ON l.login = u.Login
WHERE 1=1
	AND pp.prpCNPJ IN ('08830492000154', '03881622000164')
;
/*
	2. Todas as licitações que as empresas M.A.P DOS SANTOS (CNPJ 08.830.492/0001-54) e
	AGROMOTORES MÁQUINAS E IMPLEMENTOS LTDA (CNPJ 03.881.622/0001-64)
	competiram no mesmo item; e
	3. Se é possível identificar eventual sobrepreço nos itens contratados.
*/
SELECT DISTINCT
	  pp.prpCNPJ identificacao_participante
	, pp.prpRazaoSocial nome_participante
	, p.coduasg numero_uasg 
	, p.numprp numeroano_compra
	, 'PREGÃO' modalidade
	, pi.ipgItem numero_item
	, COALESCE(pri.ippQtd, pi.ipgQuantidade) quantidade
	, UPPER(pi.ipgUnidForn) unidade_fornecimento
	, CASE p.prgIndSRP 
		WHEN 'N' THEN pri.ippValor / pi.ipgQuantidade 
		ELSE pri.ippValor END valor_unitario
	, pi.ipgNomeItem
FROM Comprasnet_VBL.tbl_Pregao p
JOIN Comprasnet_VBL.tbl_pregaoitem pi 		ON p.prgCod = pi.prgCod
JOIN Comprasnet_VBL.tbl_Proposta pp 		ON p.prgCod = pp.prgCod
JOIN Comprasnet_VBL.tbl_PropostaItem pri 	ON pri.prpCod = pp.prpCod
WHERE 1=1
	AND pp.prpCNPJ IN ('08830492000154', '03881622000164')
	AND p.prgIndSRP = 'N'
	AND pi.ipgItem > 0
;