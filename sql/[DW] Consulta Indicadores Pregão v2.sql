WITH ZZTPTWY0HS8MQ000  as (
	select	
		a11.ID_FRND_FORNECEDOR_COMPRA  ID_FRND_FORNECEDOR,
		a12.ID_CMPR_COMPRA  DS_CMPR_COMPRA_EDIT,
		a11.ID_ITCP_ITEM_COMPRA  ID_ITCP_ITEM_COMPRA
	from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
		join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
		  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
		join	Siasg_DW_VBL.D_DT_DATA	a13
		  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
		join	Siasg_DW_VBL.D_UNDD_UNIDADE	a14
		  on 	(a12.ID_UNDD_RESP_COMPRA = a14.ID_UNDD_UNIDADE)
		join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a15
		  on 	(a12.ID_CMPR_MODALIDADE_COMPRA = a15.ID_CMPR_MODALIDADE_COMPRA)
	where	(a15.ID_CMPR_MODALIDADE_GRUPO in (5)
--	 and a14.ID_UNDD_IN_SISG in (2, 1)
	 and a13.ID_DT_ANO in (2021)
--	 and a13.ID_DT_MES in (202101)
	 and a12.DT_CMPR_RESULTADO_COMPRA between '2021-02-01' and '2021-02-05'
	 and a12.ID_CMPR_TP_PREGAO in (1))
	group by	
		a13.ID_DT_MES,
		a11.ID_FRND_FORNECEDOR_COMPRA,
		a12.ID_CMPR_COMPRA,
		a11.ID_ITCP_ITEM_COMPRA
	having	sum(a11.VL_ULT_LANCE) > 0.0 
)
select distinct
--	a14.ID_DT_ANO  					ID_DT_ANO,
	a110.DS_DT_ANO  				DS_DT_ANO,
	a14.ID_DT_MES					ID_DT_MES,
--	a15.ID_UNDD_IN_SISG  			ID_UNDD_IN_SISG,
	a18.DS_UNDD_IN_SISG  			DS_UNDD_IN_SISG,
--	pa12.DS_CMPR_COMPRA_EDIT  		DS_CMPR_COMPRA_EDIT,
	a13.DS_CMPR_COMPRA_EDIT  		DS_CMPR_COMPRA,
--	pa12.ID_ITCP_ITEM_COMPRA  		ID_ITCP_ITEM_COMPRA,
--	a16.CH_ITCP_ITEM_COMPRA_EDIT  	DS_ITCP_ITEM_COMPRA,
--	a11.ID_FRND_FORNECEDOR  		ID_FRND_FORNECEDOR,
	a16.ID_ITCP_IN_COMPRA_GRUPO  	ID_ITCP_IN_COMPRA_GRUPO,
	a19.DS_ITCP_IN_COMPRA_GRUPO  	DS_ITCP_IN_COMPRA_GRUPO,
	case when a16.ID_ITCP_IN_COMPRA_GRUPO = 0 then a16.CH_ITCP_ITEM_COMPRA_EDIT
		 when a16.ID_ITCP_IN_COMPRA_GRUPO != 0 then a13.DS_CMPR_COMPRA_EDIT||'GR'||LPAD(a16.ID_ITCP_IN_COMPRA_GRUPO, 3, 0) end COD_ITEM_GRUPO,
	count(a11.ID_FRND_FORNECEDOR) 	CONTA_FORNECEDOR
from	Siasg_DW_VBL.D_FRND_FORNECEDOR	a11
	join	ZZTPTWY0HS8MQ000	pa12
	  on 	(a11.ID_FRND_FORNECEDOR = pa12.ID_FRND_FORNECEDOR)
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a13
	  on 	(pa12.DS_CMPR_COMPRA_EDIT = a13.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a13.DT_CMPR_RESULTADO_COMPRA = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a15
	  on 	(a13.ID_UNDD_RESP_COMPRA = a15.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_ITCP_ITEM_COMPRA	a16
	  on 	(pa12.ID_ITCP_ITEM_COMPRA = a16.ID_ITCP_ITEM_COMPRA)
	join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a17
	  on 	(a13.ID_CMPR_MODALIDADE_COMPRA = a17.ID_CMPR_MODALIDADE_COMPRA)
	join	Siasg_DW_VBL.D_UNDD_IN_SISG	a18
	  on 	(a15.ID_UNDD_IN_SISG = a18.ID_UNDD_IN_SISG)
	join	Siasg_DW_VBL.D_ITCP_IN_COMPRA_GRUPO	a19
	  on 	(a16.ID_ITCP_IN_COMPRA_GRUPO = a19.ID_ITCP_IN_COMPRA_GRUPO)
	join	Siasg_DW_VBL.D_DT_ANO	a110
	  on 	(a14.ID_DT_ANO = a110.ID_DT_ANO)
where	(a17.ID_CMPR_MODALIDADE_GRUPO in (5)
--	 and a15.ID_UNDD_IN_SISG in (2, 1)
	 and a14.ID_DT_ANO in (2021)
--	 and a14.ID_DT_MES in (202101)
	 and a13.DT_CMPR_RESULTADO_COMPRA between '2021-02-01' and '2021-02-05'
	 and a13.ID_CMPR_TP_PREGAO in (1))
group by
	a110.DS_DT_ANO,
	a14.ID_DT_MES,
	a18.DS_UNDD_IN_SISG,
	a13.DS_CMPR_COMPRA_EDIT,
	a16.CH_ITCP_ITEM_COMPRA_EDIT,
	a16.ID_ITCP_IN_COMPRA_GRUPO,
	a19.DS_ITCP_IN_COMPRA_GRUPO,
	a13.DS_CMPR_COMPRA_EDIT||'GR'||LPAD(a16.ID_ITCP_IN_COMPRA_GRUPO, 3, 0)
	