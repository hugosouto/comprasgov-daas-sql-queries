SELECT DISTINCT justificativaanalise/*SUBSTRING(justificativaanalise, 1, 100)*/, SUBSTRING(dataanaliseprocesso,1,4) dataanaliseprocesso, COUNT(*) contagem, COUNT(*)/CAST((SELECT COUNT(*) FROM credenciamento WHERE statuscredenciamentoid=2 AND SUBSTRING(dataanaliseprocesso,1,4) = 2024) AS FLOAT) percentual 
FROM credenciamento
WHERE statuscredenciamentoid=2 AND SUBSTRING(dataanaliseprocesso,1,4) = 2024
GROUP BY justificativaanalise /*SUBSTRING(justificativaanalise, 1, 100)*/, SUBSTRING(dataanaliseprocesso,1,4)
--HAVING COUNT(*) > 50
ORDER BY 3 DESC
;