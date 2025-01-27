SELECT *
--    REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '') descricao,
--    i.valortotal valortotalestimado
FROM PNCP_VBL.compra AS c
    JOIN PNCP_VBL.vw_compraitem AS i ON c.id = i.compraid
    LEFT JOIN PNCP_VBL.compraitemresultado AS ir ON c.id = i.compraid
    JOIN PNCP_VBL.situacaocompraitem AS s ON i.situacaocompraitemid = s.id
WHERE 1=1
    AND s.id = 2 -- Situação: Homologado
    -- Incluir
    AND c.usuarioid = 3 -- Compras.gov.br
    AND c.anocompra IN (2022, 2023, 2024)
--    AND i.valortotal < 2800000000
ORDER BY i.valortotal DESC
--LIMIT 50;