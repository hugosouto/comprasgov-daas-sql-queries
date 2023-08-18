-- Tabela compra
SELECT
	id,
	numero_uasg,
	codigo_modalidade,
	numero_compra,
	ano_compra,
	modo_disputa,
	caracteristica,
	forma_realizacao,
	emergencial,
	objeto,
	data_hora_inicio_propostas,
	data_hora_prevista_abertura_sp,
	numero_processo,
	data_hora_inclusao,
	data_hora_alteracao,
	data_hora_fim_propostas,
	homologada,
	tipo_suspensao,
	fase_compra,
	situacao_compra,
	versao,
	part_excl_meepp_ou_equiparadas,
	hora_fim_disputa,
	data_hora_abertura_sp,
	data_hora_encerramento_sp,
	julgamento_iniciado,
	valor_limite_homologacao,
	resp_autorizacao_compra_fi,
	criterio_julgamento,
	fundamento_legal,
	regime_execucao,
	tipo_objeto,
	data_hora_prevista_fim_analise_propostas,
	data_hora_reabertura_sp_suspensa,
	existe_item_em_disputa_apos_julgamento,
	tipo_evento_aviso_evento_fi,
	data_hora_prevista_evento_fi,
	tipo_evento_anterior_fi,
	tipo_evento_vigente_fi,
	origem_suspensao,
	chave_compra_pncp,
	id_configuracao_sp
FROM ComprasGov_FaseExterna_VBL.compra
WHERE 1=1
	AND codigo_modalidade = 5
	
-- Tabela item
SELECT *
FROM ComprasGov_FaseExterna_VBL.item i
--JOIN ComprasGov_FaseExterna_VBL.compra c ON 