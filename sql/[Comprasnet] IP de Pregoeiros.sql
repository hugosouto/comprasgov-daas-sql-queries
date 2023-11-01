SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesNome
FROM Comprasnet_VBL.tbl_Sessao
WHERE (sesUASG = 0 OR sesUASGOriginal = 0) AND Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID e UASG a ser consultada
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,SUBSTRING(sesDataEnt,1,10) sesDataEnt,SUBSTRING(sesDataEnt,1,10) sesDataSai,sesUASG,sesUASGOriginal -- sesDataEnt,sesDataSai,sesTipo,sesSaiuSeguro,dataInclusao,dataAlteracao,sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist
WHERE (sesUASG = 0 OR sesUASGOriginal = 0) AND Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID e UASG a ser consultada
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesDataInsHist
FROM Comprasnet_VBL.tbl_sessao_hist_2019
WHERE (sesUASG = 0 OR sesUASGOriginal = 0) AND Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID e UASG a ser consultada
;
--------------------------------------------------------------------

SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesNome
FROM Comprasnet_VBL.tbl_Sessao
WHERE Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist
WHERE Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID
UNION
SELECT sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,dataInclusao,dataAlteracao -- sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist_2019
WHERE Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID
;
----------------------------------------

SELECT * -- sesCod,sesID,Cliente_ID,sesIP,sesDataEnt,sesDataSai,sesSaiuSeguro,sesTipo,sesUASG,sesUASGOriginal,sh.dataInclusao,sh.dataAlteracao,coduasg,numprp -- sesDataInsHist,
FROM Comprasnet_VBL.tbl_sessao_hist sh
--JOIN Comprasnet_VBL.tb_Log_PregaoFornec l ON sh.sesID = l.sessionID
JOIN Comprasnet_VBL.tb_Log_PregaoFornec_hist lh ON SUBSTRING(sh.sesID,1,8) = SUBSTRING(lh.sessionID,1,8)
WHERE Cliente_ID='' -- Inserir CPF a ser consultado como valor de Cliente_ID
;
----------------------------------------
SELECT DISTINCT sesCod,Cliente_ID,sesDataEnt,sesDataSai,sesIP,sesUASG -- sesID,sesTipo,sesSaiuSeguro,dataInclusao,dataAlteracao,sesDataInsHist,sesUASGOriginal
FROM Comprasnet_VBL.tbl_sessao_hist
WHERE (sesUASG = 0 OR sesUASGOriginal = 0) AND Cliente_ID='' AND SUBSTRING(sesDataEnt,1,4) IN ('2016','2017') -- Inserir CPF a ser consultado como valor de Cliente_ID e UASG a ser consultada
ORDER BY sesDataEnt