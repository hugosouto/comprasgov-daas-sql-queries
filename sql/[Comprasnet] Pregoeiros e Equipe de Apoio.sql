SELECT 
	pesCod,
	pesCPF,
	pesNome,
	codUASG,
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END Status,
	CASE pesPerfil
		WHEN '1' THEN 'Pregoeiro/Agente de Contratação'
		WHEN '2' THEN 'Apoio'
		WHEN '3' THEN 'Pregoeiro/Agente de Contratação / Apoio'
		ELSE pesPerfil END Perfil,
	pesDataValidade,
	pesDataValidadeApoio,
	dtInclusao,
	dtAlteracao
FROM Comprasnet_VBL.tbl_Pessoas
WHERE pesNome LIKE ('HUGO MEDEIROS SOUTO')
;

SELECT 
--	pesCPF,
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END Status,
	CASE pesPerfil
		WHEN '1' THEN 'Pregoeiro/Agente de Contratação'
		WHEN '2' THEN 'Apoio'
		WHEN '3' THEN 'Pregoeiro/Agente de Contratação / Apoio'
		ELSE pesPerfil END Perfil,
	COUNT(DISTINCT pesCPF) contaCPF
FROM Comprasnet_VBL.tbl_Pessoas
--WHERE pesNome LIKE ('HUGO MEDEIROS SOUTO')
GROUP BY 
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END,
	CASE pesPerfil
		WHEN '1' THEN 'Pregoeiro/Agente de Contratação'
		WHEN '2' THEN 'Apoio'
		WHEN '3' THEN 'Pregoeiro/Agente de Contratação / Apoio'
		ELSE pesPerfil END
;

---------------------------------------------------------------

SELECT COUNT(DISTINCT codPregoeiro)
FROM Comprasnet_VBL.tbl_Pregao
WHERE prgModoDisputa IS NULL
;

SELECT
--	pesCPF,
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END Status,
	CASE pesPerfil
		WHEN '1' THEN 'Pregoeiro/Agente de Contratação'
		WHEN '2' THEN 'Apoio'
		WHEN '3' THEN 'Pregoeiro/Agente de Contratação / Apoio'
		ELSE pesPerfil END Perfil,
	COUNT(DISTINCT pesCPF) contaCPF
FROM Comprasnet_VBL.tbl_Pessoas pe
JOIN Comprasnet_VBL.tbl_Pregao pr ON pe.pesCod = pr.codPregoeiro 
WHERE prgModoDisputa IS NOT NULL
GROUP BY 
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END,
	CASE pesPerfil
		WHEN '1' THEN 'Pregoeiro/Agente de Contratação'
		WHEN '2' THEN 'Apoio'
		WHEN '3' THEN 'Pregoeiro/Agente de Contratação / Apoio'
		ELSE pesPerfil END
;

SELECT
--	pesCPF,
--	CASE WHEN prgModoDisputa IS NULL THEN '8.666/93'
--		 WHEN prgModoDisputa IS NOT NULL THEN '14.133/21'
--		 ELSE prgModoDisputa END Lei,
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END Status,
--	CASE pesPerfil
--		WHEN '1' THEN 'Pregoeiro'
--		WHEN '2' THEN 'Apoio'
--		WHEN '3' THEN 'Pregoeiro / Apoio'
--		ELSE pesPerfil END Perfil,
	COUNT(DISTINCT pesCPF) contaCPF
FROM Comprasnet_VBL.tbl_Pessoas pe
JOIN Comprasnet_VBL.tbl_Pregao pr ON pe.pesCod = pr.codPregoeiro OR pe.pesCod = pr.codMembro1 OR pe.pesCod = pr.codMembro2 OR pe.pesCod = pr.codMembro3  
--WHERE prgModoDisputa IS NOT NULL
--WHERE pesDataValidadeApoio >= '2022-11-01 00:00:00' OR pesDataValidade >= '2022-11-01 00:00:00' 
GROUP BY 
--	CASE WHEN prgModoDisputa IS NULL THEN '8.666/93'
--		 WHEN prgModoDisputa IS NOT NULL THEN '14.133/21'
--		 ELSE prgModoDisputa END,
	CASE pesStatus
		WHEN 1 THEN 'Ativo'
		WHEN 2 THEN 'Inativo'
		ELSE pesStatus END
--		,
--	CASE pesPerfil
--		WHEN '1' THEN 'Pregoeiro'
--		WHEN '2' THEN 'Apoio'
--		WHEN '3' THEN 'Pregoeiro / Apoio'
--		ELSE pesPerfil END
;
