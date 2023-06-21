----------------------------------------------------------------- select_comprasnet

SELECT
    LPAD(p.coduasg,6,0)||'05'||LPAD(p.numprp,9,0)||LPAD(ip.ipgItem,5,0) AS COD_ITEM,
    CAST(sp.spgDescricao AS STRING) AS STATUS_1
FROM Stg_Comprasnet.dbo.tbl_Pregao AS p
LEFT JOIN Stg_Comprasnet.dbo.tbl_pregaoitem AS ip
    ON ip.prgCod = p.prgCod
INNER JOIN Stg_Comprasnet.dbo.tbb_StatusPregaoItem AS sp
    ON sp.spgCod = ip.spgCod
WHERE
    SUBSTRING(p.prgDataInclusao,1,4) >= '2020' AND
    p.prgIndEmergencial = 'S'

UNION

SELECT
    LPAD(c.COT_UASG,6,0)||'06'||LPAD(c.COT_NUMPRP,9,0)||LPAD(ic.ITC_NUMERO,5,0) AS COD_ITEM,
    CAST(sc.STA_DESCRICAO AS STRING) AS STATUS_2
FROM Stg_Comprasnet.dbo.TBL_COT_COTACAO AS c
LEFT JOIN Stg_Comprasnet.dbo.TBL_COT_ITENS_COTACAO AS ic
    ON ic.COT_CODIGO = c.COT_CODIGO
INNER JOIN Stg_Comprasnet.dbo.TBB_COT_STATUS AS sc
    ON sc.STA_CODIGO = ic.STA_CODIGO
WHERE
    SUBSTRING(c.COT_DATA_CADASTRO,1,4) >= '2020';

----------------------------------------------------------------- select_siasg_compras

SELECT
    RIGHT(REPLICATE('0', 6) + c.IT_CO_UNIDADE_GESTORA,6) + RIGHT(REPLICATE('0', 2) + c.IT_CO_MODALIDADE_LICITACAO,2) + RIGHT(REPLICATE('0', 9) + c.IT_NU_AVISO_LICITACAO,9) AS COD_COMPRA,
    RIGHT(REPLICATE('0', 6) + c.IT_CO_UNIDADE_GESTORA,6) + RIGHT(REPLICATE('0', 2) + c.IT_CO_MODALIDADE_LICITACAO,2) + RIGHT(REPLICATE('0', 9) + c.IT_NU_AVISO_LICITACAO,9) + RIGHT(REPLICATE('0', 5) + c.IT_NU_ITEM_MATERIAL,5) AS COD_ITEM,
    CASE WHEN c.IT_CO_MODALIDADE_LICITACAO = '06' AND c.IT_NU_CGC_CPF_VENCEDOR IS NOT NULL AND c.IT_DA_RESULTADO_ITEM = 0 THEN 'Encerrado' END AS STATUS_2,
    CAST(c.IT_NU_ITEM_MATERIAL AS INTEGER) AS NUM_ITEM,
    CAST(CASE WHEN c.IT_QT_MATERIAL_SERVICO IS NULL THEN IT_QT_MATERIAL_ALT ELSE c.IT_QT_MATERIAL_SERVICO END AS INTEGER) AS QUANTIDADE,
    CASE WHEN c.IT_CO_CONJUNTO_MATERIAIS = 0 THEN 'Serviço' ELSE 'Material' END AS TIPO,
    CASE WHEN c.IT_CO_CONJUNTO_MATERIAIS = 0 THEN c.IT_CO_SERVICO ELSE c.IT_CO_CONJUNTO_MATERIAIS END AS CATMAT_CATSER,
    UPPER(c.IT_TX_DESCRICAO_MATERIAL) AS ITEM_DESCRICAO,
    UPPER(c.IT_NO_UNIDADE_MEDIDA) AS UNIDADE,
    -- Casts utilizados para truncar em 10 o número de casas decimais do PRECO_UNITARIO
    CAST(CAST(((
            CASE WHEN c.IT_VA_PRECO_UNITARIO_ITEM IS NULL THEN c.IT_VA_ESTIMADO/CAST(CASE WHEN c.IT_QT_MATERIAL_SERVICO IS NULL THEN IT_QT_MATERIAL_ALT ELSE c.IT_QT_MATERIAL_SERVICO END AS INTEGER) ELSE c.IT_VA_PRECO_UNITARIO_ITEM END
        ) * power(10, 10)) AS INTEGER) as float) / POWER(10, 10) AS PRECO_UNITARIO,
    c.IT_VA_ESTIMADO AS PRECO_TOTAL,
    UPPER(c.IT_NU_CGC_CPF_VENCEDOR) AS CNPJ,
    UPPER(c.IT_NO_RAZAO_SOCIAL_VENCEDOR) AS RAZAO_SOCIAL,
    CAST(CASE WHEN(SUBSTRING(c.IT_DA_RESULTADO_ITEM,1,4)+'-'+SUBSTRING(c.IT_DA_RESULTADO_ITEM,5,2)+'-'+SUBSTRING(c.IT_DA_RESULTADO_ITEM,7,2)) IS NULL
    		  THEN SUBSTRING(c.IT_DA_TRANSACAO,1,4)+'-'+SUBSTRING(c.IT_DA_TRANSACAO,5,2)+'-'+SUBSTRING(c.IT_DA_TRANSACAO,7,2) 
    		  ELSE SUBSTRING(c.IT_DA_RESULTADO_ITEM,1,4)+'-'+SUBSTRING(c.IT_DA_RESULTADO_ITEM,5,2)+'-'+SUBSTRING(c.IT_DA_RESULTADO_ITEM,7,2) END AS DATE) AS DATA
FROM
    Stg_Siasg.siasg.SIDEC_RESULTADO_COMPRA AS c
WHERE
    SUBSTRING(c.IT_NU_AVISO_LICITACAO,-4,4) >= '2020'
    AND c.IT_CO_MODALIDADE_LICITACAO IN ('05', '06')
;
----------------------------------------------------------------- select_siasg_net

SELECT
    UPPER(vc.numeroprocesso) AS PROCESSO,
    CASE WHEN u.sisg = 'T' THEN 'SISG'
    WHEN u.sisg = 'F' THEN 'Não SISG' END AS SISG,
    UPPER(c.numerouasgresponsavel) AS COD_UASG,
    UPPER(u.nome) AS UASG,
    UPPER(o.nome) AS ORGAO,
    CASE WHEN o.codigopoder = 0 THEN 'Executivo'
    WHEN o.codigopoder = 1 THEN 'Legislativo'
    WHEN o.codigopoder = 2 THEN 'Judiciário'
    ELSE CAST(o.codigopoder AS VARCHAR(1)) END AS PODER,
    CASE WHEN o.codigoesfera = 0 THEN 'Federal'
    WHEN o.codigoesfera = 1 THEN 'Municipal'
    WHEN o.codigoesfera = 2 THEN 'Estadual'
    ELSE CAST(o.codigoesfera AS VARCHAR(1)) END AS ESFERA,
    UPPER(m.uf) AS UF,
    CASE WHEN m.nome = 'BRASÍLIA' THEN 'Brasília' ELSE m.nome END AS MUNICIPIO,
    'Pregão' AS MODALIDADE,
    CASE WHEN vcl.codigoformarealizacao = 2 THEN 'Presencial' ELSE 'Eletrônico' END AS FORMATO,
    CASE WHEN vcl.codigocaracteristicalicitacao = 2 THEN 'Registro de Preços' ELSE ' ' END AS SRP,
    CAST(c.numerocompra AS INTEGER) AS NUM_COMPRA,
    CAST(c.anocompra AS INTEGER) AS ANO_COMPRA,
    vcl.cpfresponsavelautorizacaocompra AS RESPONSAVEL_CPF,
    vcl.nomeresponsavelautorizacaocompra AS RESPONSAVEL_NOME,
    vcl.funcaoresponsavelautorizacaocompra AS RESPONSAVEL_FUNCAO,
    UPPER(vc.objeto) AS OBJETO,
    'Lei nº 13.979 (Emergência Coronavírus)' AS LEI_NOME,
    'http://compras.dados.gov.br/licitacoes/doc/licitacao/' + RIGHT(REPLICATE('0', 6) + c.numerouasgresponsavel,6) + RIGHT(REPLICATE('0', 2) + c.codigomodalidadecompra,2) + RIGHT(REPLICATE('0', 5) + c.numerocompra,5) + RIGHT(REPLICATE('0', 4) + c.anocompra,4) AS LINK_COMPRA,
    RIGHT(REPLICATE('0', 6) + c.numerouasgresponsavel,6) + RIGHT(REPLICATE('0', 2) + c.codigomodalidadecompra,2) + RIGHT(REPLICATE('0', 5) + c.numerocompra,5) + RIGHT(REPLICATE('0', 4) + c.anocompra,4) AS COD_COMPRA_SIASGNET,
    vc.codigoversaocompra
FROM
    Stg_Siasgnet.Siasgnet_dc_VBL.versaocompra AS vc
LEFT JOIN Stg_Siasgnet.Siasgnet_dc_VBL.versaocompracomlicitacao AS vcl
    ON vc.codigoversaocompra = vcl.codigoversaocompracomlicitacao
INNER JOIN Stg_Siasgnet.Siasgnet_dc_VBL.compra AS c
    ON vc.codigocompra = c.codigocompra
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.uasg AS u
    ON c.numerouasgresponsavel = u.numerouasg
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.orgao AS o
    ON u.numeroorgaouasg = o.numeroorgao
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.municipio AS m
    ON u.codigomunicipio = m.codigomunicipio
WHERE
    CONVERT(VARCHAR(10),vcl.datahoraregistro,102) > '2020-00-00'
    AND c.codigomodalidadecompra = 5
    AND vcl.covid19 = 1

UNION

SELECT
    UPPER(vc.numeroprocesso) AS PROCESSO,
    CASE WHEN u.sisg = 'T' THEN 'SISG'
    WHEN u.sisg = 'F' THEN 'Não SISG' END AS SISG,
    UPPER(c.numerouasgresponsavel) AS COD_UASG,
    UPPER(u.nome) AS UASG,
    UPPER(o.nome) AS ORGAO,
    CASE WHEN o.codigopoder = 0 THEN 'Executivo'
    WHEN o.codigopoder = 1 THEN 'Legislativo'
    WHEN o.codigopoder = 2 THEN 'Judiciário'
    ELSE CAST(o.codigopoder AS VARCHAR(1)) END AS PODER,
    CASE WHEN o.codigoesfera = 0 THEN 'Federal'
    WHEN o.codigoesfera = 1 THEN 'Municipal'
    WHEN o.codigoesfera = 2 THEN 'Estadual'
    ELSE CAST(o.codigoesfera AS VARCHAR(1)) END AS ESFERA,
    UPPER(m.uf) AS UF,
    CASE WHEN m.nome = 'BRASÍLIA' THEN 'Brasília' ELSE m.nome END AS MUNICIPIO,
    'Dispensa de Licitação' AS MODALIDADE,
    CASE WHEN c.codigopedidodispensaeletronica IS NOT NULL THEN 'Cotação Eletrônica' ELSE 'Tradicional' END AS FORMATO,
    CASE WHEN vsl.codigocaracteristicalicitacao = 2 THEN 'Registro de Preços' ELSE ' ' END AS SRP,
    CAST(c.numerocompra AS INTEGER) AS NUM_COMPRA,
    CAST(c.anocompra AS INTEGER) AS ANO_COMPRA,
    vsl.cpfresponsaveldeclaracao AS RESPONSAVEL_CPF,
    vsl.nomeresponsaveldeclaracao AS RESPONSAVEL_NOME,
    vsl.funcaoresponsaveldeclaracao AS RESPONSAVEL_FUNCAO,
    UPPER(vc.objeto) AS OBJETO,
    l.descricaocurta + ' ('+l.nomelei+')' AS LEI_NOME,
    'http://compras.dados.gov.br/compraSemLicitacao/doc/compra_slicitacao/' + RIGHT(REPLICATE('0', 6) + c.numerouasgresponsavel,6) + RIGHT(REPLICATE('0', 2) + c.codigomodalidadecompra,2) + RIGHT(REPLICATE('0', 5) + c.numerocompra,5) + RIGHT(REPLICATE('0', 4) + c.anocompra,4) AS LINK_COMPRA,
    RIGHT(REPLICATE('0', 6) + c.numerouasgresponsavel,6) + RIGHT(REPLICATE('0', 2) + c.codigomodalidadecompra,2) + RIGHT(REPLICATE('0', 5) + c.numerocompra,5) + RIGHT(REPLICATE('0', 4) + c.anocompra,4) AS COD_COMPRA_SIASGNET,
    vc.codigoversaocompra
FROM
    Stg_Siasgnet.Siasgnet_dc_VBL.versaocompra AS vc
LEFT JOIN Stg_Siasgnet.Siasgnet_dc_VBL.versaocomprasemlicitacao AS vsl
    ON vc.codigoversaocompra = vsl.codigoversaocomprasemlicitacao
INNER JOIN Stg_Siasgnet.Siasgnet_dc_VBL.compra AS c
    ON vc.codigocompra = c.codigocompra
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.uasg AS u
    ON c.numerouasgresponsavel = u.numerouasg
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.orgao AS o
    ON u.numeroorgaouasg = o.numeroorgao
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.municipio AS m
    ON u.codigomunicipio = m.codigomunicipio
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.artigo AS a
    ON vsl.codigoartigo = a.codigoartigo
INNER JOIN Stg_Siasgnet.Siasgnet_VBL.lei AS l
    ON l.codigolei = a.codigolei
WHERE
	CONVERT(VARCHAR(10),vsl.datahoraregistro,102) > '2020-00-00'
    AND c.codigomodalidadecompra = 6
    AND (l.nomelei = 'Emergência Coronavírus' OR
    UPPER(vc.objeto) LIKE '%COVID%' OR
    UPPER(vc.objeto) LIKE '%CORONA%' OR
    UPPER(vc.objeto) LIKE '%PANDEMIA%' OR
    UPPER(vc.objeto) LIKE '%ENFRENTAMENTO%' OR
    UPPER(vc.objeto) LIKE '%SARS_COV_2%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%COVID%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%CORONA%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%PANDEMIA%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%ENFRENTAMENTO%' OR
    UPPER(vsl.justificativacomprasemlicitacao) LIKE '%SARS_COV_2%')
;
   
----------------------------------------------------------------- select_siasg_contratos

SELECT
    LPAD(c.IT_CO_UNIDADE_GESTORA,6,0)||LPAD(c.IT_CO_MODALIDADE_LICITACAO,2,0)||LPAD(c.IT_NU_AVISO_LICITACAO,9,0) AS COD_COMPRA,
    UPPER(c.IT_NU_PROCESSO) AS PROCESSO_CONTRATO,
    CASE WHEN c.IT_CO_MODALIDADE_TERMO = '55' THEN 'Aditivo'
    WHEN c.IT_CO_CONTRATO = '50' THEN 'Contrato'
    WHEN c.IT_CO_CONTRATO = '51' THEN 'Credenciamento'
    WHEN c.IT_CO_CONTRATO = '52' THEN 'Comodato'
    WHEN c.IT_CO_CONTRATO = '53' THEN 'Arrendamento'
    WHEN c.IT_CO_CONTRATO = '54' THEN 'Concessão'
    ELSE c.IT_CO_CONTRATO END AS IT_CO_CONTRATO,
    CAST(SUBSTRING(LPAD(c.IT_NU_CONTRATO,9,0),1,5) AS INTEGER)||'/'||SUBSTRING(c.IT_NU_CONTRATO,-4,4) AS IT_NU_CONTRATO,
    UPPER(c.IT_NU_CGC_CPF_CONTRATADO) AS CNPJ,
    c.IT_VA_TOTAL,
    SUBSTRING(c.IT_DA_ASSINATURA,7,2)||'/'||SUBSTRING(c.IT_DA_ASSINATURA,5,2)||'/'||SUBSTRING(c.IT_DA_ASSINATURA,1,4) AS IT_DA_ASSINATURA,
    SUBSTRING(c.IT_DA_INICIO_VIGENCIA,7,2)||'/'||SUBSTRING(c.IT_DA_INICIO_VIGENCIA,5,2)||'/'||SUBSTRING(c.IT_DA_INICIO_VIGENCIA,1,4) AS IT_DA_INICIO_VIGENCIA,
    SUBSTRING(c.IT_DA_TERMINO_VIGENCIA,7,2)||'/'||SUBSTRING(c.IT_DA_TERMINO_VIGENCIA,5,2)||'/'||SUBSTRING(c.IT_DA_TERMINO_VIGENCIA,1,4) AS IT_DA_TERMINO_VIGENCIA,
    LPAD(e.IT_CO_UG_CONTRATO, 6, 0)||LPAD(e.IT_CO_GESTAO_CONTRATO, 5, 0)||e.IT_NU_EMPENHO_CONTRATO AS NOTA_EMPENHO,
    'http://www.portaltransparencia.gov.br/despesas/empenho/'||LPAD(e.IT_CO_UG_CONTRATO,6,0)||LPAD(e.IT_CO_GESTAO_CONTRATO,5,0)||e.IT_NU_EMPENHO_CONTRATO||'?ordenarPor=data&direcao=desc' AS LINK_EMPENHO,
    'http://compras.dados.gov.br/contratos/doc/contrato/'||LPAD(e.IT_CO_UG_CONTRATO,6,0)||LPAD(c.IT_CO_CONTRATO,2,0)||LPAD(c.IT_NU_CONTRATO,9,0) AS LINK_CONTRATO,
    c.IT_CO_UNIDADE_GESTORA||c.IT_CO_CONTRATO||c.IT_NU_CONTRATO AS ADITIVOS_CHAVE
FROM
    Stg_Siasg.Siasg_oracle_VBL.SIDEC_CONTRATO AS c
LEFT JOIN Stg_Siasg.Siasg_oracle_VBL.SIDEC_CONTRATO_GR_EMPENHO AS e
   ON e.ISN_SIDEC_CONTRATO = c.ISN_SIDEC_CONTRATO
WHERE
    c.IT_DA_ASSINATURA > '20200000'
    AND c.IT_CO_MODALIDADE_TERMO IS NULL
;
   
----------------------------------------------------------------- select_comprasnet_contratos

SELECT
	LPAD(c.codigo,6,0)||LPAD(codmod.descres,2,0)||LPAD(SUBSTRING(c.licitacao_numero, 1, 5),5,0)||LPAD(SUBSTRING(c.licitacao_numero, 7, 4),4,0) AS COD_COMPRA,
	REPLACE(REPLACE(REPLACE(c.processo, '/', ''), '.', ''), '-', '') AS PROCESSO_CONTRATO,
	--UPPER(codtip.descricao) AS IT_CO_CONTRATO,
    codtip.descricao AS IT_CO_CONTRATO,
	UPPER(c.numero) AS IT_NU_CONTRATO,
	REPLACE(REPLACE(REPLACE(f.cpf_cnpj_idgener, '/', ''), '.', ''), '-', '') AS CNPJ,
	CAST(c.valor_inicial AS FLOAT) AS IT_VA_TOTAL,
	SUBSTRING(c.data_assinatura, 9, 2)||'/'||SUBSTRING(c.data_assinatura, 6, 2)||'/'||SUBSTRING(c.data_assinatura, 1, 4) AS IT_DA_ASSINATURA,
	SUBSTRING(c.vigencia_inicio, 9, 2)||'/'||SUBSTRING(c.vigencia_inicio, 6, 2)||'/'||SUBSTRING(c.vigencia_inicio, 1, 4) AS IT_DA_INICIO_VIGENCIA,
	SUBSTRING(c.vigencia_fim, 9, 4)||'/'||SUBSTRING(c.vigencia_fim, 6, 2)||'/'||SUBSTRING(c.vigencia_fim, 1, 4) AS IT_DA_TERMINO_VIGENCIA,
    LPAD(c.codigo, 6, 0)||LPAD(c.gestao, 5, 0)||e.numero AS NOTA_EMPENHO, 
	'http://www.portaltransparencia.gov.br/despesas/empenho/'||LPAD(c.codigo, 6, 0)||LPAD(c.gestao, 5, 0)||e.numero||'?ordenarPor=data&direcao=desc' AS LINK_EMPENHO,
	'https://contratos.comprasnet.gov.br/transparencia/contratos/'||c.id_1 AS LINK_CONTRATO,
	'' AS ADITIVOS_CHAVE,
    (SELECT COUNT(DISTINCT h.id)
        FROM ComprasnetContrato_vbl.contratohistorico h
        WHERE c.id_1 = h.contrato_id AND h.tipo_id = 65
        GROUP BY c.id_1) AS ADITIVOS
FROM
	ComprasnetContrato_vbl.contratos c
	JOIN ComprasnetContrato_vbl.codigoitens codmod ON codmod.id = c.modalidade_id 
	JOIN ComprasnetContrato_vbl.codigoitens codtip ON codtip.id = c.tipo_id
	JOIN ComprasnetContrato_vbl.fornecedores f ON f.id = c.fornecedor_id
	JOIN ComprasnetContrato_vbl.contratoempenhos ce ON ce.contrato_id = c.id_1
	JOIN ComprasnetContrato_vbl.empenhos e ON ce.empenho_id = e.id
;
   
----------------------------------------------------------------- select_siasg_aditivos

SELECT
    c.IT_CO_UNIDADE_GESTORA||c.IT_CO_CONTRATO||c.IT_NU_CONTRATO AS ADITIVOS_CHAVE,
    COUNT(DISTINCT c.IT_CO_UNIDADE_GESTORA||c.IT_CO_CONTRATO||c.IT_NU_CONTRATO) AS ADITIVOS
FROM
    Stg_Siasg.Siasg_oracle_VBL.SIDEC_CONTRATO AS c
LEFT JOIN Stg_Siasg.Siasg_oracle_VBL.SIDEC_CONTRATO_GR_EMPENHO AS e
   ON e.ISN_SIDEC_CONTRATO = c.ISN_SIDEC_CONTRATO
WHERE
    c.IT_DA_ASSINATURA > '20200000'
    AND c.IT_CO_MODALIDADE_TERMO IS NOT NULL
    GROUP BY c.IT_CO_UNIDADE_GESTORA||c.IT_CO_CONTRATO||c.IT_NU_CONTRATO
;
   
----------------------------------------------------------------- 