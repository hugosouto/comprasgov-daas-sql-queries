select * from ocorrencia o
  inner join ocorrencia_dinamica od on od.id_ocorrencia_dinamica = o.id_ocorrencia
  inner join motivo_ocorrencia_dinamica mo on mo.id_motivo_ocorrencia_dinamica = od.id_motivo_ocorrencia_dinamica
where od.id_tp_ocorrencia_dinamica = 1004 and o.id_tp_ocorrencia = 10 and o.ind_excluida = 'N';

SELECT DISTINCT p.nom_nome,p.num_cpf_cnpj,o.id_ocorrencia,o.id_tp_ocorrencia,o.id_fornecedor,o.id_uasg,o.num_processo,o.num_contrato,o.ind_excluida,o.dt_inclusao,mo.dsc_motivo_dinamica --o.id_fornecedor_infrator,id_orgao_sancionador,dsc_detalhe,dsc_justificativa_acao,ind_vencimento_tratado,    mo.id_motivo_ocorrencia_dinamica,id_tp_ocorrencia_dinamica
FROM ocorrencia o
	JOIN ocorrencia_dinamica od 		ON o.id_ocorrencia = od.id_ocorrencia_dinamica
	JOIN motivo_ocorrencia_dinamica mo 	ON od.id_motivo_ocorrencia_dinamica = mo.id_motivo_ocorrencia_dinamica
	JOIN fornecedor f					ON o.id_fornecedor = f.id_fornecedor  
	JOIN pessoa p						ON f.id_fornecedor = p.id_pessoa
	JOIN fornecedor_juridico fj 		ON p.id_pessoa = fj.id_fornecedor_juridico
	JOIN fornecedor_juridico_cnae fjc	ON p.id_pessoa = fjc.id_fornecedor_juridico
WHERE od.id_tp_ocorrencia_dinamica = 1004 AND o.id_tp_ocorrencia = 10 AND o.ind_excluida = 'N';

SELECT DISTINCT LPAD(p.num_cpf_cnpj, 14, 0) pk_cpf_cnpj
FROM ocorrencia o
	JOIN ocorrencia_dinamica od 		ON o.id_ocorrencia = od.id_ocorrencia_dinamica
	JOIN motivo_ocorrencia_dinamica mo 	ON od.id_motivo_ocorrencia_dinamica = mo.id_motivo_ocorrencia_dinamica
	JOIN fornecedor f					ON o.id_fornecedor = f.id_fornecedor  
	JOIN pessoa p						ON f.id_fornecedor = p.id_pessoa
	JOIN fornecedor_juridico fj 		ON p.id_pessoa = fj.id_fornecedor_juridico
	JOIN fornecedor_juridico_cnae fjc	ON p.id_pessoa = fjc.id_fornecedor_juridico
WHERE od.id_tp_ocorrencia_dinamica = 1004 AND o.id_tp_ocorrencia = 10 AND o.ind_excluida = 'N' AND tp_pessoa = 2
--ORDER BY num_cpf_cnpj
;
