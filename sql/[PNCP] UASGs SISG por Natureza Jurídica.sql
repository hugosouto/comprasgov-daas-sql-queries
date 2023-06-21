SELECT DISTINCT
	o.cnpj,
	un.orgaoid,
	o.razaosocial
FROM unidadeorgao un
JOIN orgao o ON un.orgaoid = o.id
JOIN naturezajuridica nj ON nj.id = o.naturezajuridica
JOIN usuario us ON us.id = o.usuarioid
WHERE naturezajuridica IN ('1015','1104','1139','1252')
ORDER BY o.cnpj