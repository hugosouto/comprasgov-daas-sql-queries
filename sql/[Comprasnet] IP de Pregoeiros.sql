SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesNome
FROM Comprasnet_VBL.tbl_Sessao
WHERE (sesUASG = 160376 OR sesUASGOriginal = 160376) AND Cliente_ID='84843322091'
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,SUBSTRING(sesDataEnt,1,10) sesDataEnt,SUBSTRING(sesDataEnt,1,10) sesDataSai,sesUASG,sesUASGOriginal -- sesDataEnt,sesDataSai,sesTipo,sesSaiuSeguro,dataInclusao,dataAlteracao,sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist
WHERE (sesUASG = 160376 OR sesUASGOriginal = 160376) AND Cliente_ID='84843322091'
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesDataInsHist
FROM Comprasnet_VBL.tbl_sessao_hist_2019
WHERE (sesUASG = 160376 OR sesUASGOriginal = 160376) AND Cliente_ID='84843322091'
;
--------------------------------------------------------------------

SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesNome
FROM Comprasnet_VBL.tbl_Sessao
WHERE Cliente_ID='09018596485'
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist
WHERE Cliente_ID='09018596485'
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist_2019
WHERE Cliente_ID='09018596485'
;
----------------------------------------

SELECT * -- sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,sh.dataInclusao,sh.dataAlteracao,coduasg,numprp -- sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist sh
--JOIN Comprasnet_VBL.tb_Log_PregaoFornec l ON sh.sesID = l.sessionID
JOIN Comprasnet_VBL.tb_Log_PregaoFornec_hist lh ON SUBSTRING(sh.sesID,1,8) = SUBSTRING(lh.sessionID,1,8)
WHERE Cliente_ID='84843322091'
;
----------------------------------------
SELECT DISTINCT sesCod,Cliente_ID,sesDataEnt,sesDataSai,sesIP,sesUASG -- sesID,sesTipo,sesSaiuSeguro,dataInclusao,dataAlteracao,sesDataInsHist,sesUASGOriginal
FROM Comprasnet_VBL.tbl_sessao_hist
WHERE (sesUASG = 160376 OR sesUASGOriginal = 160376) AND Cliente_ID='84843322091' AND SUBSTRING(sesDataEnt,1,4) IN ('2016','2017')
ORDER BY sesDataEnt