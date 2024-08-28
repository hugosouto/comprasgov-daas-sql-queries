SELECT *
--SELECT DISTINCT s.Cliente_ID,u.Nome,e.CNPJ,e.RazaoSocial,s.sesIP,pr.coduasg
FROM Comprasnet_VBL.tbl_sessao s
FULL JOIN Comprasnet_VBL.tb_Usuario u 			ON u.Login = s.cliente_id_real
FULL JOIN Comprasnet_VBL.tb_Empresa e 			ON e.Cod_Empresa = u.Cod_Empresa
--LEFT JOIN Comprasnet_VBL.tb_Log_PregaoFornec p 	ON p.cpfCnpj = e.CNPJ
--LEFT JOIN Comprasnet_VBL.tbL_pregao pr 			ON pr.prgCod = p.prgCod
WHERE 1=1
--	AND pr.coduasg = 000000 AND pr.numprp IN (002023)
--	AND	(e.CNPJ = '08830492000154' OR e.CNPJ = '03881622000164')
	AND e.CNPJ IN ('08830492000154', '03881622000164')
;


08830492000154
03881622000164
-- M.A.P DOS SANTOS (CNPJ 08.830.492/0001-54) e
-- AGROMOTORES MÁQUINAS E IMPLEMENTOS LTDA (CNPJ 03.881.622/0001-64)
-- Requisitos da consulta:
-- IP CNPJ Pregão ValorItem