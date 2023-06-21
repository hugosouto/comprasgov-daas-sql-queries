select		
	max(a15.NO_ITEM_INFORMACAO)  	NO_ITEM_INFORMACAO,
	max(a13.NO_TP_DOCUMENTO)  		NO_TP_DOCUMENTO,
	a11.ID_ANO_LANC  				ID_ANO,
	a11.ID_TP_ENTIDADE_FAVO_DOC  	ID_TP_ENTIDADE,
	a11.ID_ENTIDADE_FAVO_DOC  		ID_ENTIDADE,
	max(a14.NO_ENTIDADE)  			NO_ENTIDADE,
	sum(a11.VA_MOVIMENTO_LIQUIDO)  	MOVIMLQUIDOMOEDAORIGEMCONTACO
from
			DWTG_Colunar_VBL.WF_LANCAMENTO	a11
	join	DWTG_Colunar_VBL.WD_ITEM_DECODIFICADO_CCON	a12
	  on 	(a11.ID_ANO_LANC = a12.ID_ANO_ITEM_CONTA and 
			a11.ID_CONTA_CONTABIL_LANC = a12.ID_CONTA_CONTABIL)
	join	DWTG_Colunar_VBL.WD_TP_DOCUMENTO	a13
	  on 	(a11.ID_TP_DOCUMENTO = a13.ID_TP_DOCUMENTO)
	join	DWTG_Colunar_VBL.WD_ENTIDADE	a14
	  on 	(a11.ID_ENTIDADE_FAVO_DOC = a14.ID_ENTIDADE and 
			a11.ID_TP_ENTIDADE_FAVO_DOC = a14.ID_TP_ENTIDADE)
	join	DWTG_Colunar_VBL.WD_ITEM_INFORMACAO	a15
	  on 	(a12.ID_ITEM_INFORMACAO = a15.ID_ITEM_INFORMACAO)
where		(a12.ID_ITEM_INFORMACAO in (303)
 	 and 	a11.ID_ANO_LANC in (2020)
	 and 	a11.ID_TP_DOCUMENTO in ('OB'))
group by	a12.ID_ITEM_INFORMACAO,
	a11.ID_ANO_LANC,
	a11.ID_TP_ENTIDADE_FAVO_DOC,
	a11.ID_ENTIDADE_FAVO_DOC,
	a11.ID_TP_DOCUMENTO