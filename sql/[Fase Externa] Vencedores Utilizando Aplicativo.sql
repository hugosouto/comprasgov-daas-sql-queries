with vencedores_app_com_proposta as (
	select
		'proposta' as ganhou_via_app_com,
		i.numero_uasg,
		i.codigo_modalidade,
		i.numero_compra,
		i.ano_compra,
		i.numero_item,
		p.tipo_participante,
		p.identificacao_participante
	from ComprasGov_FaseExterna_VBL.compra as c
		inner join ComprasGov_FaseExterna_VBL.item as i
			on c.numero_uasg = i.numero_uasg
			and c.codigo_modalidade = i.codigo_modalidade
			and c.numero_compra = i.numero_compra
			and c.ano_compra = i.ano_compra
		inner join ComprasGov_FaseExterna_VBL.proposta_item as p_i
			on i.id = p_i.id_item
			and p_i.situacao = '6' --amarra apenas com fornecedores adjudicados
			and p_i.origem_melhor_valor = 'P' --pega os fornecedores que ganharam apenas com a proposta
			and p_i.origem_sessao_usuario = 'A' --cuja proposta foi feita via app
		inner join ComprasGov_FaseExterna_VBL.participacao as p
			on p_i.id_participacao = p.id
	where 
		c.codigo_modalidade = 6 --filtra apenas dispensas
		and i.situacao = '1' --apenas itens ativos (desconsidera itens cancelados, anulados, revogados, fracassados, desertos e suspensos)
		and i.homologado = 'S' --já amarra o retorno somente com os itens homologados (para garantir que está pegando o fornecedor vencedor)
		and c.data_hora_abertura_sp between '2022-12-01 00:00:00' and '2022-12-10 23:59:59' --lembrando que 2022-09-26 00:00:00 foi a data de lançamento do lance no app
--	limit 3 --limita a quantidade de registros apenas para teste
),
vencedores_app_com_lance as (
	select
		'lance' as ganhou_via_app_com,
		pdi.numero_uasg,
		pdi.codigo_modalidade,
		pdi.numero_compra,
		pdi.ano_compra,
		pdi.numero_item,
		pdi.tipo_participante,
		pdi.identificacao_participante
	from
		ComprasGov_SalaDisputa_VBL.participacao_disputa_item as pdi
		inner join ComprasGov_SalaDisputa_VBL.lance as l
			on pdi.id_melhor_lance = l.id
			and l.origem_sessao_usuario = 'A'
		inner join (
--obtém da fase externa a relação de vencedores que ganharam tendo enviado algum lance
			select
				c.numero_uasg,
				c.codigo_modalidade,
				c.numero_compra,
				c.ano_compra,
				i.numero_item,
				p.tipo_participante,
				p.identificacao_participante
			from
				ComprasGov_FaseExterna_VBL.compra as c
				inner join ComprasGov_FaseExterna_VBL.item as i
					on c.numero_uasg = i.numero_uasg
					and c.codigo_modalidade = i.codigo_modalidade
					and c.numero_compra = i.numero_compra
					and c.ano_compra = i.ano_compra
				inner join ComprasGov_FaseExterna_VBL.proposta_item as p_i
					on i.id = p_i.id_item
					and p_i.situacao = '6' --amarra apenas com fornecedores adjudicados
					and p_i.origem_melhor_valor <> 'P' --pega os fornecedores que ganharam com algum lance
				inner join ComprasGov_FaseExterna_VBL.participacao as p
					on p_i.id_participacao = p.id
					and c.id = p.id_compra
			where
				c.codigo_modalidade = 6 --filtra apenas dispensas
				and i.situacao = '1' --apenas itens ativos (desconsidera itens cancelados, anulados, revogados, fracassados, desertos e suspensos)
				and i.homologado = 'S' --já amarra o retorno somente com os itens homologados (para garantir que está pegando o fornecedor vencedor)
				and c.data_hora_abertura_sp between '2022-12-01 00:00:00' and '2022-12-10 23:59:59' --lembrando que 2022-09-26 00:00:00 foi a data de lançamento do lance no app
--				limit 50 --limita a quantidade de registros apenas para teste
			) as v
			on pdi.numero_uasg = v.numero_uasg
			AND pdi.codigo_modalidade = v.codigo_modalidade
			AND pdi.numero_compra = v.numero_compra
			AND pdi.ano_compra = v.ano_compra
			AND pdi.numero_item = v.numero_item
			AND pdi.tipo_participante = v.tipo_participante
			AND pdi.identificacao_participante = v.identificacao_participante
--			limit 3 --limita a quantidade de registros apenas para teste
)
select * from vencedores_app_com_proposta
union
select * from vencedores_app_com_lance
order by
	ganhou_via_app_com,
	numero_uasg,
	codigo_modalidade,
	numero_compra,
	ano_compra,
	numero_item,
	tipo_participante,
	identificacao_participante;
	
--Para obter os dados de validação do DAAS da fase externa:
--********************************************************************************************
select
*
from
ComprasGov_FaseExterna_VBL.compra as c
inner join ComprasGov_FaseExterna_VBL.item as i
on c.numero_uasg = i.numero_uasg
and c.codigo_modalidade = i.codigo_modalidade
and c.numero_compra = i.numero_compra
and c.ano_compra = i.ano_compra
inner join ComprasGov_FaseExterna_VBL.proposta_item as p_i
on i.id = p_i.id_item
and p_i.situacao = '6' --amarra apenas com fornecedores adjudicados
and p_i.origem_melhor_valor <> 'P' --pega os fornecedores que ganharam apenas com a proposta
inner join ComprasGov_FaseExterna_VBL.participacao as p
on p_i.id_participacao = p.id
and c.id = p.id_compra
where c.codigo_modalidade = 6
--and c.numero_uasg = ???
--and c.numero_compra = ???
--and c.ano_compra = ???
--and i.numero_item = ???
--and p.tipo_participante = '???'
--and p.identificacao_participante = '???'
;

--Para obter os dados de validação do DAAS da sala de disputa:
--********************************************************************************************
select
*
from
ComprasGov_SalaDisputa_VBL.participacao_disputa_item as pdi
inner join ComprasGov_SalaDisputa_VBL.lance as l
on pdi.id_melhor_lance = l.id
and l.origem_sessao_usuario = 'A'
where 1=1
--and pdi.numero_uasg = ???
--and pdi.codigo_modalidade = ???
--and pdi.numero_compra = ???
--and pdi.ano_compra = ???
--and pdi.numero_item = ???
--and pdi.tipo_participante = '???'
--and pdi.identificacao_participante = '???'
;