CREATE SCHEMA analises;

EXEC sp_rename 'seges_delog_cgscg_stage.analises.material_servico', 'faseinterna_dfd_itens_mais_cadastrados';

DROP TABLE seges_delog_cgscg_stage.analises.faseinterna_dfd_itens_mais_cadastrados;

CREATE TABLE seges_delog_cgscg_stage.analises.faseinterna_dfd_itens_mais_cadastrados (
	id_material_servico int,
	id_formalizacao_demanda int,
	tx_tipo_item varchar,
	tx_codigo varchar,
	tx_descricao text,
	in_quantidade float,
	valor_unitario float,
	id_classe int,
	tx_nome_classe varchar,
	tx_nome_padrao_descritivo varchar,
	ano_pca int,
	dt_data_prevista timestamp,
	bo_emergencial varchar,
	valor_total_estimado float,
	id_operacao int,
	nivel_prioridade int,
	id_artefato int,
	nr_ano int,
	id_uasg int,
	tx_estado varchar,
	in_tipo int,
	tx_tipo_artefato varchar,
	nm_uasg varchar,
	id_unico varchar,
	bo_sigiloso varchar,
	bo_excluido varchar
);

INSERT INTO seges_delog_cgscg_stage.analises.faseinterna_dfd_itens_mais_cadastrados
(id_material_servico,id_formalizacao_demanda,tx_tipo_item,tx_codigo,tx_descricao,in_quantidade,valor_unitario,id_classe,tx_nome_classe,tx_nome_padrao_descritivo,ano_pca,dt_data_prevista,bo_emergencial,valor_total_estimado,id_operacao,nivel_prioridade,id_artefato,nr_ano,id_uasg,tx_estado,in_tipo,tx_tipo_artefato,nm_uasg,id_unico,bo_sigiloso,bo_excluido) 
VALUES 
(2144721,846592,'Material','440762','COMPONENTES: ILUMINAÇÃO EM LED, REFLETIDA E TRANSMITIDA, ADICIONAL: INCLINAÇÃO ATÉ 30°, TIPO DE ANÁLISE: ÓTICO, AUMENTO: C/ OBJETIVAS ATÉ 100X, OCULARES ATÉ 10X, TIPO: TRINOCULAR',14.00000,2700.0000,6640,'EQUIPAMENTOS E ARTIGOS DE LABORATÓRIO','MICROSCÓPIO',2023,'2023-12-01 00:00:00.000',false,37800.0000,2,1,1361040,2023,158958,'Aprovado',4,'Documento de Formalização de Demanda','INST.FED.DO CEARÁ/CAMPUS ARACATI','158958/000087/2023',false,false);
