select
--	a16.ID_UNDD_ESFERA  			ID_UNDD_ESFERA,
	a119.DS_UNDD_ESFERA  			DS_UNDD_ESFERA,
--	a16.ID_UNDD_PODER  				ID_UNDD_PODER,
	a114.DS_UNDD_PODER  			DS_UNDD_PODER,
--	a16.ID_UNDD_IN_SISG  			ID_UNDD_IN_SISG,
	a121.DS_UNDD_IN_SISG  			DS_UNDD_IN_SISG,
--	a16.ID_UNDD_TP_ADM  			ID_UNDD_TP_ADM,
	a122.DS_UNDD_TP_ADM  			DS_UNDD_TP_ADM,
	a18.ID_UNDD_ORGAO_SUP  			ID_UNDD_ORGAO_SUP,
	a123.DS_UNDD_ORGAO_SUP  		DS_UNDD_ORGAO_SUP,
	a16.ID_UNDD_ORGAO  				ID_UNDD_ORGAO,
	a17.DS_UNDD_ORGAO 				DS_UNDD_ORGAO,
	a13.ID_UNDD_RESP_COMPRA  		CD_UNDD_UNIDADE,
	a16.NO_UNDD_UNIDADE  			NO_UNDD_UNIDADE,
--	a13.ID_CMPR_TP_LICITACAO  		ID_CMPR_TP_LICITACAO,
	a116.DS_CMPR_TP_LICITACAO  		DS_CMPR_TP_LICITACAO,
--	a13.ID_CMPR_SIT_ATUAL_COMPRA	ID_CMPR_SIT_ATUAL_COMPRA,
--	a115.DS_CMPR_SIT_ATUAL_COMPRA	DS_CMPR_SIT_ATUAL_COMPRA,
	a12.ID_ITCP_GRUPO_MATERIAL  	ID_ITCP_GRUPO_MATERIAL,
	a120.DS_ITCP_GRUPO_MATERIAL  	DS_ITCP_GRUPO_MATERIAL,
	a12.ID_ITCP_CLASSE_MAT_SERV  	ID_ITCP_CLASSE_MAT_SERV,
	a19.DS_ITCP_CLASSE_MAT_SERV  	DS_ITCP_CLASSE_MAT_SERV0,
	a12.ID_ITCP_PADRAO_DESC_MAT  	ID_ITCP_PADRAO_DESC_MAT,
	a113.DS_ITCP_PADRAO_DESC_MAT  	DS_ITCP_PADRAO_DESC_MAT,
--	a15.ID_DT_MES  					ID_DT_MES,
--	a112.DS_DT_MES  				DS_DT_MES,
	a14.ID_DT_ANO  					ID_DT_ANO,
--	a117.DS_DT_ANO  				DS_DT_ANO,
--	a14.ID_DT_MES  					ID_DT_MES0,
--	a111.DS_DT_MES  				DS_DT_MES0,
--	a11.ID_ITCP_ITEM_COMPRA  		ID_ITCP_ITEM_COMPRA,
--	a110.DS_ITCP_COMPL_ITEM_COMPRA 	DS_ITCP_COMPL_ITEM_COMPRA,
--	a15.ID_DT_ANO  					ID_DT_ANO0,
--	a118.DS_DT_ANO  				DS_DT_ANO0,
	sum(a11.VL_PRECO_TOTAL_HOMOLOG)	VL_PRECO_TOTAL_HOMOLOG
from	Siasg_DW_VBL.F_ITEM_FORNECEDOR	a11
	join	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO	a12
	  on 	(a11.ID_ITCP_TP_COD_MAT_SERV = a12.ID_ITCP_TP_COD_MAT_SERV)
	join	Siasg_DW_VBL.D_CMPR_COMPRA	a13
	  on 	(a11.ID_CMPR_COMPRA = a13.ID_CMPR_COMPRA)
	join	Siasg_DW_VBL.D_DT_DATA	a14
	  on 	(a13.DT_HOMOLOG_PREGAO = a14.ID_DT_DATA)
	join	Siasg_DW_VBL.D_DT_DATA	a15
	  on 	(a13.DT_CMPR_RESULTADO_COMPRA = a15.ID_DT_DATA)
	join	Siasg_DW_VBL.D_UNDD_UNIDADE	a16
	  on 	(a13.ID_UNDD_RESP_COMPRA = a16.ID_UNDD_UNIDADE)
	join	Siasg_DW_VBL.D_UNDD_ORGAO	a17
	  on 	(a16.ID_UNDD_ORGAO = a17.ID_UNDD_ORGAO)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_VINC	a18
	  on 	(a17.ID_UNDD_ORGAO_VINC = a18.ID_UNDD_ORGAO_VINC)
	join	Siasg_DW_VBL.D_ITCP_CLASSE_MAT_SERV	a19
	  on 	(a12.ID_ITCP_CLASSE_MAT_SERV = a19.ID_ITCP_CLASSE_MAT_SERV)
	join	Siasg_DW_VBL.D_ITCP_ITEM_COMPRA	a110
	  on 	(a11.ID_ITCP_ITEM_COMPRA = a110.ID_ITCP_ITEM_COMPRA)
	join	Siasg_DW_VBL.D_DT_MES	a111
	  on 	(a14.ID_DT_MES = a111.ID_DT_MES)
	join	Siasg_DW_VBL.D_DT_MES	a112
	  on 	(a15.ID_DT_MES = a112.ID_DT_MES)
	join	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT	a113
	  on 	(a12.ID_ITCP_PADRAO_DESC_MAT = a113.ID_ITCP_PADRAO_DESC_MAT)
	join	Siasg_DW_VBL.D_UNDD_PODER	a114
	  on 	(a16.ID_UNDD_PODER = a114.ID_UNDD_PODER)
	join	Siasg_DW_VBL.D_CMPR_SIT_ATUAL_COMPRA	a115
	  on 	(a13.ID_CMPR_SIT_ATUAL_COMPRA = a115.ID_CMPR_SIT_ATUAL_COMPRA)
	join	Siasg_DW_VBL.D_CMPR_TP_LICITACAO	a116
	  on 	(a13.ID_CMPR_TP_LICITACAO = a116.ID_CMPR_TP_LICITACAO)
	join	Siasg_DW_VBL.D_DT_ANO	a117
	  on 	(a14.ID_DT_ANO = a117.ID_DT_ANO)
	join	Siasg_DW_VBL.D_DT_ANO	a118
	  on 	(a15.ID_DT_ANO = a118.ID_DT_ANO)
	join	Siasg_DW_VBL.D_UNDD_ESFERA	a119
	  on 	(a16.ID_UNDD_ESFERA = a119.ID_UNDD_ESFERA)
	join	Siasg_DW_VBL.D_ITCP_GRUPO_MATERIAL	a120
	  on 	(a12.ID_ITCP_GRUPO_MATERIAL = a120.ID_ITCP_GRUPO_MATERIAL)
	join	Siasg_DW_VBL.D_UNDD_IN_SISG	a121
	  on 	(a16.ID_UNDD_IN_SISG = a121.ID_UNDD_IN_SISG)
	join	Siasg_DW_VBL.D_UNDD_TP_ADM	a122
	  on 	(a16.ID_UNDD_TP_ADM = a122.ID_UNDD_TP_ADM)
	join	Siasg_DW_VBL.D_UNDD_ORGAO_SUP	a123
	  on 	(a18.ID_UNDD_ORGAO_SUP = a123.ID_UNDD_ORGAO_SUP)
where	
	(
 	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BACON_DEFUMADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BARRA_CEREAL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BATATA_FRITA_EMBALADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CARNE_BOVINA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CHOCOLATE_GRANULADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CHOCOLATE_P_%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%DOCE_EM_TABLETE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%DOCE_FRUTA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%DOCE_MASSA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_AVEIA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_L_CTEA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_MILHO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FLOCOS_DE_CEREAL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRUTA_EM_CALDA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%GEL_IA_FRUTA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%GEL_IA_MOCOT_%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MASSA_LASANHA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MASSA_PASTEL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AB_BORA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ACELGA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ACHOCOLATADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%A__CAR%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ADO_ANTE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%_GUA_COCO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%_GUA_MINERAL_NATURAL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AIPIM_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ALFAFA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ALHO_PORRO_IN___NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AMENDOIM_TORRADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AMIDO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ARROZ_BENEFICIADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AVEIA_BENEFICIADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AZEITONA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BEBIDA_L_CTEA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BEBIDAS_N_O_ALCO_LICAS%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BERTALHA_IN___NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BISCOITO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BOLO_ALIMENT_CIO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%BOMBOM%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CAF_%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CALDA_DOCE_PARA_RECHEIO_/_COBERTURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CANJICA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CARNE_BOVINA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CARNE_DEFUMADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CARNE_PROCESSADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CARNE_SALGADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CARNE_SU_NA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CASCA_ARROZ%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CASTANHA_PARA_ALIMENTACAO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CEBOLA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CEREAL_NATURAL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CH__ALIMENTA__O%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CHANTILLY%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CHEIRO_VERDE_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CHUCHU_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%COALHADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%C_CO_RALADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%COGUMELO_EM_CONSERVA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CONDIMENTO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%COUVE_IN___NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CRAVO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CREME_ARROZ%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CREME_DE_LEITE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%DOCE_CONFEITADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%DOCE_LEITE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%EMBUTIDO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%ERVILHA_EM_CONSERVA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARELO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_ARROZ%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_DE_MANDIOCA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_DE_TRIGO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FARINHA_QUIBE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FEIJ_O%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FERMENTO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRIOS%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRUTA___CONCENTRADO%POLPA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRUTA_CRISTALIZADA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRUTA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRUTA_SECA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%FRUTOS_DO_MAR%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%G_S_REFRIGERANTE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%GEL_IA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%GOMA_DE_MASCAR%CHICLETE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%GR_O_DE_BICO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%IOGURTE_NATURAL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEGUME_EM_CONSERVA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEGUME_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEITE_EM_P_%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEITE_SOJA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MA___IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MACARR_O%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MAIONESE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MANJERIC_O_IN___NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MANTEIGA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MASSA_DE_TOMATE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MEL_ABELHA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MILHO_EM_CONSERVA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MILHO_VERDE_IN___NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MINGAU%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MINGAU_INSTANT�NEO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MISTURA_ALIMENT_CIA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MOLHO_DE_MESA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MOLHO_INGL�S%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MOLHO_PIMENTA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MOLHO_SHOYO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MOLHO_TOMATE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%OVO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%P_O%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%P_O_DE_QUEIJO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%PEIXE_EM_CONSERVA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%PIZZA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%P__PARA_REFRESCO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%QUEIJO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%QUEIJO_RALADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%RAPADURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%REFRIGERANTE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%REQUEIJ_O%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%RICOTA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%SAL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%SALGADOS_DIVERSOS%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%SUCO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%TEMPERO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%TOMATE_IN___NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%UVA_PASSA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%VERDURA_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%VINAGRE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%VINHO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%AZEITE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%CHOCOLATE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%GELATINA_ALIMENT_CIA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEGUME_IN_NATURA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEITE_C_CO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%LEITE_CONDENSADO%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%MILHO_DE_PIPOCA%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%_LEO_VEGETAL_COMEST_VEL%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%P__PUDIM%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%SORVETE%' OR
	UPPER(a113.DS_ITCP_PADRAO_DESC_MAT) LIKE '%VERDURA_IN_NATURA%'
	))
group by	a16.ID_UNDD_TP_ADM,
	a122.DS_UNDD_TP_ADM,
	a16.ID_UNDD_ORGAO,
	a17.DS_UNDD_ORGAO,
	a13.ID_CMPR_TP_LICITACAO,
	a116.DS_CMPR_TP_LICITACAO,
--	a13.ID_CMPR_SIT_ATUAL_COMPRA,
--	a115.DS_CMPR_SIT_ATUAL_COMPRA,
	a12.ID_ITCP_PADRAO_DESC_MAT,
	a113.DS_ITCP_PADRAO_DESC_MAT,
	a12.ID_ITCP_GRUPO_MATERIAL,
	a120.DS_ITCP_GRUPO_MATERIAL,
	a12.ID_ITCP_CLASSE_MAT_SERV,
	a19.DS_ITCP_CLASSE_MAT_SERV,
	a15.ID_DT_MES,
	a112.DS_DT_MES,
	a14.ID_DT_ANO,
	a117.DS_DT_ANO,
	a14.ID_DT_MES,
	a111.DS_DT_MES,
--	a11.ID_ITCP_ITEM_COMPRA,
--	a110.DS_ITCP_COMPL_ITEM_COMPRA,
	a18.ID_UNDD_ORGAO_SUP,
	a123.DS_UNDD_ORGAO_SUP,
	a13.ID_UNDD_RESP_COMPRA,
	a16.NO_UNDD_UNIDADE,
	a16.ID_UNDD_PODER,
	a114.DS_UNDD_PODER,
	a16.ID_UNDD_IN_SISG,
	a121.DS_UNDD_IN_SISG,
	a16.ID_UNDD_ESFERA,
	a119.DS_UNDD_ESFERA,
	a15.ID_DT_ANO,
	a118.DS_DT_ANO