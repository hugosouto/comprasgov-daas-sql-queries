-- Tabela compra
SELECT
	 id
	,numero_uasg
	,codigo_modalidade
	,numero_compra
	,ano_compra
	,modo_disputa
	,caracteristica
	,forma_realizacao
	,emergencial
	,objeto
	,data_hora_inicio_propostas
	,data_hora_prevista_abertura_sp
	,numero_processo
	,data_hora_inclusao
	,data_hora_alteracao
	,data_hora_fim_propostas
	,homologada
	,tipo_suspensao
	,fase_compra
	,situacao_compra
	,versao
	,part_excl_meepp_ou_equiparadas
	,hora_fim_disputa
	,data_hora_abertura_sp
	,data_hora_encerramento_sp
	,julgamento_iniciado
	,valor_limite_homologacao
	,resp_autorizacao_compra_fi
	,criterio_julgamento
	,fundamento_legal
	,regime_execucao
	,tipo_objeto
	,data_hora_prevista_fim_analise_propostas
	,data_hora_reabertura_sp_suspensa
	,existe_item_em_disputa_apos_julgamento
	,tipo_evento_aviso_evento_fi
	,data_hora_prevista_evento_fi
	,tipo_evento_anterior_fi
	,tipo_evento_vigente_fi
	,origem_suspensao
	,chave_compra_pncp
	,id_configuracao_sp
FROM
	ComprasGov_FaseExterna_VBL.compra

-- Tabela item
SELECT
	 i.id
	,i.numero_uasg
	,i.codigo_modalidade
	,i.numero_compra
	,i.ano_compra
	,i.numero_item
--	,i.numero_grupo
--	,i.qtde_itens_de_grupo
	,i.descricao
--	,i.descricao_detalhada
--	,i.unidade_fornecimento
	,i.criterio_julgamento
	,i.criterio_valor
	,i.valor_estimado
	,i.quantidade_solicitada
	,i.situacao
	,i.orcamento_sigiloso
	,i.tipo_variacao_minima_entre_lances
	,i.variacao_minima_entre_lances
--	,i.data_hora_alteracao
--	,i.data_hora_inclusao
--	,i.apelido
--	,i.sugestao_apelido
	,i.fase
	,i.homologado
--	,i.data_hora_previsao_abertura
--	,i.versao_1
--	,i.priorizar_abertura
	,i.tipo
	,i.codigo_item_catalogo
	,i.tipo_item_catalogo
--	,i.versao_sala_disputa
--	,i.melhor_valor_proposta_lance_informado
--	,i.melhor_valor_proposta_lance_calculado
--	,i.melhor_valor_nao_desclassificado_calculado
--	,i.id_melhor_proposta_nao_desclassificada
	,i.situacao_envio_resultado
--	,i.erro_ao_enviar_resultado
	,i.quantidade_minima_solicitada
--	,i.qtde_propostas_melhor_valor
--	,i.qtde_aceita
--	,i.qtde_adjudicada
--	,i.numero_sessao_julg_hab
--	,i.id_fase_recursal_atual
--	,i.data_hora_reabertura_julg_hab
--	,i.numero_item_participacao_aberta
--	,i.numero_item_participacao_exclusiva_meepp
	,i.tipo_tratamento_diferenciado_meepp
--	,i.perc_min_subcontratacao
--	,i.perc_max_subcontratacao
--	,i.login_homologador
--	,i.nome_homologador
--	,i.ip_homologador
--	,i.data_hora_homologacao
FROM ComprasGov_FaseExterna_VBL.item i

-- Tabela Final
SELECT
	 i.id
	,i.numero_uasg
	,i.codigo_modalidade
	,i.numero_compra
	,i.ano_compra
	,i.numero_item
--	,i.numero_grupo
--	,i.qtde_itens_de_grupo
	,i.descricao
--	,i.descricao_detalhada
--	,i.unidade_fornecimento
	,i.criterio_julgamento
	,i.criterio_valor
	,i.valor_estimado
	,i.quantidade_solicitada
	,i.situacao
	,i.orcamento_sigiloso
	,i.tipo_variacao_minima_entre_lances
	,i.variacao_minima_entre_lances
--	,i.data_hora_alteracao
--	,i.data_hora_inclusao
--	,i.apelido
--	,i.sugestao_apelido
	,i.fase
	,i.homologado
--	,i.data_hora_previsao_abertura
--	,i.versao_1
--	,i.priorizar_abertura
	,i.tipo
	,i.codigo_item_catalogo
	,i.tipo_item_catalogo
--	,i.versao_sala_disputa
--	,i.melhor_valor_proposta_lance_informado
--	,i.melhor_valor_proposta_lance_calculado
--	,i.melhor_valor_nao_desclassificado_calculado
--	,i.id_melhor_proposta_nao_desclassificada
	,i.situacao_envio_resultado
--	,i.erro_ao_enviar_resultado
	,i.quantidade_minima_solicitada
--	,i.qtde_propostas_melhor_valor
--	,i.qtde_aceita
--	,i.qtde_adjudicada
--	,i.numero_sessao_julg_hab
--	,i.id_fase_recursal_atual
--	,i.data_hora_reabertura_julg_hab
--	,i.numero_item_participacao_aberta
--	,i.numero_item_participacao_exclusiva_meepp
	,i.tipo_tratamento_diferenciado_meepp
--	,i.perc_min_subcontratacao
--	,i.perc_max_subcontratacao
--	,i.login_homologador
--	,i.nome_homologador
--	,i.ip_homologador
--	,i.data_hora_homologacao
	,c.caracteristica
	,c.forma_realizacao
	,c.emergencial
	,c.data_hora_prevista_abertura_sp
	,c.situacao_compra
	,c.part_excl_meepp_ou_equiparadas
	,c.fundamento_legal
	,c.tipo_objeto
FROM ComprasGov_FaseExterna_VBL.item i
JOIN ComprasGov_FaseExterna_VBL.compra c ON c.numero_uasg = i.numero_uasg AND c.codigo_modalidade = i.codigo_modalidade AND c.numero_compra = i.numero_compra AND c.ano_compra = i.ano_compra
WHERE i.tipo IN ('I', 'S')
;