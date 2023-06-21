WITH 
total_hom AS ( SELECT it.compraid, 
                      Sum(r.valortotalhomologado) totalh
               FROM Stg_Pncp.pncp.compraitem it 
               Inner join Stg_Pncp.pncp.compraitemresultado r 
               On r.compraitemid = it.id 
               where r.situacaocompraitemresultadoid  = 1
               GROUP BY it.compraid                           
), temp2 AS (
			   SELECT it.compraid,
			   		  count(DISTINCT it.id) "qtd de itens",
                      Sum(it.valortotal) "total estimado"
               FROM Stg_Pncp.pncp.compraitem it
               GROUP BY it.compraid 
)
SELECT
	c.id,
	CONCAT(o.cnpj,'-1-',RIGHT(REPLICATE('0', 6) + RTRIM(c.sequencialcompra),6),'/',c.anocompra) AS id_contratacao,
	c.anocompra,
	sit.nome "situação da compra",
	us.nomerazaosocial sistema,
	ins.nome "inst convocatório",
	d.nome modalidade,
	t2.[qtd de itens],
	t2.[total estimado],
	th.totalh as "total homologado",
	c.datainclusao,
	c.dataatualizacao,
	CONCAT('https://pncp.gov.br/app/editais/',o.cnpj,'/',c.anocompra,'/',c.sequencialcompra) as link,
	o.cnpj,
	o.razaosocial orgao,
	un.codigounidade,
	un.nomeunidade,
	es.nome as esfera,
	po.nome poder,
	mu.uf,
	mu.municipio
FROM Stg_Pncp.pncp.compra c
	Inner join Stg_Pncp.pncp.usuario us
	ON us.id = c.usuarioid
	Inner join Stg_Pncp.pncp.orgao o
	ON  o.id = c.orgaoid
	Inner join Stg_Pncp.pncp.unidadeorgao un
	ON un.id = c.unidadeorgaoid
	Inner join Stg_Pncp.pncp.municipio mu
	ON un.municipioid = mu.id
	Inner join Stg_Pncp.pncp.amparolegal am
	ON am.id = c.amparolegalid
	Inner join Stg_Pncp.pncp.compraitem it 
	On it.compraid = c.id
	left join total_hom th
	On th.compraid = c.id
	left join temp2 t2
	On t2.compraid = c.id
	Inner join Stg_Pncp.pncp.tipoinstrumentoconvocatorio ins
	ON ins.id = c.tipoinstrumentoconvocatorioid  
	Inner join Stg_Pncp.pncp.modalidade d
	ON d.id = c.modalidadeid 
	Inner join Stg_Pncp.pncp.situacaocompra sit
	ON sit.id = c.situacaocompraid 
	Inner join Stg_Pncp.pncp.esfera es
	ON es.id = o.esferaid  
	Inner join Stg_Pncp.pncp.poder  po
	ON po.id = o.poderid
WHERE 
c.excluido = 0 --and c.id in (35717)
GROUP BY c.id, 
	CONCAT(o.cnpj,'-1-',RIGHT(REPLICATE('0', 6) + RTRIM(c.sequencialcompra),6),'/',c.anocompra),
	c.anocompra,
	sit.nome, 
	us.nomerazaosocial,
	ins.nome,
	d.nome,
	th.totalh,
	c.datainclusao,
	c.dataatualizacao,
	o.cnpj,c.sequencialcompra,
	o.cnpj,
	o.razaosocial,
	un.codigounidade,
	un.nomeunidade,
	es.nome,
	po.nome,
	mu.uf,
	mu.municipio,
	t2.[qtd de itens],
	t2.[total estimado]
ORDER BY c.id
