--http://compras.dados.gov.br/licitacoes/v1/licitacoes.html?uasg=389144&data_entrega_edital_max=20181231&data_entrega_edital_min=20180101
SELECT x.* FROM dados_abertos_compras.dados_abertos.tb_vw_licitacao x
WHERE uasg=389144 AND data_entrega_edital BETWEEN '2018-01-01 00:00:00' AND '2018-12-31 00:00:00'
--ORDER BY x.uasg,x.data_entrega_edital
-- http://compras.dados.gov.br/licitacoes/v1/licitacoes.html?uasg=389144&data_publicacao=20181211
UNION
SELECT x.* FROM dados_abertos_compras.dados_abertos.tb_vw_licitacao x
WHERE uasg=389144 AND data_entrega_edital='2018-12-06 09:00:00.000'
--ORDER BY x.uasg,x.data_entrega_edital
--http://compras.dados.gov.br/licitacoes/v1/licitacoes.html?uasg=389144&data_entrega_edital=20181129
UNION
SELECT x.* FROM dados_abertos_compras.dados_abertos.tb_vw_licitacao x
WHERE uasg=389144 AND data_entrega_edital='2018-11-29 08:00:00.000'
--ORDER BY x.uasg,x.data_entrega_edital
--http://compras.dados.gov.br/licitacoes/v1/licitacoes.html?uasg=389144&order=desc&order_by=data_publicacao
UNION
SELECT x.* FROM dados_abertos_compras.dados_abertos.tb_vw_licitacao x
WHERE uasg=389144
ORDER BY x.uasg,x.data_entrega_edital