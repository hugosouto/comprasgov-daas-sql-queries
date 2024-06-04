select
	a14.ID_ITCP_TP_MATERIAL_SERVICO  	ID_ITCP_TP_MATERIAL_SERVICO,
	a18.DS_ITCP_TP_MATERIAL_SERVICO  	DS_ITCP_TP_MATERIAL_SERVICO,
	a14.ID_ITCP_GRUPO_MATERIAL  		ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL  		DS_ITCP_GRUPO_MATERIAL,
	a14.ID_ITCP_CLASSE_MAT_SERV  		ID_ITCP_CLASSE_MAT_SERV,
	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT  	DS_ITCP_CLASSE_MAT_SERV,
	a15.DS_ITCP_CLASSE_MAT_SERV 		DS_ITCP_CLASSE_MAT_SERV0,
	a14.ID_ITCP_PADRAO_DESC_MAT  		ID_ITCP_PADRAO_DESC_MAT,
	a16.DS_ITCP_PADRAO_DESC_MAT  		DS_ITCP_PADRAO_DESC_MAT,
	a14.ID_ITCP_TP_COD_MAT_SERV  		ID_ITCP_TP_COD_MAT_SERV,
	a14.ID_ITCP_MATERIAL_SERVICO  		ID_ITCP_MATERIAL_SERVICO,
	a14.DS_ITCP_MATERIAL_SERVICO  		DS_ITCP_MATERIAL_SERVICO,
	a14.ID_ITCP_SIT_ATUAL_MAT_SERV  	ID_ITCP_SIT_ATUAL_MAT_SERV,
	a17.DS_ITCP_SIT_ATUAL_MAT_SERV 		DS_ITCP_SIT_ATUAL_MAT_SERV
from Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	join Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV a15 on (a14.ID_ITCP_CLASSE_MAT_SERV = a15.ID_ITCP_CLASSE_MAT_SERV)
	join Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT a16 on (a14.ID_ITCP_PADRAO_DESC_MAT = a16.ID_ITCP_PADRAO_DESC_MAT)
	join Siasg_DW_VBL.D_ITCP_SIT_ATUAL_MAT_SERV a17 on (a14.ID_ITCP_SIT_ATUAL_MAT_SERV = a17.ID_ITCP_SIT_ATUAL_MAT_SERV)
	join Siasg_DW_VBL.D_ITCP_TP_MATERIAL_SERVICO a18 on (a14.ID_ITCP_TP_MATERIAL_SERVICO = a18.ID_ITCP_TP_MATERIAL_SERVICO)
	join Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a19 on (a14.ID_ITCP_GRUPO_MATERIAL = a19.ID_ITCP_GRUPO_MATERIAL)
where 1=1
	and a14.ID_ITCP_TP_MATERIAL_SERVICO = 1
	and (
		a19.DS_ITCP_GRUPO_MATERIAL like '%FERROV%' or a19.DS_ITCP_GRUPO_MATERIAL like '%_NIBUS%' or a19.DS_ITCP_GRUPO_MATERIAL like 'TRATOR%' or a19.DS_ITCP_GRUPO_MATERIAL like '%TERRAPL%'
		or a15.DS_ITCP_CLASSE_MAT_SERV like '%FERROV%' or a15.DS_ITCP_CLASSE_MAT_SERV like '%_NIBUS%' or a15.DS_ITCP_CLASSE_MAT_SERV like 'TRATOR%' or a15.DS_ITCP_CLASSE_MAT_SERV like '%TERRAPL%' 
		or a16.DS_ITCP_PADRAO_DESC_MAT like '%FERROV%' or a16.DS_ITCP_PADRAO_DESC_MAT like '%_NIBUS%' or a16.DS_ITCP_PADRAO_DESC_MAT like 'TRATOR%' or a16.DS_ITCP_PADRAO_DESC_MAT like '%TERRAPL%'
--		or a14.DS_ITCP_MATERIAL_SERVICO like '%FERROV%' or a14.DS_ITCP_MATERIAL_SERVICO like '%_NIBUS%' or a14.DS_ITCP_MATERIAL_SERVICO like 'TRATOR%' or a14.DS_ITCP_MATERIAL_SERVICO like '%TERRAPL%'
		)
	and a14.ID_ITCP_GRUPO_MATERIAL NOT IN (25, 26, 62,91) 
--		25	COMPONENTES DE VEÍCULOS
--		26	PNEUS E CÂMARAS DE AR
--		62	EQUIPAMENTOS DE ILUMINAÇÃO E LÂMPADAS
--		71	MOBILIÁRIOS
--		91	COMBUSTÍVEIS, LUBRIFICANTES, ÓLEOS E CERAS
group by	
	a14.ID_ITCP_TP_MATERIAL_SERVICO,
	a18.DS_ITCP_TP_MATERIAL_SERVICO,
	a14.ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL,
	a14.ID_ITCP_CLASSE_MAT_SERV,
	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT,
	a15.DS_ITCP_CLASSE_MAT_SERV,
	a14.ID_ITCP_PADRAO_DESC_MAT,
	a14.ID_ITCP_TP_COD_MAT_SERV,
	a16.DS_ITCP_PADRAO_DESC_MAT,
	a14.DS_ITCP_MATERIAL_SERVICO,
	a14.ID_ITCP_MATERIAL_SERVICO,
	a14.ID_ITCP_SIT_ATUAL_MAT_SERV,
	a17.DS_ITCP_SIT_ATUAL_MAT_SERV
order by
	a18.DS_ITCP_TP_MATERIAL_SERVICO,
	a19.DS_ITCP_GRUPO_MATERIAL,
	a15.DS_ITCP_CLASSE_MAT_SERV,
	a16.DS_ITCP_PADRAO_DESC_MAT,
	a14.DS_ITCP_MATERIAL_SERVICO,
	a17.DS_ITCP_SIT_ATUAL_MAT_SERV