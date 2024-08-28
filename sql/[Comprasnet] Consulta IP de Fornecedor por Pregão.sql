SELECT DISTINCT s.Cliente_ID,u.Nome,e.CNPJ,e.RazaoSocial,s.sesIP,pr.coduasg
FROM Comprasnet_VBL.tbl_sessao s
LEFT JOIN Comprasnet_VBL.tb_Usuario u 			ON u.Login = s.cliente_id_real
LEFT JOIN Comprasnet_VBL.tb_Empresa e 			ON e.Cod_Empresa = u.Cod_Empresa
LEFT JOIN Comprasnet_VBL.tb_Log_PregaoFornec p 	ON p.cpfCnpj = e.CNPJ
LEFT JOIN Comprasnet_VBL.tbL_pregao pr 			ON pr.prgCod = p.prgCod
--WHERE pr.coduasg = 000000 AND pr.numprp IN (002023)
--	AND	(e.CNPJ = '00000000000000' OR e.CNPJ = '00000000000000')
;