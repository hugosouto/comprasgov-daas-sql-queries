eSELECT DISTINCT u.codigounidade
FROM PNCP_VBL.unidadeorgao u
JOIN PNCP_VBL.compra cp ON u.id = cp.unidadeorgaoid
JOIN PNCP_VBL.contrato ct ON u.id = ct.unidadeorgaoid
ORDER BY u.codigounidade