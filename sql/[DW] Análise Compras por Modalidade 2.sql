with temp as (
	select	a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT
	from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
		join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
		  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
		join	Siasg_DW_VBL.D_DT_DATA	a13
		  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	where	a13.ID_DT_ANO in (2016, 2017, 2018, 2019, 2020, 2021)
	group by	a12.ID_CMPR_COMPRA
	having	(sum(a11.VL_PRECO_TOTAL_HOMOLOG) < 8000000000
	 	 and sum(a11.VL_PRECO_TOTAL_HOMOLOG) > 0) 
)
select	
--	a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT,
	a14.ID_DT_ANO  ID_DT_ANO,
	a16.DS_DT_ANO  DS_DT_ANO,
--	a12.ID_CMPR_MODALIDADE_COMPRA  ID_CMPR_MODALIDADE_COMPRA,
	a17.DS_CMPR_MODALIDADE_COMPRA  DS_CMPR_MODALIDADE_COMPRA,
	count(a12.DS_CMPR_COMPRA_EDIT)	QTD_COMPRAS,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  VL_TOTAL_HOMLOG
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	temp	pa13
	  on 	(a12.ID_CMPR_COMPRA = pa13.DS_CMPR_COMPRA_EDIT)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a12.DT_HOMOLOG_PREGAO = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_DT_DATA	a15
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a15.ID_DT_DATA)
	join	Siasg_DW_VBL.D_DT_ANO	a16
	  on 	(a14.ID_DT_ANO = a16.ID_DT_ANO)
	join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a17
	  on 	(a12.ID_CMPR_MODALIDADE_COMPRA = a17.ID_CMPR_MODALIDADE_COMPRA)
where	a15.ID_DT_ANO in (2016, 2017, 2018, 2019, 2020, 2021)
group by	
--	a12.ID_CMPR_COMPRA,
--	a12.DS_CMPR_COMPRA_EDIT,
	a14.ID_DT_ANO,
	a16.DS_DT_ANO,
	a12.ID_CMPR_MODALIDADE_COMPRA,
	a17.DS_CMPR_MODALIDADE_COMPRA
;

with temp as (
	select	a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT
	from		Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
		join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
		  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
		join	Siasg_DW_VBL.D_DT_DATA	a13
		  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	where	a13.ID_DT_ANO in (2016, 2017, 2018, 2019, 2020, 2021)
	group by	a12.ID_CMPR_COMPRA
	having	(sum(a11.VL_PRECO_TOTAL_HOMOLOG) > 0
	 	 and sum(a11.VL_PRECO_TOTAL_HOMOLOG) < 8000000000) 
)
select	
--	a12.ID_CMPR_COMPRA 					DS_CMPR_COMPRA_EDIT,
--	a12.DS_CMPR_COMPRA_EDIT  			DS_CMPR_COMPRA,
--	a12.ID_CMPR_MODALIDADE_COMPRA  		ID_CMPR_MODALIDADE_COMPRA,
	a15.DS_DT_ANO  						DS_DT_ANO,
--	a14.ID_DT_ANO  						ANO,
	a16.DS_CMPR_MODALIDADE_COMPRA 		MODALIDADE_COMPRA,
	count(a12.DS_CMPR_COMPRA_EDIT)		QTD_COMPRAS,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  	VL_TOTAL_HOMLOG
--	a11.VL_PRECO_TOTAL_HOMOLOG			VL_TOTAL_HOMLOG
from		Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	temp	pa13
	  on 	(a12.ID_CMPR_COMPRA = pa13.DS_CMPR_COMPRA_EDIT)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_DT_ANO	a15
	  on 	(a14.ID_DT_ANO = a15.ID_DT_ANO)
	join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a16
	  on 	(a12.ID_CMPR_MODALIDADE_COMPRA = a16.ID_CMPR_MODALIDADE_COMPRA)
where	a14.ID_DT_ANO in (2016, 2017, 2018, 2019, 2020, 2021)
group by	
--	a12.ID_CMPR_COMPRA,
--	a12.DS_CMPR_COMPRA_EDIT,
	a12.ID_CMPR_MODALIDADE_COMPRA,
	a16.DS_CMPR_MODALIDADE_COMPRA,
	a15.DS_DT_ANO,
	a14.ID_DT_ANO
order by a14.ID_DT_ANO, a12.ID_CMPR_MODALIDADE_COMPRA
;