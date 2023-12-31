select
	a118.DS_UNDD_ORGAO_SUP  DS_UNDD_ORGAO_SUP,
	a19.DS_UNDD_ORGAO  DS_UNDD_ORGAO,
	a18.NO_UNDD_UNIDADE  NO_UNDD_UNIDADE0,
	a117.DS_LCAL_UF  DS_LCAL_UF,
	a111.DS_CMPR_MODALIDADE_COMPRA  DS_CMPR_MODALIDADE_COMPRA,
	a114.DS_ITCP_GRUPO_SERVICO  DS_ITCP_GRUPO_SERVICO,
	a17.DS_ITCP_MATERIAL_SERVICO  DS_ITCP_MATERIAL_SERVICO,
	a110.CH_ITCT_ITEM_CONTRATO_EDIT,
	a112.DS_LCAL_UF  DS_LCAL_UF0,
	a113.DS_DT_ANO  DS_DT_ANO,
	a116.DS_UNDD_TP_ADM  DS_UNDD_TP_ADM,
	a115.DS_UNDD_PODER  DS_UNDD_PODER,
	sum(a11.QT_ITCT_CONTRATADA)  QT_ITCT_CONTRATADA,
	sum(a11.VL_ITCT_CONTRATADO)  VL_ITCT_CONTRATADO
from	Siasg_DW_VBL.F_ITEM_CONTRATO	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_FRND_FORNECEDOR	a13
	  on 	(a11.ID_FRND_FORNECEDOR_COMPRA = a13.ID_FRND_FORNECEDOR)
	join	Siasg_DW_VBL.D_LCAL_MUNICIPIO	a14
	  on 	(a13.ID_LCAL_MUNICIPIO_FORNEC = a14.ID_LCAL_MUNICIPIO)
	join	Siasg_DW_VBL.D_CNTR_CONTRATO	a15
	  on 	(a11.ID_CNTR_CONTRATO = a15.ID_CNTR_CONTRATO)
	join	Siasg_DW_VBL.D_DT_DATA	a16
	  on 	(a15.DT_CNTR_ASS_CONT = a16.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a17
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a17.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a18
	  on 	(a15.ID_UNDD_UNID_RESP_CONT = a18.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a19
	  on 	(a18.ID_UNDD_ORGAO = a19.ID_UNDD_ORGAO)
	join	Siasg_DW_VBL.D_ITCT_ITEM_CONTRATO	a110
	  on 	(a11.ID_ITCT_ITEM_CONTRATO = a110.ID_ITCT_ITEM_CONTRATO)
	join	Siasg_DW_VBL.D_CMPR_MODALIDADE_COMPRA	a111
	  on 	(a12.ID_CMPR_MODALIDADE_COMPRA = a111.ID_CMPR_MODALIDADE_COMPRA)
	join	Siasg_DW_VBL.D_LCAL_UF	a112
	  on 	(a14.ID_LCAL_UF = a112.ID_LCAL_UF)
	join	Siasg_DW_VBL.D_DT_ANO	a113
	  on 	(a16.ID_DT_ANO = a113.ID_DT_ANO)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_SERVICO	a114
	  on 	(a17.ID_ITCP_GRUPO_SERVICO = a114.ID_ITCP_GRUPO_SERVICO)
	join	Siasg_DW_VBL.D_UNDD_PODER	a115
	  on 	(a18.ID_UNDD_PODER = a115.ID_UNDD_PODER)
	join	Siasg_DW_VBL.D_UNDD_TP_ADM	a116
	  on 	(a18.ID_UNDD_TP_ADM = a116.ID_UNDD_TP_ADM)
	join	Siasg_DW_VBL.D_LCAL_UF	a117
	  on 	(a18.ID_LCAL_UF_UNIDADE = a117.ID_LCAL_UF)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_SUP	a118
	  on 	(a18.ID_UNDD_ORGAO_SUP = a118.ID_UNDD_ORGAO_SUP)
where
	DS_ITCP_GRUPO_SERVICO is not 'NAO SE APLICA' and
	(a15.DT_CNTR_FIM_VIG_CONT >=  '01-06-2020'
 		or a15.DT_CNTR_FIM_VIG_ULT_CONT > '01-06-2020'
-- 		or a18.ID_UNDD_PODER in (1))
group by	
	a118.DS_UNDD_ORGAO_SUP,
	a19.DS_UNDD_ORGAO,
	a18.NO_UNDD_UNIDADE,
	a117.DS_LCAL_UF,
	a111.DS_CMPR_MODALIDADE_COMPRA,
	a114.DS_ITCP_GRUPO_SERVICO,
	a17.DS_ITCP_MATERIAL_SERVICO,
	a110.CH_ITCT_ITEM_CONTRATO_EDIT,
	a112.DS_LCAL_UF,
	a113.DS_DT_ANO,
	a116.DS_UNDD_TP_ADM,
	a115.DS_UNDD_PODER;