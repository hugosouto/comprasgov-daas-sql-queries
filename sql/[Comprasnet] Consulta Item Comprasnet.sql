select * from "Comprasnet_VBL"."tbl_pregaoitem" pi join Comprasnet_VBL.tbl_Pregao p on p.prgCod = pi.prgCod
where ipgCod = 22343341;

SELECT 5||coduasg||numprp codigo
FROM Comprasnet_VBL.tbl_pregaoitem pi JOIN Comprasnet_VBL.tbl_Pregao p ON p.prgCod = pi.prgCod
WHERE ipgCod = 22343341;