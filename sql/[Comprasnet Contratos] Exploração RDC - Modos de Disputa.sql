SELECT
	 LPAD(u.codigo, 6, 0)||'99'||REPLACE(c.licitacao_numero, '/', '') codcompra
	,COUNT(DISTINCT ch.id) aditivos
	,c.vigencia_inicio
	,c.vigencia_fim
	,CAST(SUBSTRING(c.vigencia_fim, 1, 4) AS INTEGER) - CAST(SUBSTRING(c.vigencia_inicio, 1, 4) AS INTEGER) as anos
	,c.valor_inicial
	,c.valor_global
	,c.valor_global - c.valor_inicial diferenca_valor
FROM contratos c
	JOIN contratohistorico ch ON ch.contrato_id = c.id
	JOIN unidades u ON c.unidadecompra_id = u.id
WHERE 1=1
	AND c.modalidade_id = 160
	AND ch.tipo_id = 65
--	AND c.valor_inicial != 0
--	AND c.valor_global != 0
GROUP BY 
	u.codigo,
	c.licitacao_numero,
	c.valor_inicial,
	c.valor_global,
	c.vigencia_inicio,
	c.vigencia_fim
ORDER BY 1
;

-- Consulta Heles
select 
LPAD(ucompra.codigo, 6, 0)||'99'||REPLACE(c.licitacao_numero, '/', '') codcompra,
o.codigo ||' - '|| o.nome as orgao_contrato,
u.codigo ||' - '|| u.nome as unidade_contrato,
c2.numero as contrato_numero,
c4.descricao as categoria_contrato,
ctipo.descres ||' - '||ctipo.descricao as tipo_instrumento,
c.numero as numero_instrumento,
c.data_assinatura as data_assinatura_instrumento, 
fcontrato.cpf_cnpj_idgener ||' - '|| fcontrato.nome as fornecedor_intrumento,
c.observacao as objeto_historico,
c2.vigencia_inicio as vigencia_inicio_contrato,
c2.vigencia_fim as vigencia_fim_contrato, 
c.vigencia_inicio as vigencia_inicio_instrumento,
c.vigencia_fim as vigencia_fim_instrumento, 
c2.valor_inicial,
c.valor_global as valor_instumento,
c2.valor_acumulado,
c.valor_inicial - c.valor_global,
c2.modalidade_id
from contratohistorico c 
inner join codigoitens ctipo on c.tipo_id = ctipo.id 
inner join contratos c2 on c.contrato_id = c2.id 
inner join codigoitens c3 on c2.modalidade_id = c3.id  
inner join unidades u on c2.unidade_id = u.id 
inner join orgaos o on u.orgao_id = o.id 
inner join fornecedores fcontrato ON c.fornecedor_id = fcontrato.id 
inner join codigoitens c4 on c2.categoria_id = c4.id 
join unidades ucompra on c2.unidadecompra_id = ucompra.id
left join orgaos ocompra on ucompra.orgao_id = ocompra.id 
where c3.descres = '99'
order by c2.numero,c.created_at;

c.