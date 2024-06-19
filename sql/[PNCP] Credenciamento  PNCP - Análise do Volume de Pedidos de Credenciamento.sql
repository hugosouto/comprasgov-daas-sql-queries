SELECT SUBSTRING(dataanaliseprocesso, 1, 10) data, COUNT(*) contagem
FROM PNCP_VBL.credenciamento
GROUP BY SUBSTRING(dataanaliseprocesso, 1, 10)