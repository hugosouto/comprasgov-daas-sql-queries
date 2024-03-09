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
	CASE PRG.prgIndSRP WHEN 'N' THEN 'pregão' ELSE 'SRP' END AS tipo_pregao,	
	CAST(prit.ipgItem AS INTEGER) AS item,
	UPPER(prit.ipgDescricao) AS descricao,
	CAST(prit.ipgQuantidade AS INTEGER) AS qtd,
	CAST(ipr.ippIndAdjudicado AS VARCHAR) AS status_item,
	CAST(prit.ipgDecisaoHomologacao AS VARCHAR) AS decisao_homologacao,
	IFNULL(ipr.ippValNegAdj,ipr.ippLanceMin) AS valor_homologado,
	CASE prg.prgStatus 
		WHEN 0 THEN 'fechado' 
		WHEN 1 THEN 'aberto'
		WHEN 2 THEN 'homologado'
		WHEN 3 THEN 'suspenso'
		ELSE 'deserto' END AS status_pregao,
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
	AND SUBSTRING(prg.prgDataAbertura,1,10) >= '2020-10-01' 
	AND prit.ipgItem > 0
	AND pr.prpCNPJ LIKE 'ESTRANG%'
;