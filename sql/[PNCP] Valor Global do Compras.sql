SELECT nomerazaosocial, SUM(valorglobal) valorglobal
FROM PNCP_VBL.contrato c
JOIN PNCP_VBL.usuario u ON c.usuarioid = u.id 
WHERE usuarioid IN (3,36,79) AND excluido = False
GROUP BY nomerazaosocial