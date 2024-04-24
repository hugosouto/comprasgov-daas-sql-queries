SELECT
	case pi.origem_melhor_valor
		when 'P' then 'Proposta Inicial'
		when 'L' then 'Lance'
		when 'M' then 'Desempate ME/EPP'
		when '7' then 'Desempate 7174'
		when 'F' then 'Disputa Final'
	else pi.origem_melhor_valor end origem_melhor_valor,
	COUNT(pi.id) propostas_adjudicadas
FROM ComprasGov_FaseExterna_VBL.proposta_item pi
WHERE 1=1
	AND origem_sessao_usuario = 'A'
	AND situacao = '6'
--	AND data_hora_inclusao >= '2024-01-01'
GROUP BY origem_melhor_valor
--------------------------------------------------
-- Situação da proposta:
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