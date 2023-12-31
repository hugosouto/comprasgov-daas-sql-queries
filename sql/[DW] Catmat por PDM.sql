select
	a14.ID_ITCP_TP_MATERIAL_SERVICO  	TipoCod,
	a18.DS_ITCP_TP_MATERIAL_SERVICO  	Tipo,
	a14.ID_ITCP_GRUPO_MATERIAL  		GrupoCod,
	a19.DS_ITCP_GRUPO_MATERIAL  		Grupo,
	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT  	ClasseCod,
	a15.DS_ITCP_CLASSE_MAT_SERV 		Classe,
	a14.ID_ITCP_PADRAO_DESC_MAT  		PDMCod,
	a16.DS_ITCP_PADRAO_DESC_MAT  		PDM,
	a14.ID_ITCP_MATERIAL_SERVICO  		ItemCod,
	a14.DS_ITCP_MATERIAL_SERVICO  		Item,
	a14.ID_ITCP_SIT_ATUAL_MAT_SERV  	SituacaoCod,
	a17.DS_ITCP_SIT_ATUAL_MAT_SERV 		Situacao,
	a13.ID_DT_ANO						Ano,
	count(a11.ID_ITCP_TP_COD_MAT_SERV)	QuantidadeOcorrenciaItem,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  	ValorTotalHomologado
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR					a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA					a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA						a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO		a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV			a15
	  on 	(a14.ID_ITCP_CLASSE_MAT_SERV = a15.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT			a16
	  on 	(a14.ID_ITCP_PADRAO_DESC_MAT = a16.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_ITCP_SIT_ATUAL_MAT_SERV 		a17
	  on	(a14.ID_ITCP_SIT_ATUAL_MAT_SERV = a17.ID_ITCP_SIT_ATUAL_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_TP_MATERIAL_SERVICO		a18
	  on 	(a14.ID_ITCP_TP_MATERIAL_SERVICO = a18.ID_ITCP_TP_MATERIAL_SERVICO)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL			a19
	  on 	(a14.ID_ITCP_GRUPO_MATERIAL = a19.ID_ITCP_GRUPO_MATERIAL)
where	(a14.ID_ITCP_SIT_ATUAL_MAT_SERV in (1)
		and a14.ID_ITCP_TP_MATERIAL_SERVICO in (1)
 		and a13.ID_DT_ANO in (2019, 2020, 2021))
group by	
	a14.ID_ITCP_TP_MATERIAL_SERVICO,
	a18.DS_ITCP_TP_MATERIAL_SERVICO,
	a14.ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL,
	a14.ID_ITCP_CLASSE_MAT_SERV,
	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT,
	a15.DS_ITCP_CLASSE_MAT_SERV,
	a14.ID_ITCP_PADRAO_DESC_MAT,
	a16.DS_ITCP_PADRAO_DESC_MAT,
	a11.ID_ITCP_TP_COD_MAT_SERV,
	a14.DS_ITCP_MATERIAL_SERVICO,
	a14.ID_ITCP_MATERIAL_SERVICO,
	a14.ID_ITCP_SIT_ATUAL_MAT_SERV,
	a17.DS_ITCP_SIT_ATUAL_MAT_SERV,
	a13.ID_DT_ANO
order by
--	a18.DS_ITCP_TP_MATERIAL_SERVICO,
--	a19.DS_ITCP_GRUPO_MATERIAL,
--	a15.DS_ITCP_CLASSE_MAT_SERV,
--	a16.DS_ITCP_PADRAO_DESC_MAT,
--	a14.DS_ITCP_MATERIAL_SERVICO,
--	a17.DS_ITCP_SIT_ATUAL_MAT_SERV,
	count(a11.ID_ITCP_TP_COD_MAT_SERV) desc,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG) desc
limit 1000
	