with ZZT3GV4TT04MQ000  as (
select	
	a13.ID_DT_ANO  ID_DT_ANO,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
where	(a13.ID_DT_ANO in (2019, 2020, 2021, 2022, 2023)
 and a14.ID_ITCP_TP_MATERIAL_SERVICO in (1))
group by	a13.ID_DT_ANO,
	a11.ID_ITCP_TP_COD_MAT_SERV
having	sum(a11.VL_PRECO_TOTAL_HOMOLOG) > 0 
)
, ZZTSSGWUFWKSP001  as (
select	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a13.ID_DT_ANO  ID_DT_ANO,
	sum(a11.QT_ITCP_ITEM_COMPRAS)  QT_ITCP_ITEM_COMPRAS, -- WJXBFS1,
	sum(a11.QT_ITCP_SOLICITADA)  QT_ITCP_SOLICITADA -- WJXBFS2
from	Siasg_DW_VBL.F_ITEM_COMPRA	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	ZZT3GV4TT04MQ000	pa14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = pa14.ID_ITCP_TP_COD_MAT_SERV and 
	a13.ID_DT_ANO = pa14.ID_DT_ANO)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a15
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a15.ID_ITCP_TP_COD_MAT_SERV)
where	(a13.ID_DT_ANO in (2019, 2020, 2021, 2022, 2023)
	and a15.ID_ITCP_TP_MATERIAL_SERVICO in (1))
group by	a11.ID_ITCP_TP_COD_MAT_SERV --, a13.ID_DT_ANO 
)
, ZZTX8I8BWTGSP002  as (
select	
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
--	a13.ID_DT_ANO  ID_DT_ANO,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  VL_PRECO_TOTAL_HOMOLOG -- WJXBFS1
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	ZZT3GV4TT04MQ000	pa14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = pa14.ID_ITCP_TP_COD_MAT_SERV and 
			a13.ID_DT_ANO = pa14.ID_DT_ANO)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a15
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a15.ID_ITCP_TP_COD_MAT_SERV)
where	(a13.ID_DT_ANO in (2019, 2020, 2021, 2022, 2023)
 and a15.ID_ITCP_TP_MATERIAL_SERVICO in (1))
group by	a11.ID_ITCP_TP_COD_MAT_SERV --, a13.ID_DT_ANO 
)
select	
--	pa11.ID_DT_ANO  ID_DT_ANO,
--	a14.DS_DT_ANO  DS_DT_ANO,
	a13.ID_ITCP_GRUPO_MATERIAL  ID_ITCP_GRUPO_MATERIAL,
	a17.DS_ITCP_GRUPO_MATERIAL  DS_ITCP_GRUPO_MATERIAL,
--	a13.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV,
	a15.ID_ITCP_CLASSE_MAT_SERV_EDIT  DS_ITCP_CLASSE_MAT_SERV,
	a15.DS_ITCP_CLASSE_MAT_SERV  DS_ITCP_CLASSE_MAT_SERV0,
	a13.ID_ITCP_PADRAO_DESC_MAT  ID_ITCP_PADRAO_DESC_MAT,
	a16.DS_ITCP_PADRAO_DESC_MAT  DS_ITCP_PADRAO_DESC_MAT,
--	pa11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a13.ID_ITCP_MATERIAL_SERVICO  ID_ITCP_MATERIAL_SERVICO,
	a13.DS_ITCP_MATERIAL_SERVICO  DS_ITCP_MATERIAL_SERVICO,
	pa11.QT_ITCP_ITEM_COMPRAS  QT_ITCP_ITEM_COMPRAS, -- WJXBFS1
	pa11.QT_ITCP_SOLICITADA  QT_ITCP_SOLICITADA, -- WJXBFS2
	pa12.VL_PRECO_TOTAL_HOMOLOG  VL_PRECO_TOTAL_HOMOLOG --WJXBFS3
from	ZZTSSGWUFWKSP001	pa11
	join	ZZTX8I8BWTGSP002	pa12
	  on 	(pa11.ID_DT_ANO = pa12.ID_DT_ANO and 
			pa11.ID_ITCP_TP_COD_MAT_SERV = pa12.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a13
	  on 	(pa11.ID_ITCP_TP_COD_MAT_SERV = a13.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_DT_ANO	a14
	  on 	(pa11.ID_DT_ANO = a14.ID_DT_ANO)
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV	a15
	  on 	(a13.ID_ITCP_CLASSE_MAT_SERV = a15.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT	a16
	  on 	(a13.ID_ITCP_PADRAO_DESC_MAT = a16.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a17
	  on 	(a13.ID_ITCP_GRUPO_MATERIAL = a17.ID_ITCP_GRUPO_MATERIAL)
order by  QT_ITCP_ITEM_COMPRAS desc, QT_ITCP_SOLICITADA, QT_ITCP_SOLICITADA desc, VL_PRECO_TOTAL_HOMOLOG desc
limit 1000
;