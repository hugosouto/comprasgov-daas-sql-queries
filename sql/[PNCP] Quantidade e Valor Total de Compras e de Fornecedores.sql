--QT DE COMPRAS HOMOLOGADAS
SELECT 
	 COUNT(DISTINCT c.id) qt_contratacoes
	,COUNT(DISTINCT cir.fornecedorid) qt_fornecedores
	,COUNT(DISTINCT f.nifornecedor) qt_fornecedores
	,SUM(cir.valorunitariohomologado * cir.quantidadehomologada) total_homologado
	,SUBSTR(cir.datainclusao,1,4) ano
	,m.nome modalidade
FROM PNCP.PNCP_VBL.compra c
	INNER JOIN PNCP.PNCP_VBL.vw_compraitem ci 			ON c.id = ci.compraid 
	INNER JOIN PNCP.PNCP_VBL.compraitemresultado cir	ON ci.id = cir.compraitemid
	INNER JOIN PNCP_VBL.fornecedor f					ON cir.fornecedorid = f.id
	INNER JOIN PNCP.PNCP_VBL.modalidade m				ON c.modalidadeid = m.id
WHERE c.excluido = 0 AND c.usuarioid = 3 and cir.situacaocompraitemresultadoid = 1
GROUP BY  m.nome, SUBSTR(cir.datainclusao,1,4)
;

-- Fornecedores com pelo menos uma compra homologada no ano 
SELECT
	 SUBSTR(cir.datainclusao,1,4) ano
	,COUNT(DISTINCT cir.fornecedorid) qt_fornecedores
FROM PNCP.PNCP_VBL.compra c
	INNER JOIN PNCP.PNCP_VBL.vw_compraitem ci 			ON c.id = ci.compraid 
	INNER JOIN PNCP.PNCP_VBL.compraitemresultado cir	ON ci.id = cir.compraitemid
	INNER JOIN PNCP_VBL.fornecedor f					ON cir.fornecedorid = f.id
WHERE c.excluido = 0 AND c.usuarioid = 3 and cir.situacaocompraitemresultadoid = 1
GROUP BY SUBSTR(cir.datainclusao,1,4)
;

-- Compras homologadas pela 14.133/2021 
SELECT
	 SUBSTR(cir.datainclusao,1,4) ano
	,COUNT(DISTINCT c.id) qt_contratacoes
FROM PNCP.PNCP_VBL.compra c
	INNER JOIN PNCP.PNCP_VBL.vw_compraitem ci 			ON c.id = ci.compraid 
	INNER JOIN PNCP.PNCP_VBL.compraitemresultado cir	ON ci.id = cir.compraitemid
WHERE c.excluido = 0 AND c.usuarioid = 3 and cir.situacaocompraitemresultadoid = 1
GROUP BY SUBSTR(cir.datainclusao,1,4)
;

--QT DE COMPRAS DIVULGADAS
SELECT 
	COUNT(DISTINCT c.id) qt_contratacoes,
	SUBSTR(c.datainclusao,1,4) ano
FROM PNCP.PNCP_VBL.compra c
WHERE c.excluido = 0 AND c.usuarioid = 3 
GROUP BY SUBSTR(c.datainclusao,1,4)
;

--QT DE FORNECEDORS POR COMPRA
SELECT 
o.cnpj||'-1-'||LPAD(c.sequencialcompra,6,0)||'/'||c.anocompra AS id_contratacao,
COUNT (DISTINCT r.fornecedorid) qt_fornecedores
FROM PNCP.PNCP_VBL.compra c
INNER JOIN PNCP.PNCP_VBL.vw_compraitem i 
ON c.id = i.compraid 
INNER JOIN PNCP.PNCP_VBL.compraitemresultado r
ON i.id = r.compraitemid 
INNER JOIN PNCP.PNCP_VBL.modalidade m
ON c.modalidadeid = m.id 
INNER JOIN PNCP_VBL.orgao o
ON c.orgaoid = o.id
WHERE c.excluido = 0 AND 
c.modalidadeid = 9 and
c.usuarioid = 3 and
SUBSTR(c.datainclusao,1,4)='2022' and
r.situacaocompraitemresultadoid = 1
GROUP BY o.cnpj||'-1-'||LPAD(c.sequencialcompra,6,0)||'/'||c.anocompra
;