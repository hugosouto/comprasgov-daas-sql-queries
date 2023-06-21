SELECT YEAR(data_assinatura) ano_assinatura, SUM(valor_global) valor_global
FROM contratos c
--JOIN contratoitens i ON i.contrato_id = c.id_1
--JOIN fornecedores f ON f.id = c.fornecedor_id
WHERE YEAR(data_assinatura) IN ('2021') AND tipo_id IN (60, 61) AND esfera = 'Federal' AND valor_global < 8000000000
GROUP BY YEAR(data_assinatura)