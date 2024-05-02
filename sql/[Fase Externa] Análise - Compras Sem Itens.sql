SELECT        
	CASE situacao_compra
	    WHEN 'PD' THEN 'Publicada/Divulgada (item null)'
	    WHEN 'RE' THEN 'Revogada (item null)'
	    WHEN 'AN' THEN 'Anulada (item null)'
	    WHEN 'SU' THEN 'Suspensa (item null)'
	    WHEN 'FR' THEN 'Fracassada (item null)'
	    WHEN 'DE' THEN 'Deserta (item null)'
	END situacao_compra,
	count(*) as QTD
FROM ComprasGov_FaseExterna_VBL.COMPRA CP
LEFT JOIN ComprasGov_FaseExterna_VBL.item ITEM 
        ON CP.ano_compra = ITEM.ano_compra 
        AND CP.numero_uasg = ITEM.numero_uasg 
        AND CP.codigo_modalidade = ITEM.codigo_modalidade 
        AND CP.numero_compra = ITEM.numero_compra
WHERE 1=1
AND cp.ano_compra = 2024
 AND ITEM.id is null
group by situacao_compra
UNION
SELECT '' situacao_compra, '' count
UNION
SELECT        
	CASE situacao_compra
	    WHEN 'PD' THEN 'Publicada/Divulgada'
	    WHEN 'RE' THEN 'Revogada'
	    WHEN 'AN' THEN 'Anulada'
	    WHEN 'SU' THEN 'Suspensa'
	    WHEN 'FR' THEN 'Fracassada'
	    WHEN 'DE' THEN 'Deserta'
	END situacao_compra,
	count(*) as QTD
FROM ComprasGov_FaseExterna_VBL.COMPRA CP
LEFT JOIN ComprasGov_FaseExterna_VBL.item ITEM 
        ON CP.ano_compra = ITEM.ano_compra 
        AND CP.numero_uasg = ITEM.numero_uasg 
        AND CP.codigo_modalidade = ITEM.codigo_modalidade 
        AND CP.numero_compra = ITEM.numero_compra
WHERE 1=1
AND cp.ano_compra = 2024
 AND ITEM.id is NOT null
group by situacao_compra;

--------------------------------------------------------------

SELECT        
--	MONTH(CP.data_hora_inclusao) as MES,
--	CP.data_hora_inclusao,
	'https://pncp.gov.br/app/editais/'||SUBSTRING(CP.chave_compra_pncp, 0, 15)||'/'||SUBSTRING(CP.chave_compra_pncp, 22, 4)||'/'||SUBSTRING(CP.chave_compra_pncp, 19, 3),
	item.id    as item_id,
	CASE situacao_compra
	    WHEN 'PD' THEN 'Publicada/Divulgada'
	    WHEN 'RE' THEN 'Revogada'
	    WHEN 'AN' THEN 'Anulada'
	    WHEN 'SU' THEN 'Suspensa'
	    WHEN 'FR' THEN 'Fracassada'
	    WHEN 'DE' THEN 'Deserta'
	END situacao_compra,
--	count(*) as QTD
	CAST(CP.data_hora_inclusao as DATE) as DATA_INCLUSAO ,
	CP.ID as Compra_id,
	CP.ano_compra,
	CP.numero_uasg ,
	CP.codigo_modalidade ,
	CP.numero_compra ,
	CP.objeto
FROM ComprasGov_FaseExterna_VBL.COMPRA CP
LEFT JOIN ComprasGov_FaseExterna_VBL.item ITEM 
        ON CP.ano_compra = ITEM.ano_compra 
        AND CP.numero_uasg = ITEM.numero_uasg 
        AND CP.codigo_modalidade = ITEM.codigo_modalidade 
        AND CP.numero_compra = ITEM.numero_compra
WHERE 1=1
AND cp.ano_compra = 2024
 AND ITEM.id is null
--group by situacao_compra --MONTH(CP.data_hora_inclusao)
Order by 1

--------------------------------------------------------------

SELECT 
	CASE WHEN i.id IS NULL THEN TRUE ELSE FALSE END item_nulo,
--	c.id,
	c.numero_uasg,
	c.codigo_modalidade,
--	c.numero_compra,
--	c.ano_compra,
	c.modo_disputa,
	c.caracteristica,
	c.forma_realizacao,
	c.emergencial,
--	c.objeto,
	c.data_hora_inicio_propostas,
	c.data_hora_prevista_abertura_sp,
--	c.numero_processo,
--	c.data_hora_inclusao,
--	c.data_hora_alteracao,
	c.data_hora_fim_propostas,
	c.homologada,
	c.tipo_suspensao,
	c.fase_compra,
	c.situacao_compra,
	c.versao,
	c.part_excl_meepp_ou_equiparadas,
	c.hora_fim_disputa,
	c.data_hora_abertura_sp,
	c.data_hora_encerramento_sp,
	c.julgamento_iniciado,
--	c.valor_limite_homologacao,
--	c.resp_autorizacao_compra_fi,
	c.criterio_julgamento criterio_julgamento_compra,
	c.fundamento_legal,
	c.regime_execucao,
	c.tipo_objeto,
	c.data_hora_prevista_fim_analise_propostas,
--	c.data_hora_reabertura_sp_suspensa,
	c.existe_item_em_disputa_apos_julgamento,
--	c.tipo_evento_aviso_evento_fi,
--	c.data_hora_prevista_evento_fi,
--	c.tipo_evento_anterior_fi,
--	c.tipo_evento_vigente_fi,
--	c.origem_suspensao,
--	c.chave_compra_pncp,
	c.id_configuracao_sp,
--	i.id id_item,
--	i.numero_uasg,
--	i.codigo_modalidade,
--	i.numero_compra,
--	i.ano_compra,
--	i.numero_item,
	i.numero_grupo,
--	i.qtde_itens_de_grupo,
--	i.descricao,
--	i.descricao_detalhada,
--	i.unidade_fornecimento,
--	i.versao,
	i.criterio_julgamento criterio_julgamento_item,
	i.criterio_valor,
--	i.valor_estimado,
	i.quantidade_solicitada,
	i.situacao,
	i.orcamento_sigiloso,
	i.tipo_variacao_minima_entre_lances,
--	i.variacao_minima_entre_lances,
--	i.data_hora_alteracao,
--	i.data_hora_inclusao,
--	i.apelido,
--	i.sugestao_apelido,
	i.fase,
	i.homologado,
	i.data_hora_previsao_abertura,
--	i.priorizar_abertura,
	i.tipo,
	i.codigo_item_catalogo,
	i.tipo_item_catalogo,
	i.versao_sala_disputa,
--	i.melhor_valor_proposta_lance_informado,
--	i.melhor_valor_proposta_lance_calculado,
--	i.melhor_valor_nao_desclassificado_calculado,
	i.id_melhor_proposta_nao_desclassificada,
	i.situacao_envio_resultado,
--	i.erro_ao_enviar_resultado,
--	i.quantidade_minima_solicitada,
	i.qtde_propostas_melhor_valor,
--	i.qtde_aceita,
--	i.qtde_adjudicada,
	i.numero_sessao_julg_hab,
	i.id_fase_recursal_atual,
--	i.data_hora_reabertura_julg_hab,
--	i.numero_item_participacao_aberta,
--	i.numero_item_participacao_exclusiva_meepp,
	i.tipo_tratamento_diferenciado_meepp,
--	i.perc_min_subcontratacao,
--	i.perc_max_subcontratacao,
--	i.login_homologador,
--	i.nome_homologador,
--	i.ip_homologador,
	i.data_hora_homologacao
FROM ComprasGov_FaseExterna_VBL.compra c
LEFT JOIN ComprasGov_FaseExterna_VBL.item i 
        ON c.ano_compra = i.ano_compra
        AND c.numero_uasg = i.numero_uasg
        AND c.codigo_modalidade = i.codigo_modalidade 
        AND c.numero_compra = i.numero_compra
WHERE 1=1
AND c.ano_compra = 2024;
-- AND ITEM.id is null
--group by situacao_compra --MONTH(CP.data_hora_inclusao)
--Order by 1