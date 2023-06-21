-- Inativas [Meta de redução de 20% em relação a 01/06/2020]:

SELECT
    IT_CO_UNIDADE_GESTORA     	as COD_UNIDADE_GESTORA,
    IT_SG_UF					as UF_INATIVAS,
    IT_DA_MOVIMENTO         	as DATA_MOVIMENTO
FROM "Stg_Siasg".siasg."siasg_unidade_gestora"
WHERE
    IT_IN_STATUS <> ''
    and IT_DA_MOVIMENTO > '20200601'
    and IT_IN_USO_SISG_UASG = 'S';

   
   
-- Cadastradas:

SELECT
    IT_CO_UNIDADE_GESTORA    	as COD_UNIDADE_GESTORA,
    IT_SG_UF					as UF_ATIVAS,
    IT_DA_IMPLANTACAO_SIDEC    	as DATA_IMPLANTACAO_SIDEC
FROM
    "Stg_Siasg".siasg."siasg_unidade_gestora"
WHERE
    IT_IN_STATUS = ''
    and IT_DA_IMPLANTACAO_SIDEC > '20200601'
    and IT_IN_USO_SISG_UASG = 'S';
    
   
   
-- KPIs

select distinct IT_CO_UNIDADE_GESTORA
from  "Stg_Siasg".siasg."siasg_unidade_gestora" s
where it_in_uso_sisg_uasg ='S'
and it_in_status = ''
and it_da_implantacao_sidec < '20200601';

(select distinct *
from  "Stg_Siasg".siasg."siasg_unidade_gestora" s
where it_in_uso_sisg_uasg ='S'
and it_in_status != ''
and it_da_implantacao_sidec < '20200601'
and it_da_movimento >='20200601'));

select
	((select count(*)
		from "Stg_Siasg".siasg."siasg_unidade_gestora" s
			join "Stg_Siasg".siasg."orgaos"
		where it_in_uso_sisg_uasg ='S'
		and it_in_status is null
		and it_da_implantacao_sidec < '20200601') +
	(select count(*)
		from  "Stg_Siasg".siasg."siasg_unidade_gestora" s
		where it_in_uso_sisg_uasg ='S'
		and it_in_status is not null
		and it_da_implantacao_sidec < '20200601'
		and it_da_movimento >='20200601')) * 0.2 as kpi
--from "Stg_Siasg".siasg."siasg_unidade_gestora" s