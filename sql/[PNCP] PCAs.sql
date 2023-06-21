SELECT
	o.cnpj,
	o.razaosocial "orgão",
	un.codigounidade "código uasg",
	un.nomeunidade uasg,
	pl.anopca,
	pl.sequencialpca,
	ipl.numeroitem,
	cat.nome as categoria,
	ipl.descricao,
	ipl.unidadefornecimento,
	ipl.quantidade,
	ipl.valorunitario,
	ipl.valortotal,
	ipl.grupocontratacaonome,
	CASE
		WHEN ipl.classificacaocatalogoid = 1 THEN 'Material'
		ELSE 'Serviço'
	END classificacaoCatalogo,
	ipl.classificacaosuperiornome,
	ipl.pdmcodigo,
	ipl.pdmdescricao,
	ipl.codigoitem
FROM
	PNCP_VBL.planocontratacao pl
	INNER JOIN PNCP_VBL.orgao o ON
		o.id = pl.orgaoid
	INNER JOIN PNCP_VBL.unidadeorgao un ON
		pl.unidadeorgaoid = un.id
	INNER JOIN PNCP_VBL.planocontratacaoitem ipl ON
		ipl.planocontratacaoid = pl.id
	INNER JOIN PNCP_VBL.categoria cat ON
		ipl.categoriaitempcaid = cat.id
WHERE
	pl.anopca = 2023
	and pl.excluido = 0
	and ipl.excluido = 0