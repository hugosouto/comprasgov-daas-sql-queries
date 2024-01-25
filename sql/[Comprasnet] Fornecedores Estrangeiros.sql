---------- Consulta Original ---------- 
SELECT 
	LPAD(prg.coduasg,6,'0')||'05'||LPAD(prg.numprp,9,'0')||LPAD(prit.ipgItem,3,'0') AS cod_item,
	LPAD(prg.numprp,9,'0') AS licitacao,
	--SUBSTRING(prg.prgDataAbertura,1,10) AS data_abert,
	CAST(prg.prgDataAbertura AS TIMESTAMP) AS data_abert,
	CAST(prg.prgDataEncerramento AS TIMESTAMP) AS data_encer,
	SUBSTRING(prg.prgDataAbertura,1,4) AS ano_abert,
	SUBSTRING(prg.prgDataAbertura,6,2) AS mes_abert,
	CAST(prg.coduasg AS INTEGER) AS cod_uasg,
	CAST(ug.nomuasg AS VARCHAR) AS uasg,
	CAST(ug.NomeOrgao AS VARCHAR) AS orgao,
	TRIM(prg.prgObjeto) AS objeto,
	mu.nommun AS municipio,
	mu.codUF AS uf,
	prg.prgProcesso AS n_processo,
	CASE PRG.prgIndSRP WHEN 'N' THEN 'Pregão' ELSE 'SRP' END AS tipo_pregao,	
	CAST(prit.ipgItem AS INTEGER) AS item,
	UPPER(prit.ipgDescricao) AS descricao,
	CAST(prit.ipgQuantidade AS INTEGER) AS qtd,
	CAST(ipr.ippIndAdjudicado AS VARCHAR) AS status_item,
	CAST(prit.ipgDecisaoHomologacao AS VARCHAR) AS decisao_homologacao,
	IFNULL(ipr.ippValNegAdj,ipr.ippLanceMin) AS valor_homologado,
	CASE prg.prgStatus 
		WHEN 0 THEN 'Fechado' 
		WHEN 1 THEN 'Aberto'
		WHEN 2 THEN 'Homologado'
		WHEN 3 THEN 'Suspenso'
		ELSE 'Deserto' END AS status_pregao,
	UPPER(pr.prpCNPJ) AS cod_fornecedor,
	UPPER(pr.prpRazaoSocial) AS fornecedor,
	(SELECT COUNT(DISTINCT pr.prpCNPJ)
		FROM Comprasnet_VBL.tbl_proposta AS pr
		WHERE pr.prgCod = prg.prgCod)
		AS qtd_forn_partic,		 
	(SELECT COUNT(DISTINCT pr.prpCNPJ) 
		FROM Comprasnet_VBL.tbl_proposta AS pr
		WHERE pr.prgCod = prg.prgCod AND pr.prpCNPJ LIKE 'ESTRANG%')
		AS qtd_part_estr,
	'http://www.comprasnet.gov.br/livre/pregao/ata2.asp?co_no_uasg='||LPAD(prg.coduasg,6,'0')||'&numprp='||prg.numprp||'&Seq=1' AS link,
	TRIM(st.spgDescricao) AS situacao_atual_item,
	CAST(ipr.dataInclusao AS TIMESTAMP) data_inclusao,
	CAST(ipr.dataAlteracao AS TIMESTAMP) AS data_alteracao,
	ipr.ippCod
FROM Comprasnet_VBL.tbl_propostaItem AS ipr
	INNER JOIN Comprasnet_VBL.tbl_proposta AS pr			ON ipr.prpCod = pr.prpCod
	INNER JOIN Comprasnet_VBL.tbl_pregaoitem AS prit		ON ipr.ipgCod = prit.ipgCod
	INNER JOIN Comprasnet_VBL.tbl_pregao AS prg				ON prit.prgCod = prg.prgCod
	INNER JOIN Comprasnet_VBL.tbb_StatusPregaoItem AS st	ON prit.spgCod = st.spgCod
	INNER JOIN Comprasnet_VBL.tb_uasg AS ug 				ON prg.coduasg = ug.coduasg
	INNER JOIN Comprasnet_VBL.tb_municipio AS mu 			ON ug.codMunic = mu.codmun 
WHERE 1=1
	AND SUBSTRING(prg.prgDataAbertura,1,10) BETWEEN '2020-01-01' AND '2021-01-01'
	AND prit.ipgItem > 0
	AND SUBSTRING(pr.prpCNPJ, 1, 7) = 'ESTRANG'
--	AND pr.prpCNPJ LIKE 'ESTRANG%'
;

---------- Consulta Específica ----------
SELECT -- prg.prgCod,
	 LPAD(prg.coduasg,6,'0')||'05'||LPAD(prg.numprp,9,'0')								CodigoCompra
	,LPAD(prg.coduasg,6,'0')||'05'||LPAD(prg.numprp,9,'0')||LPAD(prit.ipgItem,3,'0')	CodigoItem
	,'Pregão'																			Modalidade
	,ug.CodOrgao																		CodigoOrgao
	,ug.NomeOrgao																		NomeOrgao
	,prg.coduasg																		CodigoUasg
	,ug.nomuasg																			NomeUasg
	,mu.codUF																			UfUnidade
	,prg.numprp 																		LicitacaoAno
	,TRIM(prg.prgObjeto)																Objeto
	,UPPER(prit.ipgDescricao)															Descricao
--	,CAST(prit.ipgQuantidade AS INTEGER)												Quantidade
--	,CAST(ipr.ippIndAdjudicado AS VARCHAR)												StatusItem
--	,CAST(prit.ipgDecisaoHomologacao AS VARCHAR)										DecisaoHomologacao
	,UPPER(pr.prpCNPJ)																	CodigoFornecedor
	,UPPER(pr.prpRazaoSocial)															Fornecedor
	,CASE prg.prgStatus 
		WHEN 0 THEN 'Fechado' 
		WHEN 1 THEN 'Aberto'
		WHEN 2 THEN 'Homologado'
		WHEN 3 THEN 'Suspenso'
		ELSE 'Deserto' END																StatusPregao
	,CASE ipr.ippIndAdjudicado WHEN 'S' THEN 'Sim' ELSE 'Não' END						IndicadorAdjudicacao
	,prg.prgDataAbertura																DataAbertura
	,prgDataEncerramento 																DataEnceramento
	,SUM(ipr.ippValor)																	ValorEstimado
	,CASE ipr.ippIndAdjudicado 
		WHEN 'S' THEN SUM(IFNULL(ipr.ippValNegAdj,ipr.ippLanceMin))						
		ELSE NULL END 																	ValorHomologado
FROM Comprasnet_VBL.tbl_propostaItem AS ipr
	INNER JOIN Comprasnet_VBL.tbl_proposta AS pr			ON ipr.prpCod = pr.prpCod
	INNER JOIN Comprasnet_VBL.tbl_pregaoitem AS prit		ON ipr.ipgCod = prit.ipgCod
	INNER JOIN Comprasnet_VBL.tbl_pregao AS prg				ON prit.prgCod = prg.prgCod
	INNER JOIN Comprasnet_VBL.tbb_StatusPregaoItem AS st	ON prit.spgCod = st.spgCod
	INNER JOIN Comprasnet_VBL.tb_uasg AS ug 				ON prg.coduasg = ug.coduasg
	INNER JOIN Comprasnet_VBL.tb_municipio AS mu 			ON ug.codMunic = mu.codmun 
WHERE 1=1
--	AND SUBSTRING(prg.prgDataAbertura,1,10) < '2021-01-01'
	AND prit.ipgItem > 0
--	AND prg.prgCod=871557
	AND SUBSTRING(pr.prpCNPJ, 1, 7) = 'ESTRANG'
GROUP BY prg.coduasg, prg.numprp, prit.ipgItem, prg.prgDataAbertura, prg.prgDataEncerramento, ug.CodOrgao, ug.NomeOrgao, ug.nomuasg, mu.coduf, prg.prgObjeto, prg.prgIndSRP, prit.ipgDescricao, pr.prpCNPJ, pr.prpRazaoSocial, prg.prgStatus, ipr.ippIndAdjudicado
ORDER BY CodigoItem
;

---------- Consulta Específica Simplificada ----------
SELECT
	 SUBSTRING(prg.prgDataAbertura, 1, 4)					AnoAbertura
	,SUBSTRING(prgDataEncerramento, 1, 4)					AnoEnceramento
	,'Pregão'												Modalidade
	,prg.numprp 											LicitacaoAno
	,prg.coduasg											CodigoUasg
	,ug.nomuasg												NomeUasg
	,mu.codUF												UfUnidade
	,ug.CodOrgao											CodigoOrgao
	,ug.NomeOrgao											NomeOrgao
	,TRIM(prg.prgObjeto)									Objeto
	,CASE prg.prgIndSRP 
		WHEN 'N' THEN 'Tradicional' 
		ELSE 'Registro de Preço (SRP)' END 		TipoPregao
	,CASE prg.prgStatus 
		WHEN 0 THEN 'Fechado' 
		WHEN 1 THEN 'Aberto'
		WHEN 2 THEN 'Homologado'
		WHEN 3 THEN 'Suspenso'
		ELSE 'Deserto' END									StatusLicitação
	,SUM(prit.ipgValorRef)									ValorEstimado
	,SUM(IFNULL(ipr.ippValNegAdj,ipr.ippLanceMinClassif))	ValorHomologado
	,(SELECT COUNT(DISTINCT pr.prpCNPJ)
		FROM Comprasnet_VBL.tbl_proposta AS pr		
		WHERE pr.prgCod = prg.prgCod)						QuantidadeParticipantes	 
	,(SELECT COUNT(DISTINCT pr.prpCNPJ) 
		FROM Comprasnet_VBL.tbl_proposta AS pr
		WHERE pr.prgCod = prg.prgCod 
		AND SUBSTRING(pr.prpCNPJ, 1, 7) = 'ESTRANG')		QuantidadeParticipantesEstrangeiros
FROM Comprasnet_VBL.tbl_propostaItem AS ipr
	INNER JOIN Comprasnet_VBL.tbl_proposta AS pr		ON ipr.prpCod = pr.prpCod
	INNER JOIN Comprasnet_VBL.tbl_pregaoitem AS prit	ON ipr.ipgCod = prit.ipgCod
	INNER JOIN Comprasnet_VBL.tbl_pregao AS prg			ON prit.prgCod = prg.prgCod
	INNER JOIN Comprasnet_VBL.tb_uasg AS ug 			ON prg.coduasg = ug.coduasg
	INNER JOIN Comprasnet_VBL.tb_municipio AS mu 		ON ug.codMunic = mu.codmun 
WHERE 1=1
	AND SUBSTRING(prg.prgDataAbertura,1,10) < '2021-01-01'
	AND prit.ipgItem > 0
	AND SUBSTRING(pr.prpCNPJ, 1, 7) = 'ESTRANG'
GROUP BY
	prg.prgDataAbertura, prg.prgDataEncerramento, prg.numprp, prg.coduasg, ug.nomuasg, mu.coduf, ug.CodOrgao, ug.NomeOrgao, prg.prgObjeto, prg.prgIndSRP, prg.prgCod, prg.prgStatus
ORDER BY prg.prgCod
;






SELECT DISTINCT pr.prpCNPJ,pr.prpRazaoSocial
FROM
	Comprasnet_VBL.tbl_proposta pr,
	Comprasnet_VBL.tbl_pregao prg,
	Comprasnet_VBL.tbl_pregaoitem prit,
	Comprasnet_VBL.tbl_propostaItem ipr
WHERE 1=1
	AND ipr.ipgCod = prit.ipgCod
	AND pr.prgCod = prg.prgCod
	AND prg.prgCod=871557
	AND prit.ipgItem > 0
	AND SUBSTRING(pr.prpCNPJ,1,7)='ESTRANG'
;