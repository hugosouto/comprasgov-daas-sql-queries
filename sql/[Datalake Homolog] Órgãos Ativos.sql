SELECT 
--  ID_UNDD_SIT_ATUAL_UNIDADE
--, DS_UNDD_SIT_ATUAL_UNIDADE
 ID_UNDD_ORGAO
, DS_UNDD_ORGAO
--, ID_UNDD_ESFERA
, DS_UNDD_ESFERA
--, ID_UNDD_PODER
, DS_UNDD_PODER
--, ID_LCAL_REGIAO
, DS_LCAL_REGIAO
--, ID_LCAL_UF
--, DS_LCAL_UF
--, ID_LCAL_MUNICIPIO
, DS_LCAL_MUNICIPIO
--, it_in_status
--, it_co_municipio
--, co_ibge
--, co_uf_ibge
--, co_mun_ibge
--, capital
--, nome_mun_ibge
, nome_mun_siasg
--, nome_mun_siasg_acent
--, uf
--, sg_uf
--, regiao
--, sg_regiao
, pop_est_2020
--, latitude
--, longitude
FROM seges_delog_cgscg_stage.dbo.orgaos_ativos oa
JOIN seges_delog_cgscg_stage.dbo.siasg_mun_ibge m ON oa.ID_LCAL_MUNICIPIO = m.it_co_municipio
WHERE ID_UNDD_ESFERA NOT IN (3)
;