---------- Consulta Geral ----------

SELECT
    REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '') descricao,
    COUNT(i.id) contagem,
    SUM(i.valortotal) valortotal
FROM PNCP_VBL.compra AS c
    JOIN PNCP_VBL.vw_compraitem AS i ON c.id = i.compraid
    JOIN PNCP_VBL.situacaocompraitem AS s ON i.situacaocompraitemid = s.id
WHERE 1=1
    AND s.id = 2 -- Situação: Homologado
    AND c.usuarioid = 3 -- Compras.gov.br
    AND c.anocompra IN (2022, 2023, 2024)
GROUP BY REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '')
ORDER BY COUNT(i.id) DESC
LIMIT 50;


---------- Consulta 2022 ----------

SELECT
    REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '') descricao,
    COUNT(i.id) contagem,
    SUM(i.valortotal) valortotal
FROM PNCP_VBL.compra AS c
    JOIN PNCP_VBL.vw_compraitem AS i ON c.id = i.compraid
    JOIN PNCP_VBL.situacaocompraitem AS s ON i.situacaocompraitemid = s.id
WHERE 1=1
    AND s.id = 2 -- Situação: Homologado
    AND c.usuarioid = 3 -- Compras.gov.br
    AND c.anocompra IN (2022)
GROUP BY REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '')
ORDER BY COUNT(i.id) DESC
LIMIT 50;


---------- Consulta 2023 ----------

SELECT
    REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '') descricao,
    COUNT(i.id) contagem,
    SUM(i.valortotal) valortotal
FROM PNCP_VBL.compra AS c
    JOIN PNCP_VBL.vw_compraitem AS i ON c.id = i.compraid
    JOIN PNCP_VBL.situacaocompraitem AS s ON i.situacaocompraitemid = s.id
WHERE 1=1
    AND s.id = 2 -- Situação: Homologado
    AND c.usuarioid = 3 -- Compras.gov.br
    AND c.anocompra IN (2023)
GROUP BY REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '')
ORDER BY COUNT(i.id) DESC
LIMIT 50;


---------- Consulta 2024 ----------

SELECT
    REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '') descricao,
    COUNT(i.id) contagem,
    SUM(i.valortotal) valortotal
FROM PNCP_VBL.compra AS c
    JOIN PNCP_VBL.vw_compraitem AS i ON c.id = i.compraid
    JOIN PNCP_VBL.situacaocompraitem AS s ON i.situacaocompraitemid = s.id
WHERE 1=1
    AND s.id = 2 -- Situação: Homologado
    AND c.usuarioid = 3 -- Compras.gov.br
    AND c.anocompra IN (2024)
GROUP BY REPLACE(REPLACE(REPLACE(UPPER(i.descricao), ' FORNECIMENTO / TRANSPORTE DE ÁGUA - CARRO PIPA', ''), 'PEÇA MECÂNICA/ELÉTRICA - VEÍCULO AUTOMOTIVO', 'PEÇA MECÂNICA / ELÉTRICA - VEÍCULO AUTOMOTIVO'), ' TREINAMENTO QUALIFICAÇÃO PROFISSIONAL', '')
ORDER BY COUNT(i.id) DESC
LIMIT 50;