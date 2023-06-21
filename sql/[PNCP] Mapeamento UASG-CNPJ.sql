SELECT un.codigounidade, 
       org.cnpj 
FROM unidadeorgao un
JOIN orgao org
ON un.orgaoid = org.id
ORDER BY un.codigounidade