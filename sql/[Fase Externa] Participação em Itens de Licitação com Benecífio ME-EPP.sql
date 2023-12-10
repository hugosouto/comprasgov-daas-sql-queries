SELECT
	 c.numero_uasg CodigoUasg
	,CASE c.codigo_modalidade WHEN 5 THEN 'Pregão' ELSE c.codigo_modalidade END Modalidade
	,CASE c.forma_realizacao WHEN '1' THEN 'Eletrônico' ELSE c.forma_realizacao END Formato
	,c.numero_compra||c.ano_compra NumeroPregao
	,i.numero_item ItemPregao
	,descricao DescricaoItem
	,c.data_hora_prevista_abertura_sp DataHoraPrevistaAberturaSessaoPublica
	,CASE i.tipo_tratamento_diferenciado_meepp
		WHEN '0' THEN 'Não possui benefício'
		WHEN '1' THEN 'Benefício tipo 1 - Exclusividade ME/EPP (inciso I, art. 48, LC 123/2006)'
		WHEN '2' THEN 'Benefício tipo 2 - Subcontratação ME/EPP (inciso II, art. 48, LC 123/2006)'
		WHEN '3' THEN 'Benefício tipo 3 - Cota reservada ME/EPP (inciso III, art. 48, LC 123/2006)'
		WHEN '9' THEN 'Sem benefícios ME/EPP(Art. 4, lei 14.133/2021)'
		END TipoTratamentoDiferenciadoMeEpp
	,p.identificacao_participante CNPJ
	,nome_participante RazaoSocial
FROM ComprasGov_FaseExterna_VBL.compra AS c
	JOIN ComprasGov_FaseExterna_VBL.item AS i 
		ON c.numero_uasg = i.numero_uasg
		AND c.codigo_modalidade = i.codigo_modalidade
		AND c.numero_compra = i.numero_compra
		AND c.ano_compra = i.ano_compra
	JOIN ComprasGov_FaseExterna_VBL.proposta_item AS pi ON i.id = pi.id_item
	JOIN ComprasGov_FaseExterna_VBL.participacao AS p ON pi.id_participacao = p.id
WHERE 1=1
	AND c.data_hora_prevista_abertura_sp > '2022-01-01 00:00:00'
	AND p.identificacao_participante IN ('32708161000120')
	AND i.tipo_tratamento_diferenciado_meepp = 1
	AND i.numero_item > 0
;