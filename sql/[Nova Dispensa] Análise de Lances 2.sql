--Quantidade de dispensas e itens abertos hoje
with qtd_itens_abertos_hoje as (
	select
		di.numero_uasg, 
		di.codigo_modalidade, 
		di.numero_compra, 
		di.ano_compra, 
		count(*) as qtde
	from
		Comprasnet_sala_disputa_VBL.disputa_item as di 
		inner join Comprasnet_sala_disputa_VBL.rodada_disputa_item as rdi
			on di.id_rodada = rdi.id 
	where 
		di.codigo_modalidade = 6
		and di.data_hora_abertura_lances > '2022-09-26 00:00:00'
	group by
		di.numero_uasg, di.codigo_modalidade, di.numero_compra, di.ano_compra
)
select
	count(*) as qtde_compras,
	sum(qtde) as qtde_itens
from
	qtd_itens_abertos_hoje;

	
--Quantidade de lances via app;
--Quantidade de lances vencedores via app nos itens encerrados até as 14 horas.
with numeros_por_participante_item as (
	select
		di.numero_uasg,
		di.codigo_modalidade,
		di.numero_compra,
		di.ano_compra,
		di.numero_item,
		pdi.id,
		count(*) as qtde_lances_app,
		sum(case when di.melhor_valor_calculado = l.valor_calculado and di.situacao_disputa_item <> 'E' then 1 else 0 end) as qtde_melhores_lances,
		sum(case when di.melhor_valor_calculado = l.valor_calculado and di.situacao_disputa_item = 'E' then 1 else 0 end) as lance_app_vencedor
	from
		Comprasnet_sala_disputa_VBL.disputa_item as di 
		inner join Comprasnet_sala_disputa_VBL.rodada_disputa_item as rdi
			on di.id_rodada = rdi.id 
		inner join Comprasnet_sala_disputa_VBL.participacao_disputa_item as pdi 
			on di.id = pdi.id_disputa_item
		inner join Comprasnet_sala_disputa_VBL.lance as l
			on pdi.id = l.id_participacao_disputa_item 
			and l.origem_sessao_usuario = 'A'
	where 
		di.codigo_modalidade = 6
		and di.data_hora_abertura_lances > '2022-09-26 00:00:00'
	group by
		di.numero_uasg,
		di.codigo_modalidade,
		di.numero_compra,
		di.ano_compra,
		di.numero_item,
		pdi.id
), numeros_por_item as (
	select 
		numero_uasg,
		codigo_modalidade,
		numero_compra,
		ano_compra,
		numero_item,
		count(*) as qtde_participantes_que_usaram_app,
		sum(qtde_lances_app) as qtde_lances_app,
		sum(qtde_melhores_lances) as qtde_melhores_lances,
		sum(lance_app_vencedor) as lance_app_vencedor
	from 
		numeros_por_participante_item
	group by
		numero_uasg,
		codigo_modalidade,
		numero_compra,
		ano_compra,
		numero_item
), numeros_por_compra as (
	select 
		numero_uasg,
		codigo_modalidade,
		numero_compra,
		ano_compra,
		count(*) as qtde_itens,
		sum(qtde_lances_app) as qtde_lances_app,
		sum(qtde_melhores_lances) as qtde_melhores_lances,
		sum(lance_app_vencedor) as lance_app_vencedor
	from
		numeros_por_item
	group by
		numero_uasg,
		codigo_modalidade,
		numero_compra,
		ano_compra
)
select 
	count(*) as qtde_compras,
	sum(qtde_itens) as qtde_itens,
	sum(qtde_lances_app) as qtd_lances_app,
	sum(qtde_melhores_lances) as qtde_lances_app_vencendo,
	sum(lance_app_vencedor) as qtd_lances_app_vencedores
from 
	numeros_por_compra;


--quem são os vencedores
with numeros_por_participante_item as (
	select
		di.numero_uasg,
		di.codigo_modalidade,
		di.numero_compra,
		di.ano_compra,
		di.numero_item,
		di.situacao_disputa_item,
		pdi.tipo_participante,
		pdi.identificacao_participante,
		count(*) as qtde_lances_app,
		sum(case when di.melhor_valor_calculado = l.valor_calculado and di.situacao_disputa_item <> 'E' then 1 else 0 end) as qtde_melhores_lances,
		sum(case when di.melhor_valor_calculado = l.valor_calculado and di.situacao_disputa_item = 'E' then 1 else 0 end) as lance_app_vencedor
	from
		Comprasnet_sala_disputa_VBL.disputa_item as di 
		inner join Comprasnet_sala_disputa_VBL.rodada_disputa_item as rdi
			on di.id_rodada = rdi.id 
		inner join Comprasnet_sala_disputa_VBL.participacao_disputa_item as pdi 
			on di.id = pdi.id_disputa_item
		inner join Comprasnet_sala_disputa_VBL.lance as l
			on pdi.id = l.id_participacao_disputa_item 
			and l.origem_sessao_usuario = 'A'
	where 
		di.codigo_modalidade = 6
		and di.data_hora_abertura_lances > '2022-09-26 00:00:00'
	group by
		di.numero_uasg,
		di.codigo_modalidade,
		di.numero_compra,
		di.ano_compra,
		di.numero_item,
		di.situacao_disputa_item,
		pdi.tipo_participante,
		pdi.identificacao_participante
)select * from numeros_por_participante_item;
