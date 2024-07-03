WITH PregaoData AS (
SELECT 
    pri.ipgCod AS cod_pregao_item,
    pr.prgCod AS cod_pregao,
    pr.coduasg AS cod_uasg,
    u.uf AS uf_uasg,
    u.codOrgao AS cod_orgao,
    pr.numprp AS num_pregao,
    pri.ipgItem AS num_item,
    pr.prgDataAbertura AS dt_hr_abertura_sp,
    pri.ipgIdentMat AS tp_material,
    pri.codmat AS cod_material,
    CASE
        WHEN pri.ipgIdentMat = 'M' AND im.CODIGO_PDM IS NOT NULL THEN im.CODIGO_PDM
        WHEN pri.ipgIdentMat = 'M' AND im.CODIGO_PDM IS NULL THEN im2.CODIGO_PDM
        WHEN pri.ipgIdentMat = 'S' THEN sv.codgrpserv
        ELSE pri.codmat
    END AS cod_pdm_grupo,
    pri.ipgQuantidade AS qt_item,
    pr.prgStatus AS cod_status_pregao, -- 0 – fechado / 1 – aberto / 2 – homologado / 3 – suspenso / 4 – deserto 
    CASE 
        WHEN pri.ipgCodGrupo IS NOT NULL THEN True 
        ELSE False 
    END AS in_agrupado,
    pri.ipgTipoBeneficio AS cod_beneficio, -- 0 – sem benefício / 1 – exclusividade para ME/EPP / 2 – subcontratação de fornecedores / 3 – cota exclusiva
    COUNT(DISTINCT ppi.prpCod) AS qt_propostas,
    CASE 
        WHEN COUNT(DISTINCT ppi.prpCod) = 1 THEN True 
        ELSE False 
    END AS in_sem_competicao,
    CASE 
        WHEN COUNT(DISTINCT ppi.prpCod) = 0 THEN True 
        ELSE False 
    END AS in_deserto,
    u.nomuasg AS nom_uasg,
    o.NomeOrgao AS nom_orgao,
    pri.ipgValorRef AS valor_total
FROM Comprasnet.tbl_pregaoitem pri
JOIN Comprasnet.tbl_Pregao pr ON pri.prgCod = pr.prgCod
LEFT JOIN Comprasnet.tbl_PropostaItem ppi ON ppi.ipgCod = pri.ipgCod
LEFT JOIN Comprasnet.tbl_Proposta pp ON pr.prgCod = pp.prgCod
LEFT JOIN Comprasnet.tb_itens_material im ON im.CODIGO_MATERIAL = pri.codmat
LEFT JOIN Comprasnet.tb_itens_material im2 ON im2.CODIGO_PDM = pri.codmat
LEFT JOIN Comprasnet.tb_servico sv ON sv.codserv = pri.codmat
LEFT JOIN Comprasnet.tbb_StatusPregaoItem spi ON spi.spgCod = pri.spgCod
LEFT JOIN Comprasnet.tb_uasg u ON u.coduasg = pr.coduasg
JOIN Comprasnet.tb_orgao o ON o.codOrgao = u.codOrgao
WHERE 1=1
    AND pri.ipgItem > 0
    AND prgDataAbertura BETWEEN '2023-00-00 00:00:00' AND '2024-00-00 00:00:00'
    AND pr.prgStatus IN (2, 4) -- 2: homologado
    AND pri.spgCod IN (6, 9) -- 6: Cancelado | 9: Homologado
    GROUP BY 
        pr.prgCod, pr.coduasg, pr.numprp, pr.prgDataAbertura, pr.prgModoDisputa, pri.ipgCod, pri.ipgItem, pri.codmat, pri.ipgIdentMat, pri.ipgQuantidade, pri.ipgCodGrupo, pri.ipgTipoBeneficio, pr.prgStatus, 
        im.CODIGO_PDM, im2.CODIGO_PDM, sv.codgrpserv, pri.spgCod, spi.spgDescricao, u.nomuasg, u.CodOrgao, u.uf, o.NomeOrgao, pri.ipgValorRef
)
SELECT 
    SUM(CASE WHEN in_sem_competicao = True THEN 1 ELSE 0 END) * 100.0 / COUNT (in_sem_competicao) AS qt_sem_competicao_true,
    SUM(CASE WHEN in_sem_competicao = False THEN 1 ELSE 0 END) * 100.0 / COUNT (in_sem_competicao) AS qt_sem_competicao_false,
    SUM(CASE WHEN in_deserto = True THEN 1 ELSE 0 END) * 100.0 / COUNT (in_deserto) AS qt_deserto_true,
    SUM(CASE WHEN in_deserto = False THEN 1 ELSE 0 END) * 100.0 / COUNT (in_deserto) AS qt_deserto_false
FROM PregaoData;