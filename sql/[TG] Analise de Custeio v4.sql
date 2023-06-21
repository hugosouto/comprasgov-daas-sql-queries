select	
--	a12.ID_ITEM_INFORMACAO  				ID_ITEM_INFORMACAO,
--	max(a113.NO_ITEM_INFORMACAO)  			NO_ITEM_INFORMACAO,
--	max(a113.CO_ITEM_INFORMACAO)  			CO_ITEM_INFORMACAO,
	a17.ID_ORGAO_MAXI  						ID_ORGAO_UO_MAXI,
--	max(a121.CO_ORGAO_MAXI)  				CO_ORGAO_UO_MAXI,
	max(a121.NO_ORGAO_MAXI)  				NO_ORGAO_UO_MAXI,
	a15.ID_ORGAO_UO  						ID_ORGAO_UO,
--	max(a120.CO_ORGAO)  					CO_ORGAO_UO,
	max(a120.NO_ORGAO)  					NO_ORGAO_UO,
	a19.ID_ORGAO_MAXI  						ID_ORGAO_UG_MAXI,
--	max(a123.CO_ORGAO_MAXI)  				CO_ORGAO_UG_MAXI,
	max(a123.NO_ORGAO_MAXI)  				NO_ORGAO_UG_MAXI,
	a14.ID_ORGAO_UG  						ID_ORGAO_UG,
--	max(a122.CO_ORGAO) 						CO_ORGAO_UG,
	max(a122.NO_ORGAO) 						NO_ORGAO_UG,
	a14.ID_UG  								ID_UG,
--	max(a110.CO_UG)  						CO_UG,
	max(a110.NO_UG) 						NO_UG,
	a11.ID_FUNCAO_PT  						ID_FUNCAO_PT,
	max(a112.NO_FUNCAO_PT)  				NO_FUNCAO_PT,
	a11.ID_SUBFUNCAO_PT  					ID_SUBFUNCAO_PT,
	max(a118.NO_SUBFUNCAO_PT)  				NO_SUBFUNCAO_PT,
--	(a11.ID_CATEGORIA_ECONOMICA_NADE||a11.ID_GRUPO_DESPESA_NADE||a11.ID_MOAP_NADE||a11.ID_ELEMENTO_DESPESA_NADE) ID_NATUREZA_DESPESA,
--	a11.ID_CATEGORIA_ECONOMICA_NADE			ID_CATEGORIA_ECONOMICA_NADE,
--	a11.ID_GRUPO_DESPESA_NADE  				ID_GRUPO_DESPESA_NADE,
--	a11.ID_MOAP_NADE  						ID_MOAP_NADE,
--	a11.ID_ELEMENTO_DESPESA_NADE  			ID_ELEMENTO_DESPESA_NADE,
--	a11.ID_PROGRAMA_PT  					ID_PROGRAMA_PT,
--	max(a117.NO_PROGRAMA_PT)  				NO_PROGRAMA_PT,
	a11.ID_ACAO_PT  						ID_ACAO_PT,
	max(a111.NO_ACAO_PT)  					NO_ACAO_PT,
--	a11.ID_SUBITEM_NADE  					ID_SUBITEM_NADE,
	max(a116.CO_NATUREZA_DESPESA_DETA)  	CO_NATUREZA_DESPESA_DETA,
	max(a116.NO_NATUREZA_DESPESA_DETA)  	NO_NATUREZA_DESPESA_DETA,
	a13.ID_MODALIDADE_LICITACAO_NE  		ID_MODALIDADE_LICITACAO_NE,
--	max(a114.CO_MODALIDADE_LICITACAO_NE)  	CO_MODALIDADE_LICITACAO_NE,
	max(a114.NO_MODALIDADE_LICITACAO_NE)  	NO_MODALIDADE_LICITACAO_NE,
	a13.ID_TP_NE  							ID_TP_NE,
	max(a119.NO_TP_NE)  					NO_TP_NE,
	CAST(a11.ID_ANO_LANC||'-'||LPAD(a11.ID_MES_LANC, 2, 0)||'-28' AS DATE) AS "DATA",
--	a11.ID_ANO_LANC 			 			ID_ANO,
--	a11.ID_MES_LANC  						ID_MES,
--	max(a115.NO_MES)  						NO_MES,
--	sum(a11.VA_MOVIMENTO_LIQUIDO) 			MOVIMLQUIDOMOEDAORIGEMCONTACO,
	sum(case when a12.ID_ITEM_INFORMACAO = 421 then a11.VA_MOVIMENTO_LIQUIDO else 0 end) DESPESAS_EMPENHADAS,
	sum(case when a12.ID_ITEM_INFORMACAO = 423 then a11.VA_MOVIMENTO_LIQUIDO else 0 end) DESPESAS_PAGAS
from	DWTG_Colunar_VBL.WF_LANCAMENTO_EP20				a11
	join	DWTG_Colunar_VBL.WD_ITEM_DECODIFICADO_CCON	a12
	  on 	(a11.ID_ANO_LANC = a12.ID_ANO_ITEM_CONTA and 
	a11.ID_CONTA_CONTABIL_LANC = a12.ID_CONTA_CONTABIL)
	join	DWTG_Colunar_VBL.WD_DOC_NE					a13
	  on 	(a11.ID_DOCUMENTO_CCOR = a13.ID_DOC_NE)
	join	DWTG_Colunar_VBL.WD_UG_EXERCICIO			a14
	  on 	(a11.ID_ANO_LANC = a14.ID_ANO and 
	a11.ID_UG_EXEC = a14.ID_UG)
	join	DWTG_Colunar_VBL.WD_UO_EXERCICIO			a15
	  on 	(a11.ID_ANO_LANC = a15.ID_ANO and 
			a11.ID_UO = a15.ID_UO)
	join	DWTG_Colunar_VBL.WD_ORGAO_EXERCICIO			a16
	  on 	(a15.ID_ANO = a16.ID_ANO and 
			a15.ID_ORGAO_UO = a16.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_SUPE_EXERCICIO	a17
	  on 	(a16.ID_ANO = a17.ID_ANO and 
			a16.ID_ORGAO_SUPE = a17.ID_ORGAO_SUPE)
	join	DWTG_Colunar_VBL.WD_ORGAO_EXERCICIO			a18
	  on 	(a14.ID_ANO = a18.ID_ANO and 
			a14.ID_ORGAO_UG = a18.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_SUPE_EXERCICIO	a19
	  on 	(a18.ID_ANO = a19.ID_ANO and 
			a18.ID_ORGAO_SUPE = a19.ID_ORGAO_SUPE)
	join	DWTG_Colunar_VBL.WD_UG						a110
	  on 	(a14.ID_UG = a110.ID_UG)
	join	DWTG_Colunar_VBL.WD_ACAO_PT					a111
	  on 	(a11.ID_ACAO_PT = a111.ID_ACAO_PT)
	join	DWTG_Colunar_VBL.WD_FUNCAO_PT				a112
	  on 	(a11.ID_FUNCAO_PT = a112.ID_FUNCAO_PT)
	join	DWTG_Colunar_VBL.WD_ITEM_INFORMACAO			a113
	  on 	(a12.ID_ITEM_INFORMACAO = a113.ID_ITEM_INFORMACAO)
	join	DWTG_Colunar_VBL.WD_MODALIDADE_LICITACAO_NE	a114
	  on 	(a13.ID_MODALIDADE_LICITACAO_NE = a114.ID_MODALIDADE_LICITACAO_NE)
	join	DWTG_Colunar_VBL.WD_MES_BASE				a115
	  on 	(a11.ID_MES_LANC = a115.ID_MES)
	join	DWTG_Colunar_VBL.WD_NATUREZA_DESPESA_DETA	a116
	  on 	(a11.ID_CATEGORIA_ECONOMICA_NADE = a116.ID_CATEGORIA_ECONOMICA_NADE and 
			a11.ID_ELEMENTO_DESPESA_NADE = a116.ID_ELEMENTO_DESPESA_NADE and 
			a11.ID_GRUPO_DESPESA_NADE = a116.ID_GRUPO_DESPESA_NADE and 
			a11.ID_MOAP_NADE = a116.ID_MOAP_NADE and 
			a11.ID_SUBITEM_NADE = a116.ID_SUBITEM_NADE)
	join	DWTG_Colunar_VBL.WD_PROGRAMA_PT				a117
	  on 	(a11.ID_PROGRAMA_PT = a117.ID_PROGRAMA_PT)
	join	DWTG_Colunar_VBL.WD_SUBFUNCAO_PT			a118
	  on 	(a11.ID_SUBFUNCAO_PT = a118.ID_SUBFUNCAO_PT)
	join	DWTG_Colunar_VBL.WD_TP_NE					a119
	  on 	(a13.ID_TP_NE = a119.ID_TP_NE)
	join	DWTG_Colunar_VBL.WD_ORGAO					a120
	  on 	(a15.ID_ORGAO_UO = a120.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_MAXI				a121
	  on 	(a17.ID_ORGAO_MAXI = a121.ID_ORGAO_MAXI)
	join	DWTG_Colunar_VBL.WD_ORGAO					a122
	  on 	(a14.ID_ORGAO_UG = a122.ID_ORGAO)
	join	DWTG_Colunar_VBL.WD_ORGAO_MAXI				a123
	  on 	(a19.ID_ORGAO_MAXI = a123.ID_ORGAO_MAXI)
	join	DWTG_Colunar_VBL.WD_ELEMENTO_DESPESA_NADE	a124
	  on 	(a11.ID_ELEMENTO_DESPESA_NADE = a124.ID_ELEMENTO_DESPESA_NADE)
where	(a11.ID_CATEGORIA_ECONOMICA_NADE = 3
		 and (a11.ID_GRUPO_DESPESA_NADE = 3
		 and (a11.ID_MOAP_NADE = 90
		 and a11.ID_ELEMENTO_DESPESA_NADE in (4, 14, 15, 30, 31, 32, 33, 34, 35, 36, 37, 39, 40)))
		 and a17.ID_ORGAO_MAXI in (22000, 25000, 20103, 20105, 20113, 23000, 24000, 28000, 30000, 32000, 33000, 34000, 35000, 38000, 39000, 40000, 41000, 42000, 44000, 47000, 49000, 51000, 53000, 54000, 55000, 56000, 58000, 81000, 82000, 26000, 36000, 20000, 20101, 20114, 26455, 26457, 52000, 57000, 63000)
		 and a12.ID_ITEM_INFORMACAO in (421, 423)
		 and a110.ID_MOEDA_UG in (790)
		 and a11.ID_ANO_LANC in (2020)
		 and a11.ID_MES_LANC in (2))
group by
--	a12.ID_ITEM_INFORMACAO,
	a11.ID_ANO_LANC,
	a11.ID_MES_LANC,
	a14.ID_ORGAO_UG,
	a11.ID_ACAO_PT,
	a11.ID_FUNCAO_PT,
--	a11.ID_PROGRAMA_PT,
	a11.ID_SUBFUNCAO_PT,
--	a11.ID_CATEGORIA_ECONOMICA_NADE,
--	a11.ID_GRUPO_DESPESA_NADE,
--	a11.ID_MOAP_NADE,
--	a11.ID_ELEMENTO_DESPESA_NADE,
	a11.ID_SUBITEM_NADE,
	a13.ID_TP_NE,
	a13.ID_MODALIDADE_LICITACAO_NE,
	a17.ID_ORGAO_MAXI,
	a14.ID_UG,
	a15.ID_ORGAO_UO,
	a11.ID_ELEMENTO_DESPESA_NADE,
	a19.ID_ORGAO_MAXI