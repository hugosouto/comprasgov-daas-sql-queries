SELECT codigounidade, nomeunidade, orgao, COUNT(id) qtdcontratacoes, SUM([total homologado]) totalhomologado  
FROM seges_delog_cgscg_stage.pncp.fatocompra
WHERE sistema = 'Compras.gov.br' AND anocompra = '2022' AND [situação da compra] = 'Divulgada no PNCP'
GROUP BY codigounidade, nomeunidade, orgao  
ORDER BY SUM([total homologado]) DESC