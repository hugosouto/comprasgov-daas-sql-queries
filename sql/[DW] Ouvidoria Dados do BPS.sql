with ZZSP00  as (
select	
	a11.ID_ITCP_ITEM_COMPRA  ID_ITCP_UNIDADE_FORNECIMENTO,
	a12.ID_CMPR_MODALIDADE_COMPRA  ID_CMPR_MODALIDADE_COMPRA,
	a12.DT_CMPR_RESULTADO_COMPRA  ID_DT_DATA,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a12.ID_UNDD_RESP_COMPRA  ID_UNDD_UNIDADE,
	a11.ID_FRND_FORNECEDOR_COMPRA  ID_FRND_FORNECEDOR,
	sum(a11.QT_COMPRADA_ITEM)  WJXBFS1
from	Siasg_DW_VBL.F_ITEM_UNID_FORNEC	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
where	(a13.ID_DT_ANO in (2023) -- , 2022, 2021, 2020, 2019, 2018)
 	 and a14.ID_ITCP_GRUPO_MATERIAL in (65))
group by	a11.ID_ITCP_ITEM_COMPRA,
	a12.ID_CMPR_MODALIDADE_COMPRA,
	a12.DT_CMPR_RESULTADO_COMPRA,
	a11.ID_ITCP_TP_COD_MAT_SERV,
	a12.ID_UNDD_RESP_COMPRA,
	a11.ID_FRND_FORNECEDOR_COMPRA 
), ZZSP01  as (
select	
	a11.ID_ITCP_ITEM_COMPRA  ID_ITCP_UNIDADE_FORNECIMENTO,
	a12.ID_CMPR_MODALIDADE_COMPRA  ID_CMPR_MODALIDADE_COMPRA,
	a12.DT_CMPR_RESULTADO_COMPRA  ID_DT_DATA,
	a11.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_TP_COD_MAT_SERV,
	a12.ID_UNDD_RESP_COMPRA  ID_UNDD_UNIDADE,
	a11.ID_FRND_FORNECEDOR_COMPRA  ID_FRND_FORNECEDOR,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  WJXBFS1,
	sum(a11.VL_PRECO_UNIT_HOMOLOG)  WJXBFS2
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
where	(a13.ID_DT_ANO in (2023) -- , 2022, 2021, 2020, 2019, 2018)
 	 and a14.ID_ITCP_GRUPO_MATERIAL in (65))
group by	a11.ID_ITCP_ITEM_COMPRA,
	a12.ID_CMPR_MODALIDADE_COMPRA,
	a12.DT_CMPR_RESULTADO_COMPRA,
	a11.ID_ITCP_TP_COD_MAT_SERV,
	a12.ID_UNDD_RESP_COMPRA,
	a11.ID_FRND_FORNECEDOR_COMPRA 
)
select	distinct 
	'BR' || substring(pa11.ID_ITCP_TP_COD_MAT_SERV, 1)   ID_ITCP_TP_COD_MAT_SERV,
	a13.DS_ITCP_MATERIAL_SERVICO  DS_ITCP_MATERIAL_SERVICO,
	a13.ID_ITCP_MATERIAL_SERVICO  ID_ITCP_MATERIAL_SERVICO,
	pa11.ID_UNDD_UNIDADE  ID_UNDD_UNIDADE,
	a14.CD_UNDD_UNIDADE  CD_UNDD_UNIDADE,
	a14.NO_UNDD_UNIDADE  NO_UNDD_UNIDADE,
	a14.ID_LCAL_UF_UNIDADE  ID_LCAL_UF,
	a110.DS_LCAL_UF  DS_LCAL_UF,
	pa11.ID_ITCP_UNIDADE_FORNECIMENTO  ID_ITCP_UNIDADE_FORNECIMENTO,
	case a18.DS_ITCP_UNIDADE_FORNECIMENTO
		when '     -7' then 'Inválido'
		when '     -8' then 'Não Informado'
		when '     -9' then 'Não se Aplica'
		else a18.DS_ITCP_UNIDADE_FORNECIMENTO
		end DS_ITCP_UNIDADE_FORNECIMENTO,
	pa11.ID_FRND_FORNECEDOR  ID_FRND_FORNECEDOR,	
	case a15.ID_FRND_FORNECEDOR
		when '            -7' then 'Inválido'
        when '            -8' then 'Não Informado'
		when '            -9' then 'Não se Aplica'
		else a15.ID_FRND_FORNECEDOR
		end asID_FRND_FORNECEDOR0,
	a15.ID_FRND_FORNECEDOR  ID_FRND_FORNECEDOR1,
	a15.NO_FRND_FORNECEDOR  NO_FRND_FORNECEDOR,
	a13.ID_ITCP_TP_COD_MAT_SERV  ID_ITCP_MATERIAL_SERVICO0,
	a13.DS_ITCP_MATERIAL_SERVICO  DS_ITCP_MATERIAL_SERVICO0,
	pa11.ID_CMPR_MODALIDADE_COMPRA  ID_CMPR_MODALIDADE_COMPRA,
	a17.DS_CMPR_MODALIDADE_COMPRA  DS_CMPR_MODALIDADE_COMPRA,
	pa11.ID_DT_DATA  ID_DT_DATA,
	a16.DS_DT_DATA  DS_DT_DATA,
	a14.ID_UNDD_UNIDADE  CD_UNDD_UNIDADE0,
	a14.NO_UNDD_UNIDADE  NO_UNDD_UNIDADE0,
	a14.ID_LCAL_MUNICIPIO_UNIDADE  ID_LCAL_MUNICIPIO,
	a19.DS_LCAL_MUNICIPIO  DS_LCAL_MUNICIPIO,
	pa11.WJXBFS1  QT_COMPRADA_ITEM, -- WJXBFS1
	pa12.WJXBFS1  VL_PRECO_TOTAL_HOMOLOG, -- WJXBFS2
	pa12.WJXBFS2  VL_PRECO_UNIT_HOMOLOG -- WJXBFS3
from	ZZSP00	pa11
	join	ZZSP01	pa12
	  on 	(pa11.ID_CMPR_MODALIDADE_COMPRA = pa12.ID_CMPR_MODALIDADE_COMPRA and 
			pa11.ID_DT_DATA = pa12.ID_DT_DATA and 
			pa11.ID_FRND_FORNECEDOR = pa12.ID_FRND_FORNECEDOR and 
			pa11.ID_ITCP_TP_COD_MAT_SERV = pa12.ID_ITCP_TP_COD_MAT_SERV and 
			pa11.ID_ITCP_UNIDADE_FORNECIMENTO = pa12.ID_ITCP_UNIDADE_FORNECIMENTO and 
			pa11.ID_UNDD_UNIDADE = pa12.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a13
	  on 	(pa11.ID_ITCP_TP_COD_MAT_SERV = a13.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a14
	  on 	(pa11.ID_UNDD_UNIDADE = a14.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_FRND_FORNECEDOR	a15
	  on 	(pa11.ID_FRND_FORNECEDOR = a15.ID_FRND_FORNECEDOR)
	join	Siasg_DW_VBL.D_DT_DATA	a16
	  on 	(pa11.ID_DT_DATA = a16.ID_DT_DATA)
	join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a17
	  on 	(pa11.ID_CMPR_MODALIDADE_COMPRA = a17.ID_CMPR_MODALIDADE_COMPRA)
	join	Siasg_DW_VBL.D_ITCP_ITEM_COMPRA	a18
	  on 	(pa11.ID_ITCP_UNIDADE_FORNECIMENTO = a18.ID_ITCP_ITEM_COMPRA)
	join	Siasg_DW_VBL.D_LCAL_MUNICIPIO	a19
	  on 	(a14.ID_LCAL_MUNICIPIO_UNIDADE = a19.ID_LCAL_MUNICIPIO)
	join	Siasg_DW_VBL.D_LCAL_UF	a110
	  on 	(a14.ID_LCAL_UF_UNIDADE = a110.ID_LCAL_UF)
;
