SELECT
c.id,
o.cnpj||'-1-'||LPAD(c.sequencialcompra, 6, 0)||'/'||c.anocompra id_contratacao,
c.anocompra,
sc.nome situacao_da_compra,  
us.nomerazaosocial sistema,
ic.nome inst_convocatorio,
md.nome modalidade,  
COUNT(ci.id) qtd_de_itens,
SUM(ci.valortotal) total_estimado,  
SUM(cir.valortotalhomologado) total_homologado,    
c.datainclusao,    
c.dataatualizacao, 
'https://pncp.gov.br/app/editais/'||o.cnpj||'/'||c.anocompra||'/'||c.sequencialcompra link,
o.cnpj,
o.razaosocial orgao,
u.codigounidade,
u.nomeunidade, 
e.nome esfera,  
p.nome poder,   
m.uf,
m.municipio,
m.codigoibge,
cir.dataresultado dt_homologacao,  
--pref_municipio,  
c.sequencialcompra,    
c.srp
FROM PNCP_VBL.compra c
JOIN PNCP_VBL.unidadeorgao u ON u.id = c.unidadeorgaoid
JOIN PNCP_VBL.orgao o ON o.id = c.orgaoid
JOIN PNCP_VBL.esfera e ON e.id = o.esferaid
JOIN PNCP_VBL.poder p ON p.id = o.poderid
JOIN PNCP_VBL.municipio m ON m.id = u.municipioid
JOIN PNCP_VBL.modalidade md ON md.id = c.modalidadeid
JOIN PNCP_VBL.tipoinstrumentoconvocatorio ic ON ic.id = c.tipoinstrumentoconvocatorioid
JOIN PNCP_VBL.situacaocompra sc ON sc.id = c.situacaocompraid
JOIN PNCP_VBL.usuario us ON us.id = c.usuarioid
JOIN PNCP_VBL.vw_compraitem ci ON ci.compraid = c.id
JOIN PNCP_VBL.compraitemresultado cir ON cir.compraitemid = ci.id
WHERE 1=1
    AND o.esferaid IN ('M', 'E')
--    AND c.datainclusao BETWEEN '2022-04-07 13:50:23' AND '2024-09-19 02:59:34'
GROUP BY c.id, o.cnpj, c.sequencialcompra, c.anocompra, sc.nome, us.nomerazaosocial, ic.nome, md.nome, c.datainclusao, c.dataatualizacao, o.razaosocial, u.codigounidade, u.nomeunidade, e.nome, p.nome, m.uf, m.municipio, m.codigoibge, c.srp, cir.dataresultado
;


--data de compra
--sistema
--id da contratação
--esfera (estadual e municipal) Pode ser um arquivo por esfera. 
--órgão
--Unidade
--modalidade
--total estimado
--total homologado
--situação da compra
--Critério de Julgamento; ainda não foi internalizado para o Painel
--porte da empresa