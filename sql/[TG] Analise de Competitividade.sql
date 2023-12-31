select	a12.ID_ITEM_INFORMACAO  		ID_ITEM_INFORMACAO,
	max(a111.NO_ITEM_INFORMACAO)  		NO_ITEM_INFORMACAO,
	max(a111.CO_ITEM_INFORMACAO)  		CO_ITEM_INFORMACAO,
	a11.ID_ANO_LANC  					ID_ANO,
	a11.ID_MES_LANC  					ID_MES,
	max(a112.NO_MES)  					NO_MES,
	a13.ID_ORGAO_UG  					ID_ORGAO,
	max(a17.CO_ORGAO) 					CO_ORGAO,
	max(a17.NO_ORGAO)  					NO_ORGAO,
	a11.ID_CATEGORIA_ECONOMICA_NADE 	ID_CATEGORIA_ECONOMICA_NADE,
	a11.ID_GRUPO_DESPESA_NADE  			ID_GRUPO_DESPESA_NADE,
	a11.ID_MOAP_NADE  					ID_MOAP_NADE,
	a11.ID_ELEMENTO_DESPESA_NADE  		ID_ELEMENTO_DESPESA_NADE,
	a11.ID_SUBITEM_NADE  				ID_SUBITEM_NADE,
	max(a19.CO_NATUREZA_DESPESA_DETA) 	CO_NATUREZA_DESPESA_DETA,
	max(a19.NO_NATUREZA_DESPESA_DETA) 	NO_NATUREZA_DESPESA_DETA,
	a13.ID_UG  							ID_UG_EXEC,
	max(a16.CO_UG)  					CO_UG,
	max(a16.NO_UG)  					NO_UG,
	a15.ID_ORGAO_MAXI  					ID_ORGAO_MAXI,
	max(a110.CO_ORGAO_MAXI)  			CO_ORGAO_MAXI,
	max(a110.NO_ORGAO_MAXI)  			NO_ORGAO_MAXI,
	a11.ID_CATEGORIA_ECONOMICA_NADE 	ID_CATEGORIA_ECONOMICA_NADE0,
	a11.ID_GRUPO_DESPESA_NADE  			ID_GRUPO_DESPESA_NADE0,
	a11.ID_MOAP_NADE  					ID_MOAP_NADE0,
	a11.ID_ELEMENTO_DESPESA_NADE  		ID_ELEMENTO_DESPESA_NADE0,
	max(a113.CO_NATUREZA_DESPESA)  		CO_NATUREZA_DESPESA,
	max(a113.NO_NATUREZA_DESPESA)  		NO_NATUREZA_DESPESA,
	a11.ID_ANO_LANC  					ID_ANO0,
	a11.ID_MES_LANC  					ID_MES0,
	a11.ID_DIA_LANC  					ID_DIA,
	max(a18.NO_DIA_COMPLETO)  			NO_DIA_COMPLETO,
	sum((a11.VA_MOVIMENTO_LIQUIDO * a12.IN_OPERACAO_EXPRESSAO))  MOVIMLQUIDOACUMMOEDAORIGEMITE
from		DWTG_Colunar_VBL.WF_LANCAMENTO	a11
	join	DWTG_Colunar_VBL.WD_ITEM_DECODIFICADO_CCON	a12
	  on 	(a11.ID_ANO_LANC = a12.ID_ANO_ITEM_CONTA and 
			a11.ID_CONTA_CONTABIL_LANC = a12.ID_CONTA_CONTABIL)
	join	DWTG_Colunar_VBL.WD_UG_EXERCICIO	a13
	  on 	(a11.ID_ANO_LANC = a13.ID_ANO and 
			a11.ID_UG_EXEC = a13.ID_UG)
	join	DWTG_Colunar_VBL.WD_ORGAO_EXERCICIO	a14
	  on 	(a13.ID_ANO = a14.ID_ANO and 
			a13.ID_ORGAO_UG = a14.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_SUPE_EXERCICIO	a15
	  on 	(a14.ID_ANO = a15.ID_ANO and 
			a14.ID_ORGAO_SUPE = a15.ID_ORGAO_SUPE)
	join	DWTG_Colunar_VBL.WD_UG	a16
	  on 	(a13.ID_UG = a16.ID_UG)
	join	DWTG_Colunar_VBL.WD_ORGAO	a17
	  on 	(a13.ID_ORGAO_UG = a17.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_DIA	a18
	  on 	(a11.ID_ANO_LANC = a18.ID_ANO and 
			a11.ID_DIA_LANC = a18.ID_DIA and 
			a11.ID_MES_LANC = a18.ID_MES)
	join	DWTG_Colunar_VBL.WD_NATUREZA_DESPESA_DETA	a19
	  on 	(a11.ID_CATEGORIA_ECONOMICA_NADE = a19.ID_CATEGORIA_ECONOMICA_NADE and 
			a11.ID_ELEMENTO_DESPESA_NADE = a19.ID_ELEMENTO_DESPESA_NADE and 
			a11.ID_GRUPO_DESPESA_NADE = a19.ID_GRUPO_DESPESA_NADE and 
			a11.ID_MOAP_NADE = a19.ID_MOAP_NADE and 
			a11.ID_SUBITEM_NADE = a19.ID_SUBITEM_NADE)
	join	DWTG_Colunar_VBL.WD_ORGAO_MAXI	a110
	  on 	(a15.ID_ORGAO_MAXI = a110.ID_ORGAO_MAXI)
	join	DWTG_Colunar_VBL.WD_ITEM_INFORMACAO	a111
	  on 	(a12.ID_ITEM_INFORMACAO = a111.ID_ITEM_INFORMACAO)
	join	DWTG_Colunar_VBL.WD_MES_BASE	a112
	  on 	(a11.ID_MES_LANC = a112.ID_MES)
	join	DWTG_Colunar_VBL.WD_NATUREZA_DESPESA	a113
	  on 	(a11.ID_CATEGORIA_ECONOMICA_NADE = a113.ID_CATEGORIA_ECONOMICA_NADE and 
			a11.ID_ELEMENTO_DESPESA_NADE = a113.ID_ELEMENTO_DESPESA_NADE and 
			a11.ID_GRUPO_DESPESA_NADE = a113.ID_GRUPO_DESPESA_NADE and 
			a11.ID_MOAP_NADE = a113.ID_MOAP_NADE)
where	(a11.ID_CATEGORIA_ECONOMICA_NADE = 3
 and (a11.ID_GRUPO_DESPESA_NADE = 3
 and (a11.ID_MOAP_NADE = 90
 and ((a11.ID_ELEMENTO_DESPESA_NADE = 39
 and a11.ID_SUBITEM_NADE in (10, 79, 43, 5, 16, 78, 77, 2, 47, 58, 17))
 or (a11.ID_ELEMENTO_DESPESA_NADE = 37
 and a11.ID_SUBITEM_NADE in (1, 2, 3)))))
 and a17.ID_PODER_ORGAO in (0)
 and a16.ID_ESFERA_ADMIN_UG in (0)
 and a12.ID_ITEM_INFORMACAO in (61)
 and a17.ID_TP_ADMIN_ORGAO in (1, 3, 4)
 and a15.ID_ORGAO_MAXI in (22000)
 and a13.ID_UG in (130024)
 and a16.ID_MOEDA_UG in (790)
 and a11.ID_ANO_LANC in (2020, 2019, 2018, 2017, 2016, 2015))
group by	a12.ID_ITEM_INFORMACAO,
	a11.ID_ANO_LANC,
	a11.ID_MES_LANC,
	a13.ID_ORGAO_UG,
	a11.ID_CATEGORIA_ECONOMICA_NADE,
	a11.ID_GRUPO_DESPESA_NADE,
	a11.ID_MOAP_NADE,
	a11.ID_ELEMENTO_DESPESA_NADE,
	a11.ID_SUBITEM_NADE,
	a13.ID_UG,
	a15.ID_ORGAO_MAXI,
	a11.ID_CATEGORIA_ECONOMICA_NADE,
	a11.ID_GRUPO_DESPESA_NADE,
	a11.ID_MOAP_NADE,
	a11.ID_ELEMENTO_DESPESA_NADE,
	a11.ID_ANO_LANC,
	a11.ID_MES_LANC,
	a11.ID_DIA_LANC
;

	
	
	
	
select	
	cast(max(a11.ID_ANO_LANC)||'-'||lpad(max(a11.ID_MES_LANC),2,0)||'-'||lpad(max(a11.ID_DIA_LANC),2,0) as date) as DATA,
	max(a112.CO_ORGAO_MAXI)  				CO_ORGAO_MAXI,
	max(a19.CO_ORGAO)  						CO_ORGAO,
	max(a18.CO_UG)  						CO_UG,
	max(a115.CO_NATUREZA_DESPESA)  			CO_NATUREZA_DESPESA,
	max(a111.CO_NATUREZA_DESPESA_DETA)  	CO_NATUREZA_DESPESA_DETA,
	max(a112.NO_ORGAO_MAXI)  				NO_ORGAO_MAXI,
	max(a19.NO_ORGAO)  						NO_ORGAO,
	max(a18.NO_UG)  						NO_UG,
	max(a115.NO_NATUREZA_DESPESA)  			NO_NATUREZA_DESPESA,
	max(a111.NO_NATUREZA_DESPESA_DETA)  	NO_NATUREZA_DESPESA_DETA,
	sum((a11.VA_MOVIMENTO_LIQUIDO * a12.IN_OPERACAO_EXPRESSAO))  DESPESAS_PAGAS
from	DWTG_Colunar_VBL.WF_LANCAMENTO	a11
	join	DWTG_Colunar_VBL.WD_ITEM_DECODIFICADO_CCON	a12
	  on 	(a11.ID_ANO_LANC = a12.ID_ANO_ITEM_CONTA and 
			a11.ID_CONTA_CONTABIL_LANC = a12.ID_CONTA_CONTABIL)
	join	DWTG_Colunar_VBL.WD_UG_EXERCICIO	a13
	  on 	(a11.ID_ANO_LANC = a13.ID_ANO and 
			a11.ID_UG_EXEC = a13.ID_UG)
	join	DWTG_Colunar_VBL.WD_UO_EXERCICIO	a14
	  on 	(a11.ID_ANO_LANC = a14.ID_ANO and 
			a11.ID_UO = a14.ID_UO)
	join	DWTG_Colunar_VBL.WD_ORGAO	a15
	  on 	(a14.ID_ORGAO_UO = a15.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_EXERCICIO	a16
	  on 	(a13.ID_ANO = a16.ID_ANO and 
			a13.ID_ORGAO_UG = a16.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_SUPE_EXERCICIO	a17
	  on 	(a16.ID_ANO = a17.ID_ANO and 
			a16.ID_ORGAO_SUPE = a17.ID_ORGAO_SUPE)
	join	DWTG_Colunar_VBL.WD_UG	a18
	  on 	(a13.ID_UG = a18.ID_UG)
	join	DWTG_Colunar_VBL.WD_ORGAO	a19
	  on 	(a13.ID_ORGAO_UG = a19.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_DIA	a110
	  on 	(a11.ID_ANO_LANC = a110.ID_ANO and 
			a11.ID_DIA_LANC = a110.ID_DIA and 
			a11.ID_MES_LANC = a110.ID_MES)
	join	DWTG_Colunar_VBL.WD_NATUREZA_DESPESA_DETA	a111
	  on 	(a11.ID_CATEGORIA_ECONOMICA_NADE = a111.ID_CATEGORIA_ECONOMICA_NADE and 
			a11.ID_ELEMENTO_DESPESA_NADE = a111.ID_ELEMENTO_DESPESA_NADE and 
			a11.ID_GRUPO_DESPESA_NADE = a111.ID_GRUPO_DESPESA_NADE and 
			a11.ID_MOAP_NADE = a111.ID_MOAP_NADE and 
			a11.ID_SUBITEM_NADE = a111.ID_SUBITEM_NADE)
	join	DWTG_Colunar_VBL.WD_ORGAO_MAXI	a112
	  on 	(a17.ID_ORGAO_MAXI = a112.ID_ORGAO_MAXI)
	join	DWTG_Colunar_VBL.WD_ITEM_INFORMACAO	a113
	  on 	(a12.ID_ITEM_INFORMACAO = a113.ID_ITEM_INFORMACAO)
	join	DWTG_Colunar_VBL.WD_MES_BASE	a114
	  on 	(a11.ID_MES_LANC = a114.ID_MES)
	join	DWTG_Colunar_VBL.WD_NATUREZA_DESPESA	a115
	  on 	(a11.ID_CATEGORIA_ECONOMICA_NADE = a115.ID_CATEGORIA_ECONOMICA_NADE and 
			a11.ID_ELEMENTO_DESPESA_NADE = a115.ID_ELEMENTO_DESPESA_NADE and 
			a11.ID_GRUPO_DESPESA_NADE = a115.ID_GRUPO_DESPESA_NADE and 
			a11.ID_MOAP_NADE = a115.ID_MOAP_NADE)
where (
	--	 	a11.ID_CATEGORIA_ECONOMICA_NADE = 3
	-- and (a11.ID_GRUPO_DESPESA_NADE = 3
	-- and (a11.ID_MOAP_NADE = 90
	-- and ((a11.ID_ELEMENTO_DESPESA_NADE in (30, 37, 39)
	-- and a11.ID_SUBITEM_NADE in (10, 79, 43, 5, 16, 78, 77, 2, 47, 58, 17))
	-- or (a11.ID_ELEMENTO_DESPESA_NADE = 37
	-- and a11.ID_SUBITEM_NADE in (1, 2, 3))))) and
	 	 a18.ID_ESFERA_ADMIN_UG 	in (0)
	 and a15.ID_PODER_ORGAO in (0)
	 and a12.ID_ITEM_INFORMACAO in (61)
	 and (a11.ID_CATEGORIA_ECONOMICA_NADE = 3 and a11.ID_GRUPO_DESPESA_NADE = 3 and a11.ID_MOAP_NADE = 90 and a11.ID_ELEMENTO_DESPESA_NADE in (30, 37, 39))
	-- and a17.ID_ORGAO_MAXI in (22000)
	-- and a13.ID_UG in (130024)
	 and a19.ID_TP_ADMIN_ORGAO in (1, 3, 4)
	 and a18.ID_MOEDA_UG in (790)
	 and a11.ID_ANO_LANC in (2020, 2019, 2018, 2017, 2016, 2015,)
	 )
group by	
	a12.ID_ITEM_INFORMACAO,
	a11.ID_ANO_LANC,
	a11.ID_MES_LANC,
	a11.ID_DIA_LANC,
	a17.ID_ORGAO_MAXI,
	a13.ID_ORGAO_UG,
	a13.ID_UG,
	a111.ID_CATEGORIA_ECONOMICA_NADE,
	a111.ID_GRUPO_DESPESA_NADE,
	a111.ID_MOAP_NADE,
	a111.ID_ELEMENTO_DESPESA_NADE;