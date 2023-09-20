SELECT
    (SELECT COUNT(*) FROM Siasgnet_VBL.uasg) AS "Total de UASGs",
    (SELECT COUNT(*) FROM Siasgnet_VBL.uasg WHERE percentualenquadramentoincisoieii > 0) AS "Total de UASGs com Percentual",
    (SELECT COUNT(*) FROM Siasgnet_VBL.uasg WHERE percentualenquadramentoincisoieii = 10) AS "Total de UASGs com Percentual de 10%",
    (SELECT COUNT(*) FROM Siasgnet_VBL.uasg WHERE percentualenquadramentoincisoieii = 20) AS "Total de UASGs com Percentual de 20%",
    ((SELECT COUNT(*) FROM Siasgnet_VBL.uasg WHERE percentualenquadramentoincisoieii > 0) / 
    (SELECT COUNT(*) FROM Siasgnet_VBL.uasg))  AS "Percentual de UASGs com Percentual"
FROM Siasgnet_VBL.uasg
LIMIT 1;
