SELECT DISTINCT Cliente_ID,Nome,CNPJ,sesIP,coduasg,numprp --SUBSTRING(sesDataEnt,1,10) AS sesDataEnt
FROM Comprasnet_VBL.tbl_sessao_hist s
JOIN Comprasnet_VBL.tb_Usuario u ON u.Login = s.Cliente_ID
JOIN Comprasnet_VBL.tb_Empresa e ON e.Cod_Empresa = u.Cod_Empresa
JOIN Comprasnet_VBL.tb_Log_PregaoFornec_hist p ON p.cpfCnpj = e.CNPJ
WHERE coduasg = 160376 AND numprp IN (82016,32017,82017)

UNION

SELECT DISTINCT Cliente_ID,Nome,CNPJ,sesIP,coduasg,numprp --SUBSTRING(sesDataEnt,1,10) AS sesDataEnt
FROM Comprasnet_VBL.tbl_sessao s
JOIN Comprasnet_VBL.tb_Usuario_hist u ON u.Login = s.Cliente_ID
JOIN Comprasnet_VBL.tb_Empresa e ON e.Cod_Empresa = u.Cod_Empresa
JOIN Comprasnet_VBL.tb_Log_PregaoFornec_hist p ON p.cpfCnpj = e.CNPJ
WHERE coduasg = 160376 AND numprp IN (82016,32017,82017)
;