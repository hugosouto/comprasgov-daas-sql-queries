SELECT * 
FROM Comprasnet_VBL.TBL_COT_COTACAO c
JOIN Comprasnet_VBL.TBL_COT_ITENS_COTACAO ic ON ic.COT_CODIGO = c.COT_CODIGO
JOIN Comprasnet_VBL.TBL_COT_LANCE l ON l.ITC_CODIGO = ic.ITC_CODIGO
JOIN Comprasnet_VBL.tb_Usuario u ON u.Cod_Usuario = l.COD_USUARIO
JOIN Comprasnet_VBL.tb_Empresa e ON e.Cod_Empresa = u.Cod_Empresa
WHERE COT_UASG IN (155903) AND COT_NUMPRP IN (352016)