SELECT
	COUNT(pi.id) propostas_adjudicadas
FROM ComprasGov_FaseExterna_VBL.proposta_item pi
WHERE origem_sessao_usuario='A' AND situacao='6' AND pi.origem_melhor_valor='L'
--GROUP BY origem_melhor_valor 
--Situação da proposta (ver a classe SituacaoPropostaItemEnum). Pode assumir um dos seguintes valores:
-- 1 - Proposta desclassificada na análise
-- 2 - Proposta desclassificada no julgamento
-- 3 - Proposta aceita
-- 4 - Fornecedor habilitado
-- 5 - Fornecedor inabilitado
-- 6 - Proposta adjudicada
-- 7 - Pendente aceite para assumir cota
-- 8 - Recusa para assumir cota
-- 9 - Proposta desclassificada na sala de disputa
;

select
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
-- obtém da fase externa a relação de vencedores que ganharam tendo enviado algum lance
		select 
			pi.origem_melhor_valor,
			count(distinct id_participacao) adjudicados_com_lances_pelos_app
		from
			ComprasGov_FaseExterna_VBL.compra as c
			inner join ComprasGov_FaseExterna_VBL.item as i
				on c.numero_uasg = i.numero_uasg
				and c.codigo_modalidade = i.codigo_modalidade
				and c.numero_compra = i.numero_compra
				and c.ano_compra = i.ano_compra
			inner join ComprasGov_FaseExterna_VBL.proposta_item as pi
				on i.id = pi.id_item
				and pi.situacao = '6' -- filtro apenas com fornecedores adjudicados
				and pi.origem_melhor_valor = 'L' -- filtra os fornecedores que ganharam com algum lance
			inner join ComprasGov_FaseExterna_VBL.participacao as p
				on pi.id_participacao = p.id
				and c.id = p.id_compra
		where
			c.codigo_modalidade = 6 -- filtra apenas dispensas
			and i.situacao = '1' -- apenas itens ativos (desconsidera itens cancelados, anulados, revogados, fracassados, desertos e suspensos)
			and i.homologado = 'S' -- filtra o retorno somente com os itens homologados (para garantir que está pegando o fornecedor vencedor)
			and c.data_hora_abertura_sp between '2022-12-01 00:00:00' and '2022-12-10 23:59:59' --lembrando que 2022-09-26 00:00:00 foi a data de lançamento do lance no app
		group by pi.origem_melhor_valor
		limit 50 -- limita a quantidade de registros apenas para teste
		) as v
	on pdi.numero_uasg = v.numero_uasg
	and pdi.codigo_modalidade = v.codigo_modalidade
	and pdi.numero_compra = v.numero_compra
	and pdi.ano_compra = v.ano_compra
	and pdi.numero_item = v.numero_item
	and pdi.tipo_participante = v.tipo_participante
	and pdi.identificacao_participante = v.identificacao_participante
limit 30 -- limita a quantidade de registros apenas para teste
