with ZZMQ00  as (
select	
	a13.ID_DT_ANO  ID_DT_ANO,
	a14.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV,
	a15.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a14.ID_ITCP_PADRAO_DESC_MAT  ID_ITCP_PADRAO_DESC_MAT,
	a16.ID_UNDD_ORGAO_VINC  ID_UNDD_ORGAO_VINC
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a15
	  on 	(a12.ID_UNDD_RESP_COMPRA = a15.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a16
	  on 	(a15.ID_UNDD_ORGAO = a16.ID_UNDD_ORGAO)
where	(a13.ID_DT_ANO in (2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023)
 	and a14.ID_ITCP_PADRAO_DESC_MAT in ('588', '644', '645', '680', '7944', '7945', '8134', '8184', '822', '823', '824', '825', '826', '827', '828', '829', '830', '858', '859', '860', '880', '885', '890', '904', '905', '10165', '10166', '10167', '10168', '10169', '10170', '10171', '10172', '10182', '10186', '10192', '10193', '10194', '10195', '10196', '10197', '10198', '10199', '10200', '10201', '10202', '10203', '10204', '10205', '10206', '10209', '10210', '10522', '10572', '10713', '10988', '11267', '11269', '11377', '11381', '11400', '11657', '11855', '11927', '11928', '12046', '12168', '12182', '12428', '12438', '12481', '12544', '12545', '12546', '12992', '13020', '13213', '13214', '13234', '13318', '13335', '13388', '13527', '13542', '13860', '13864', '14248', '14691', '14695', '15008', '15031', '15209', '15604', '16128', '16172', '1637', '16733', '16734', '16735', '16736', '16737', '16738', '16739', '16740', '16741', '16742', '16743', '16794', '17294', '17296', '17310', '17312', '17313', '18328', '18712', '19586', '19690', '19714', '19737', '19739', '19740', '19741', '19742', '19763', '19770', '19771', '19772', '19773', '19789', '19790', '19791', '19792', '19793', '19794', '19935', '2137', '2156', '2206', '2207', '2276', '2300', '2327', '2339', '2398', '3043', '3151', '3161', '3267', '3437', '3439', '3509', '3510', '3516', '3678', '3909', '3933', '4069', '4357', '4507', '4548', '4550', '4551', '4552', '4553', '4554', '4555', '4556', '4557', '4558', '4559', '4560', '4716', '4717', '4742', '4857', '4948', '4949', '4952', '4964', '5295', '5301', '5305', '5381', '5950', '6064', '6065', '609', '611', '646', '6872', '6874', '701', '7018', '7425', '7426', '7650', '7652', '7847', '7849', '7853', '8025', '8088', '8097', '8272', '8369', '8530', '8722', '8749', '8750', '8751', '8928', '8935', '8990', '9058', '9088', '9114', '9382', '9510', '9764', '9805', '9806', '9807', '9808', '9905', '9906', '9911', '10029'))
group by	
	a13.ID_DT_ANO,
	a14.ID_ITCP_CLASSE_MAT_SERV,
	a15.ID_UNDD_IN_SISG,
	a14.ID_ITCP_PADRAO_DESC_MAT,
	a16.ID_UNDD_ORGAO_VINC
having	sum(a11.VL_PRECO_TOTAL_HOMOLOG) > 0 
)
, ZZSP01  as (
select	
	a16.ID_UNDD_ORGAO_VINC  ID_UNDD_ORGAO_VINC,
	a14.ID_ITCP_PADRAO_DESC_MAT  ID_ITCP_PADRAO_DESC_MAT,
	a15.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a14.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV,
	a13.ID_DT_ANO  ID_DT_ANO,
	sum(a11.QT_ITCP_ITEM_COMPRAS)  WJXBFS1
from	Siasg_DW_VBL.F_ITEM_COMPRA	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a15
	  on 	(a12.ID_UNDD_RESP_COMPRA = a15.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a16
	  on 	(a15.ID_UNDD_ORGAO = a16.ID_UNDD_ORGAO)
	join	ZZMQ00	pa17
	  on 	(a13.ID_DT_ANO = pa17.ID_DT_ANO and 
			a14.ID_ITCP_CLASSE_MAT_SERV = pa17.ID_ITCP_CLASSE_MAT_SERV and 
			a14.ID_ITCP_PADRAO_DESC_MAT = pa17.ID_ITCP_PADRAO_DESC_MAT and 
			a15.ID_UNDD_IN_SISG = pa17.ID_UNDD_IN_SISG and 
			a16.ID_UNDD_ORGAO_VINC = pa17.ID_UNDD_ORGAO_VINC)
where	(a13.ID_DT_ANO in (2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023)
	 and a14.ID_ITCP_PADRAO_DESC_MAT in ('588', '644', '645', '680', '7944', '7945', '8134', '8184', '822', '823', '824', '825', '826', '827', '828', '829', '830', '858', '859', '860', '880', '885', '890', '904', '905', '10165', '10166', '10167', '10168', '10169', '10170', '10171', '10172', '10182', '10186', '10192', '10193', '10194', '10195', '10196', '10197', '10198', '10199', '10200', '10201', '10202', '10203', '10204', '10205', '10206', '10209', '10210', '10522', '10572', '10713', '10988', '11267', '11269', '11377', '11381', '11400', '11657', '11855', '11927', '11928', '12046', '12168', '12182', '12428', '12438', '12481', '12544', '12545', '12546', '12992', '13020', '13213', '13214', '13234', '13318', '13335', '13388', '13527', '13542', '13860', '13864', '14248', '14691', '14695', '15008', '15031', '15209', '15604', '16128', '16172', '1637', '16733', '16734', '16735', '16736', '16737', '16738', '16739', '16740', '16741', '16742', '16743', '16794', '17294', '17296', '17310', '17312', '17313', '18328', '18712', '19586', '19690', '19714', '19737', '19739', '19740', '19741', '19742', '19763', '19770', '19771', '19772', '19773', '19789', '19790', '19791', '19792', '19793', '19794', '19935', '2137', '2156', '2206', '2207', '2276', '2300', '2327', '2339', '2398', '3043', '3151', '3161', '3267', '3437', '3439', '3509', '3510', '3516', '3678', '3909', '3933', '4069', '4357', '4507', '4548', '4550', '4551', '4552', '4553', '4554', '4555', '4556', '4557', '4558', '4559', '4560', '4716', '4717', '4742', '4857', '4948', '4949', '4952', '4964', '5295', '5301', '5305', '5381', '5950', '6064', '6065', '609', '611', '646', '6872', '6874', '701', '7018', '7425', '7426', '7650', '7652', '7847', '7849', '7853', '8025', '8088', '8097', '8272', '8369', '8530', '8722', '8749', '8750', '8751', '8928', '8935', '8990', '9058', '9088', '9114', '9382', '9510', '9764', '9805', '9806', '9807', '9808', '9905', '9906', '9911', '10029'))
group by	
	a16.ID_UNDD_ORGAO_VINC,
	a14.ID_ITCP_PADRAO_DESC_MAT,
	a15.ID_UNDD_IN_SISG,
	a14.ID_ITCP_CLASSE_MAT_SERV,
	a13.ID_DT_ANO 
),
ZZSP02  as (
select	
	a16.ID_UNDD_ORGAO_VINC  ID_UNDD_ORGAO_VINC,
	a14.ID_ITCP_PADRAO_DESC_MAT  ID_ITCP_PADRAO_DESC_MAT,
	a15.ID_UNDD_IN_SISG  ID_UNDD_IN_SISG,
	a14.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV,
	a13.ID_DT_ANO  ID_DT_ANO,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)  WJXBFS1
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a12
	  on 	(a11.ID_CMPR_COMPRA = a12.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a13
	  on 	(a12.DT_CMPR_RESULTADO_COMPRA = a13.ID_DT_DATA)
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a14
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a14.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a15
	  on 	(a12.ID_UNDD_RESP_COMPRA = a15.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a16
	  on 	(a15.ID_UNDD_ORGAO = a16.ID_UNDD_ORGAO)
	join	ZZMQ00	pa17
	  on 	(a13.ID_DT_ANO = pa17.ID_DT_ANO and 
			a14.ID_ITCP_CLASSE_MAT_SERV = pa17.ID_ITCP_CLASSE_MAT_SERV and 
			a14.ID_ITCP_PADRAO_DESC_MAT = pa17.ID_ITCP_PADRAO_DESC_MAT and 
			a15.ID_UNDD_IN_SISG = pa17.ID_UNDD_IN_SISG and 
			a16.ID_UNDD_ORGAO_VINC = pa17.ID_UNDD_ORGAO_VINC)
where	(a13.ID_DT_ANO in (2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023)
	 and a14.ID_ITCP_PADRAO_DESC_MAT in ('588', '644', '645', '680', '7944', '7945', '8134', '8184', '822', '823', '824', '825', '826', '827', '828', '829', '830', '858', '859', '860', '880', '885', '890', '904', '905', '10165', '10166', '10167', '10168', '10169', '10170', '10171', '10172', '10182', '10186', '10192', '10193', '10194', '10195', '10196', '10197', '10198', '10199', '10200', '10201', '10202', '10203', '10204', '10205', '10206', '10209', '10210', '10522', '10572', '10713', '10988', '11267', '11269', '11377', '11381', '11400', '11657', '11855', '11927', '11928', '12046', '12168', '12182', '12428', '12438', '12481', '12544', '12545', '12546', '12992', '13020', '13213', '13214', '13234', '13318', '13335', '13388', '13527', '13542', '13860', '13864', '14248', '14691', '14695', '15008', '15031', '15209', '15604', '16128', '16172', '1637', '16733', '16734', '16735', '16736', '16737', '16738', '16739', '16740', '16741', '16742', '16743', '16794', '17294', '17296', '17310', '17312', '17313', '18328', '18712', '19586', '19690', '19714', '19737', '19739', '19740', '19741', '19742', '19763', '19770', '19771', '19772', '19773', '19789', '19790', '19791', '19792', '19793', '19794', '19935', '2137', '2156', '2206', '2207', '2276', '2300', '2327', '2339', '2398', '3043', '3151', '3161', '3267', '3437', '3439', '3509', '3510', '3516', '3678', '3909', '3933', '4069', '4357', '4507', '4548', '4550', '4551', '4552', '4553', '4554', '4555', '4556', '4557', '4558', '4559', '4560', '4716', '4717', '4742', '4857', '4948', '4949', '4952', '4964', '5295', '5301', '5305', '5381', '5950', '6064', '6065', '609', '611', '646', '6872', '6874', '701', '7018', '7425', '7426', '7650', '7652', '7847', '7849', '7853', '8025', '8088', '8097', '8272', '8369', '8530', '8722', '8749', '8750', '8751', '8928', '8935', '8990', '9058', '9088', '9114', '9382', '9510', '9764', '9805', '9806', '9807', '9808', '9905', '9906', '9911', '10029'))
group by	
	a16.ID_UNDD_ORGAO_VINC,
	a14.ID_ITCP_PADRAO_DESC_MAT,
	a15.ID_UNDD_IN_SISG,
	a14.ID_ITCP_CLASSE_MAT_SERV,
	a13.ID_DT_ANO 
)
select
	case
		when a13.ID_ITCP_GRUPO_MATERIAL in (15) 					then 'AVIAÇÃO'
		when a13.ID_ITCP_CLASSE_MAT_SERV_EDIT in (8905) 			then 'CARNES, AVES E PEIXES'
		when a13.ID_ITCP_CLASSE_MAT_SERV_EDIT in (8915) 			then 'HORTIFRUTIS'
		when a13.ID_ITCP_CLASSE_MAT_SERV_EDIT in (9130,9140,9150) 	then 'COMBUSTÍVEIS E LUBRIFICANTES'
		when pa11.ID_ITCP_PADRAO_DESC_MAT in ('19586') 				then 'OVO'
		when pa11.ID_ITCP_PADRAO_DESC_MAT in ('3043','880','19690') 	then 'ARROZ'
		when pa11.ID_ITCP_PADRAO_DESC_MAT in ('890') 				then 'FEIJÃO'
		when pa11.ID_ITCP_PADRAO_DESC_MAT in ('12182')				then 'SOJA'
	end as CATEGORIA,
	pa11.ID_DT_ANO  					ID_DT_ANO,
	--	
	a16.DS_UNDD_IN_SISG  				DS_UNDD_IN_SISG,
	a19.DS_UNDD_ORGAO_SUP  				DS_UNDD_ORGAO_SUP,
	a14.DS_UNDD_ORGAO_VINC  			DS_UNDD_ORGAO_VINC,
	a18.DS_ITCP_GRUPO_MATERIAL  		DS_ITCP_GRUPO_MATERIAL,
	a13.DS_ITCP_CLASSE_MAT_SERV  		DS_ITCP_CLASSE_MAT_SERV,
	a17.DS_ITCP_PADRAO_DESC_MAT  		DS_ITCP_PADRAO_DESC_MAT,
	--
	pa11.ID_UNDD_IN_SISG  				ID_UNDD_IN_SISG,
	a14.ID_UNDD_ORGAO_SUP  				ID_UNDD_ORGAO_SUP,
	pa11.ID_UNDD_ORGAO_VINC  			ID_UNDD_ORGAO_VINC,
	a13.ID_ITCP_GRUPO_MATERIAL  		ID_ITCP_GRUPO_MATERIAL,
	CAST(SUBSTRING(pa11.ID_ITCP_PADRAO_DESC_MAT,2) AS INTEGER) ID_ITCP_PADRAO_DESC_MAT,
	a13.ID_ITCP_CLASSE_MAT_SERV_EDIT	ID_ITCP_CLASSE_MAT_SERV,
	--
	pa11.WJXBFS1  						QT_ITCP_ITEM_COMPRAS, 	-- WJXBFS1
	pa12.WJXBFS1  						VL_PRECO_TOTAL_HOMOLOG 	-- WJXBFS2
--	Campos ocultados: 
--	a15.DS_DT_ANO  DS_DT_ANO
--	pa11.ID_ITCP_CLASSE_MAT_SERV  ID_ITCP_CLASSE_MAT_SERV
from	ZZSP01	pa11
	join	ZZSP02	pa12
	  on 	(pa11.ID_DT_ANO = pa12.ID_DT_ANO and 
			pa11.ID_ITCP_CLASSE_MAT_SERV = pa12.ID_ITCP_CLASSE_MAT_SERV and 
			pa11.ID_ITCP_PADRAO_DESC_MAT = pa12.ID_ITCP_PADRAO_DESC_MAT and 
			pa11.ID_UNDD_IN_SISG = pa12.ID_UNDD_IN_SISG and 
			pa11.ID_UNDD_ORGAO_VINC = pa12.ID_UNDD_ORGAO_VINC)
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV	a13
	  on 	(pa11.ID_ITCP_CLASSE_MAT_SERV = a13.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_VINC	a14
	  on 	(pa11.ID_UNDD_ORGAO_VINC = a14.ID_UNDD_ORGAO_VINC)
	join	Siasg_DW_VBL.D_DT_ANO	a15
	  on 	(pa11.ID_DT_ANO = a15.ID_DT_ANO)
	join	Siasg_DW_VBL.D_UNDD_IN_SISG	a16
	  on 	(pa11.ID_UNDD_IN_SISG = a16.ID_UNDD_IN_SISG)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT	a17
	  on 	(pa11.ID_ITCP_PADRAO_DESC_MAT = a17.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a18
	  on 	(a13.ID_ITCP_GRUPO_MATERIAL = a18.ID_ITCP_GRUPO_MATERIAL)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_SUP	a19
	  on 	(a14.ID_UNDD_ORGAO_SUP = a19.ID_UNDD_ORGAO_SUP)
;