select distinct
(select distincount (*)
from  "Siasg".Siasg_VBL."SIASG_UNIDADE_GESTORA" s
where IT_IN_USO_SISG_UASG = 'S'
and IT_IN_STATUS IS NULL
and IT_DA_IMPLANTACAO_SIDEC < '20200601'),
(select count(*)
from  "Siasg".Siasg_VBL."SIASG_UNIDADE_GESTORA" s
where IT_IN_USO_SISG_UASG = 'S'
and IT_IN_STATUS IS NOT NULL
and IT_DA_IMPLANTACAO_SIDEC < '20200601'
and IT_DA_MOVIMENTO >='20200601')
from  "Siasg".Siasg_VBL."SIASG_UNIDADE_GESTORA" s;

SELECT DISTINCT (
	(select count(*)
		from "Siasg".Siasg_VBL."SIASG_UNIDADE_GESTORA" s
		where it_in_uso_sisg_uasg = 'S'
		and it_in_status is null
		and it_da_implantacao_sidec < '20200700') +
	(select count(*)
		from "Siasg".Siasg_VBL."SIASG_UNIDADE_GESTORA" s
		where it_in_uso_sisg_uasg = 'S'
		and it_in_status is not null
		and it_da_implantacao_sidec < '20200700'
		and it_da_movimento >='20200700')
) BASE_KPI
from "Siasg".Siasg_VBL."SIASG_UNIDADE_GESTORA" s;