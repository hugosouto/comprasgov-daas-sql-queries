with ZZTCTHSEWWYMQ000  as (
select	a13.ID_DT_ANO  ID_DT_ANO,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a14.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a16.ID_UNDD_ORGAO_SUP  ID_UNDD_ORGAO_SUP
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a14
	  on 	(a12.ID_UNDD_RESP_COMPRA = a14.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a15
	  on 	(a14.ID_UNDD_ORGAO = a15.ID_UNDD_ORGAO)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_VINC	a16
	  on 	(a15.ID_UNDD_ORGAO_VINC = a16.ID_UNDD_ORGAO_VINC)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a17
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a17.ID_ITCP_TP_COD_MAT_SERV)
where	(1=1
 and a13.ID_DT_ANO in (2024)
 and a17.ID_ITCP_TP_MATERIAL_SERVICO in (2)
 and a17.ID_ITCP_MATERIAL_SERVICO IN (1627, 13455)
 )
group by	a13.ID_DT_ANO,
	a11.ID_ITCP_TP_COD_MAT_SERV,
	a14.ID_UNDD_IN_SISG,
	a16.ID_UNDD_ORGAO_SUP
having	sum(a11.VL_PRECO_TOTAL_HOMOLOG) > 0 
)
, ZZT5OTCUVEQSP001  as (
select	a16.ID_UNDD_ORGAO_SUP  ID_UNDD_ORGAO_SUP,
	a14.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a13.ID_DT_ANO  ID_DT_ANO,
	sum(a11.QT_ITCP_ITEM_COMPRAS)  WJXBFS1
from	Siasg_DW_VBL.F_ITEM_COMPRA	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a14
	  on 	(a12.ID_UNDD_RESP_COMPRA = a14.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a15
	  on 	(a14.ID_UNDD_ORGAO = a15.ID_UNDD_ORGAO)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_VINC	a16
	  on 	(a15.ID_UNDD_ORGAO_VINC = a16.ID_UNDD_ORGAO_VINC)
	join	ZZTCTHSEWWYMQ000	pa17
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = pa17.ID_ITCP_TP_COD_MAT_SERV and 
	a13.ID_DT_ANO = pa17.ID_DT_ANO and 
	a14.ID_UNDD_IN_SISG = pa17.ID_UNDD_IN_SISG and 
	a16.ID_UNDD_ORGAO_SUP = pa17.ID_UNDD_ORGAO_SUP)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a18
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a18.ID_ITCP_TP_COD_MAT_SERV)
where	(1=1
 and a13.ID_DT_ANO in (2024)
 and a18.ID_ITCP_TP_MATERIAL_SERVICO in (2)
 and a18.ID_ITCP_MATERIAL_SERVICO IN (1627, 13455)
)
group by	a16.ID_UNDD_ORGAO_SUP,
	a14.ID_UNDD_IN_SISG,
	a11.ID_ITCP_TP_COD_MAT_SERV,
	a13.ID_DT_ANO 
)
, ZZT9OHCQ65ASP002  as (
select	a16.ID_UNDD_ORGAO_SUP  ID_UNDD_ORGAO_SUP,
	a14.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a13.ID_DT_ANO  ID_DT_ANO,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  WJXBFS1
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a14
	  on 	(a12.ID_UNDD_RESP_COMPRA = a14.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a15
	  on 	(a14.ID_UNDD_ORGAO = a15.ID_UNDD_ORGAO)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_VINC	a16
	  on 	(a15.ID_UNDD_ORGAO_VINC = a16.ID_UNDD_ORGAO_VINC)
	join	ZZTCTHSEWWYMQ000	pa17
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = pa17.ID_ITCP_TP_COD_MAT_SERV and 
	a13.ID_DT_ANO = pa17.ID_DT_ANO and 
	a14.ID_UNDD_IN_SISG = pa17.ID_UNDD_IN_SISG and 
	a16.ID_UNDD_ORGAO_SUP = pa17.ID_UNDD_ORGAO_SUP)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a18
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a18.ID_ITCP_TP_COD_MAT_SERV)
where	(1=1
 and a13.ID_DT_ANO in (2024)
 and a18.ID_ITCP_TP_MATERIAL_SERVICO in (2)
 and a18.ID_ITCP_MATERIAL_SERVICO IN (1627, 13455)
)
group by	a16.ID_UNDD_ORGAO_SUP,
	a14.ID_UNDD_IN_SISG,
	a11.ID_ITCP_TP_COD_MAT_SERV,
	a13.ID_DT_ANO 
)
select
	pa11.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a15.DS_UNDD_IN_SISG  DS_UNDD_IN_SISG,
	pa11.ID_UNDD_ORGAO_SUP  ID_UNDD_ORGAO_SUP,
	a16.DS_UNDD_ORGAO_SUP  DS_UNDD_ORGAO_SUP,
	a13.ID_ITCP_GRUPO_MATERIAL  ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL  DS_ITCP_GRUPO_MATERIAL,
	a13.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV,
	a17.ID_ITCP_CLASSE_MAT_SERV_EDIT  DS_ITCP_CLASSE_MAT_SERV,
	a17.DS_ITCP_CLASSE_MAT_SERV  DS_ITCP_CLASSE_MAT_SERV0,
	a13.ID_ITCP_PADRAO_DESC_MAT  ID_ITCP_PADRAO_DESC_MAT,
	a18.DS_ITCP_PADRAO_DESC_MAT  DS_ITCP_PADRAO_DESC_MAT,
	pa11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	pa11.ID_DT_ANO  ID_DT_ANO,
	a14.DS_DT_ANO  DS_DT_ANO,
	sum(pa11.WJXBFS1)  WJXBFS1,
	sum(pa12.WJXBFS1)  WJXBFS2
from	ZZT5OTCUVEQSP001	pa11
	join	ZZT9OHCQ65ASP002	pa12
	  on 	(pa11.ID_DT_ANO = pa12.ID_DT_ANO and 
			pa11.ID_ITCP_TP_COD_MAT_SERV = pa12.ID_ITCP_TP_COD_MAT_SERV and 
			pa11.ID_UNDD_IN_SISG = pa12.ID_UNDD_IN_SISG and 
			pa11.ID_UNDD_ORGAO_SUP = pa12.ID_UNDD_ORGAO_SUP)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a13
	  on 	(pa11.ID_ITCP_TP_COD_MAT_SERV = a13.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_DT_ANO	a14
	  on 	(pa11.ID_DT_ANO = a14.ID_DT_ANO)
	join	Siasg_DW_VBL.D_UNDD_IN_SISG	a15
	  on 	(pa11.ID_UNDD_IN_SISG = a15.ID_UNDD_IN_SISG)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_SUP	a16
	  on 	(pa11.ID_UNDD_ORGAO_SUP = a16.ID_UNDD_ORGAO_SUP)
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV	a17
	  on 	(a13.ID_ITCP_CLASSE_MAT_SERV = a17.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT	a18
	  on 	(a13.ID_ITCP_PADRAO_DESC_MAT = a18.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a19
	  on 	(a13.ID_ITCP_GRUPO_MATERIAL = a19.ID_ITCP_GRUPO_MATERIAL)
group by 
	pa11.ID_UNDD_IN_SISG,
	a15.DS_UNDD_IN_SISG,
	pa11.ID_UNDD_ORGAO_SUP,
	a16.DS_UNDD_ORGAO_SUP,
	a13.ID_ITCP_GRUPO_MATERIAL,
	a19.DS_ITCP_GRUPO_MATERIAL,
	a13.ID_ITCP_CLASSE_MAT_SERV,
	a17.ID_ITCP_CLASSE_MAT_SERV_EDIT,
	a17.DS_ITCP_CLASSE_MAT_SERV,
	a13.ID_ITCP_PADRAO_DESC_MAT,
	a18.DS_ITCP_PADRAO_DESC_MAT,
	pa11.ID_ITCP_TP_COD_MAT_SERV,
	pa11.ID_DT_ANO,
	a14.DS_DT_ANO;