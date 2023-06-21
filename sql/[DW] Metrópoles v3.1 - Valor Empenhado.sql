SELECT	
--	a111.DS_ITCP_PADRAO_DESC_MAT
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
		a111.DS_ITCP_PADRAO_DESC_MAT, '"', ''),
		'*', ''),
		'DE PIPOCA', 'PIPOCA'), ' - ', ' '),
		'PORCO', 'SU�NA'),
		'FARINHA TRIGO', 'FARINHA DE TRIGO'),
		'FARINHA MILHO', 'FARINHA DE MILHO'),
		'FARINHA AVEIA', 'FARINHA DE AVEIA'),
		'FARINHA MANDIOCA', 'FARINHA DE MANDIOCA'),
		'LEITE P�', 'LEITE EM P�'),
		'�GUA MINERAL NATURAL','�GUA MINERAL'),
		'�GUA MINERAL', '�GUA MINERAL NATURAL'),
		'IOGURTE NATURAL', 'IOGURTE'),
		'IOGURTE', 'IOGURTE NATURAL'),
		'PEIXE CONSERVA', 'PEIXE EM CONSERVA')	ITEM_PDM,
--	a17.DS_UNDD_ESFERA  						ESFERA,
--	a112.DS_UNDD_PODER  						DS_UNDD_PODER,
--	a113.DS_UNDD_TP_ADM  						DS_UNDD_TP_ADM,
--	a110.DS_UNDD_ORGAO_SUP  					DS_UNDD_ORGAO_SUP,
----	a19.DS_UNDD_IN_SISG 						DS_UNDD_IN_SISG,
----	a18.DS_EMPN_ESPECIE_EMPENHO					DS_EMPN_ESPECIE_EMPENHO,
----	a12.ID_DT_ANO  								ID_DT_ANO,
----	sum(a11.VL_ITEP_EMPENHADO)					VALOR_TOTAL_EMPENHADO,
	SUM(CASE WHEN a12.ID_DT_ANO = '2010' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2010,
	SUM(CASE WHEN a12.ID_DT_ANO = '2011' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2011,
	SUM(CASE WHEN a12.ID_DT_ANO = '2012' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2012,
	SUM(CASE WHEN a12.ID_DT_ANO = '2013' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2013,
	SUM(CASE WHEN a12.ID_DT_ANO = '2014' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2014,
	SUM(CASE WHEN a12.ID_DT_ANO = '2015' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2015,
	SUM(CASE WHEN a12.ID_DT_ANO = '2016' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2016,
	SUM(CASE WHEN a12.ID_DT_ANO = '2017' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2017,
	SUM(CASE WHEN a12.ID_DT_ANO = '2018' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2018,
	SUM(CASE WHEN a12.ID_DT_ANO = '2019' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2019,
	SUM(CASE WHEN a12.ID_DT_ANO = '2020' THEN a11.VL_ITEP_EMPENHADO END) EMPENHADO2020
FROM	
			Siasg_DW_VBL.F_ITEM_EMPENHO					a11
	JOIN	Siasg_DW_VBL.D_DT_DATA	a12
	  ON 	(a11.DT_EMPN_CONTAB_EMPENHO = a12.ID_DT_DATA)
	JOIN	Siasg_DW_VBL.D_UNDD_UNIDADE					a13
	  ON 	(a11.ID_UNDD_UG_RESP_EMPENHO = a13.ID_UNDD_UNIDADE)
	JOIN	Siasg_DW_VBL.D_EMPN_PLACA_INDICADORES		a14
	  ON 	(a11.ID_EMPN_PLACA_INDICADORES = a14.ID_EMPN_PLACA_INDICADORES)
	JOIN	Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO		a15
	  ON 	(a11.ID_ITCP_TP_COD_MAT_SERV = a15.ID_ITCP_TP_COD_MAT_SERV)
	JOIN	Siasg_DW_VBL.D_DT_ANO						a16
	  ON 	(a12.ID_DT_ANO = a16.ID_DT_ANO)
	JOIN	Siasg_DW_VBL.D_UNDD_ESFERA					a17
	  ON 	(a13.ID_UNDD_ESFERA = a17.ID_UNDD_ESFERA)
	JOIN	Siasg_DW_VBL.D_EMPN_ESPECIE_EMPENHO			a18
	  ON 	(a14.ID_EMPN_ESPECIE_EMPENHO = a18.ID_EMPN_ESPECIE_EMPENHO)
	JOIN	Siasg_DW_VBL.D_UNDD_IN_SISG					a19
	  ON 	(a13.ID_UNDD_IN_SISG = a19.ID_UNDD_IN_SISG)
	JOIN	Siasg_DW_VBL.D_UNDD_ORGAO_SUP				a110
	  ON 	(a13.ID_UNDD_ORGAO_SUP = a110.ID_UNDD_ORGAO_SUP)
	JOIN	Siasg_DW_VBL.D_ITCP_PADRAO_DESC_MAT			a111
	  ON 	(a15.ID_ITCP_PADRAO_DESC_MAT = a111.ID_ITCP_PADRAO_DESC_MAT)
	JOIN	Siasg_DW_VBL.D_UNDD_PODER					a112
	  ON 	(a13.ID_UNDD_PODER = a112.ID_UNDD_PODER)
	JOIN	Siasg_DW_VBL.D_UNDD_TP_ADM					a113
	  ON 	(a13.ID_UNDD_TP_ADM = a113.ID_UNDD_TP_ADM)
WHERE	
	(a12.ID_DT_ANO IN (2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020)
 	AND (
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AB�BORA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ACELGA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ACHOCOLATADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'A��CAR' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ADO�ANTE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '�GUA COCO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '�GUA MINERAL NATURAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '�GUA MINERAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AIPIM IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ALFAFA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ALHO PORRO IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AMENDOIM TORRADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AMIDO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AMIDO*' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ARROZ' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AVEIA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AZEITE OLIVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'AZEITONA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BACON DEFUMADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BARRA CEREAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BATATA FRITA EMBALADA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BEBIDA L�CTEA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BEBIDAS N�O ALCO�LICAS' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BERTALHA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BISCOITO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BOLO ALIMENT�CIO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'BOMBOM' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CAF�' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CALDA DOCE PARA RECHEIO / COBERTURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CANJICA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE BOVINA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE BOVINA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE DE AVE IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE DEFUMADA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE PORCO IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE PROCESSADA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE SALGADA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CARNE SU�NA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CASTANHA PARA ALIMENTACAO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CEBOLA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CEREAL NATURAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CH� ALIMENTA��O' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CHANTILLY' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CHEIRO VERDE IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CHOCOLATE GRANULADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CHOCOLATE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CHOCOLATE P�' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CHUCHU IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'COALHADA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'C�CO RALADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'COGUMELO EM CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CONDIMENTO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CONDIMENTO*' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'COUVE IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CRAVO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'CREME DE LEITE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'DOCE CONFEITADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'DOCE EM TABLETE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'DOCE FRUTA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'DOCE LEITE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'DOCE MASSA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'EMBUTIDO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'ERVILHA EM CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARELO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA AVEIA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA DE MILHO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA DE TRIGO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA L�CTEA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA MILHO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA QUIBE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA%MANDIOCA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FARINHA%TRIGO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FEIJ�O' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FERMENTO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FLOCOS DE CEREAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRIOS' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRUTA - CONCENTRADO / POLPA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRUTA CRISTALIZADA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRUTA EM CALDA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRUTA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRUTA SECA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FRUTOS DO MAR' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'FUB�' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'G�S REFRIGERANTE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'GELATINA ALIMENT�CIA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'GEL�IA FRUTA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'GEL�IA MOCOT�' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'GOMA DE MASCAR ( CHICLETE )' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'GR�O DE BICO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'IOGURTE NATURAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'IOGURTE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEGUME EM CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEGUME IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEGUME IN%NATURA*' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEITE C�CO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEITE CONDENSADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEITE EM P�' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEITE P�' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'LEITE SOJA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MA�� IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MACARR�O' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MAIONESE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MANJERIC�O IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MANTEIGA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MARGARINA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MASSA DE TOMATE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MASSA LASANHA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MASSA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MASSA PASTEL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MASSA TOMATE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MEL ABELHA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MILHO EM CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MILHO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MILHO VERDE IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MILHO%PIPOCA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MINGAU INSTANT�NEO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MISTURA ALIMENT�CIA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MISTURA SUPLEMENTA��O ALIMENTAR' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MOLHO ALIMENT�CIO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MOLHO DE MESA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MOLHO INGL�S' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MOLHO PIMENTA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MOLHO SHOYO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'MOLHO TOMATE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '�LEO VEGETAL COMEST�VEL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'OVO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'P�O DE QUEIJO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'P�O' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'PEIXE CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'PEIXE EM CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'PEIXE IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'PICLES EM CONSERVA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'PIZZA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'P� PARA REFRESCO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'P� PUDIM' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'QUEIJO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'QUEIJO RALADO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'RAPADURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'REFRIGERANTE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'REQUEIJ�O' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'RICOTA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'SAGU' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'SAL' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'SALGADOS DIVERSOS' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'SORVETE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'SUCO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'TEMPERO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'TOMATE IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'UVA PASSA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'VERDURA IN%NATURA' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'VERDURA IN%NATURA*' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'VINAGRE' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE 'VINHO' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AB�BORA IN-NATURA"' OR ------------------------------------------------- In�cio da repeti��o dos termos com aspas duplas
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ACELGA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ACHOCOLATADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"A��CAR"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ADO�ANTE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"�GUA COCO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"�GUA MINERAL NATURAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"�GUA MINERAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AIPIM IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ALFAFA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ALHO PORRO IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AMENDOIM TORRADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AMIDO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AMIDO*"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ARROZ"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AVEIA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AZEITE OLIVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"AZEITONA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BACON DEFUMADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BARRA CEREAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BATATA FRITA EMBALADA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BEBIDA L�CTEA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BEBIDAS N�O ALCO�LICAS"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BERTALHA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BISCOITO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BOLO ALIMENT�CIO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"BOMBOM"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CAF�"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CALDA DOCE PARA RECHEIO / COBERTURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CANJICA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE BOVINA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE BOVINA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE DE AVE IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE DEFUMADA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE PORCO IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE PROCESSADA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE SALGADA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CARNE SU�NA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CASTANHA PARA ALIMENTACAO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CEBOLA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CEREAL NATURAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CH� ALIMENTA��O"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CHANTILLY"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CHEIRO VERDE IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CHOCOLATE GRANULADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CHOCOLATE P�"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CHOCOLATE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CHUCHU IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"COALHADA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"C�CO RALADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"COGUMELO EM CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CONDIMENTO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CONDIMENTO*"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"COUVE IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CRAVO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"CREME DE LEITE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"DOCE CONFEITADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"DOCE EM TABLETE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"DOCE FRUTA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"DOCE LEITE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"DOCE MASSA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"EMBUTIDO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"ERVILHA EM CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARELO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA AVEIA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA DE MILHO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA DE TRIGO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA L�CTEA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA MILHO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA QUIBE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA TRIGO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FARINHA%MANDIOCA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FEIJ�O"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FERMENTO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FLOCOS DE CEREAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRIOS"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRUTA - CONCENTRADO / POLPA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRUTA CRISTALIZADA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRUTA EM CALDA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRUTA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRUTA SECA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FRUTOS DO MAR"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"FUB�"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"G�S REFRIGERANTE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"GELATINA ALIMENT�CIA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"GEL�IA FRUTA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"GEL�IA MOCOT�"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"GOMA DE MASCAR ( CHICLETE )"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"GR�O DE BICO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"IOGURTE NATURAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"IOGURTE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEGUME EM CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEGUME IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEGUME IN%NATURA*"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEITE C�CO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEITE CONDENSADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEITE EM P�"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEITE P�"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"LEITE SOJA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MA�� IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MACARR�O"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MAIONESE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MANJERIC�O IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MANTEIGA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MARGARINA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MASSA DE TOMATE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MASSA LASANHA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MASSA PASTEL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MASSA TOMATE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MASSA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MEL ABELHA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MILHO EM CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MILHO VERDE IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MILHO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MILHO%PIPOCA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MINGAU INSTANT�NEO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MISTURA ALIMENT�CIA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MISTURA SUPLEMENTA��O ALIMENTAR"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MOLHO ALIMENT�CIO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MOLHO DE MESA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MOLHO INGL�S"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MOLHO PIMENTA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MOLHO SHOYO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"MOLHO TOMATE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"�LEO VEGETAL COMEST�VEL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"OVO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"P�O DE QUEIJO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"P�O"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"PEIXE CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"PEIXE EM CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"PEIXE IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"PICLES EM CONSERVA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"PIZZA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"P� PARA REFRESCO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"P� PUDIM"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"QUEIJO RALADO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"QUEIJO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"RAPADURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"REFRIGERANTE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"REQUEIJ�O"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"RICOTA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"SAGU"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"SAL"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"SALGADOS DIVERSOS"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"SORVETE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"SUCO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"TEMPERO"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"TOMATE IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"UVA PASSA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"VERDURA IN%NATURA"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"VERDURA IN%NATURA*"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"VINAGRE"' OR
		a111.DS_ITCP_PADRAO_DESC_MAT LIKE '"VINHO"'
	))
GROUP BY
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a111.DS_ITCP_PADRAO_DESC_MAT, '"', ''), '*', ''), 'DE PIPOCA', 'PIPOCA'), ' - ', ' '), 'PORCO', 'SU�NA'), 'FARINHA TRIGO', 'FARINHA DE TRIGO'), 'FARINHA MILHO', 'FARINHA DE MILHO'), 'FARINHA AVEIA', 'FARINHA DE AVEIA'), 'FARINHA MANDIOCA', 'FARINHA DE MANDIOCA'), 'LEITE P�', 'LEITE EM P�'), '�GUA MINERAL NATURAL','�GUA MINERAL'), '�GUA MINERAL', '�GUA MINERAL NATURAL'), 'IOGURTE NATURAL', 'IOGURTE'), 'IOGURTE', 'IOGURTE NATURAL'), 'PEIXE CONSERVA', 'PEIXE EM CONSERVA')
--	a17.DS_UNDD_ESFERA,
--	a112.DS_UNDD_PODER,
--	a113.DS_UNDD_TP_ADM,
--	a110.DS_UNDD_ORGAO_SUP
----	a15.ID_ITCP_PADRAO_DESC_MAT,
----	a111.DS_ITCP_PADRAO_DESC_MAT
----	a13.ID_UNDD_ESFERA,	
----	a13.ID_UNDD_IN_SISG,
----	a19.DS_UNDD_IN_SISG,
----	a13.ID_UNDD_PODER,
----	a13.ID_UNDD_TP_ADM,
----	a13.ID_UNDD_ORGAO_SUP,
----	a14.ID_EMPN_ESPECIE_EMPENHO,
----	a18.DS_EMPN_ESPECIE_EMPENHO,
----	a12.ID_DT_ANO
----	a16.DS_DT_ANO
ORDER BY
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a111.DS_ITCP_PADRAO_DESC_MAT, '"', ''), '*', ''), 'DE PIPOCA', 'PIPOCA'), ' - ', ' '), 'PORCO', 'SU�NA'), 'FARINHA TRIGO', 'FARINHA DE TRIGO'), 'FARINHA MILHO', 'FARINHA DE MILHO'), 'FARINHA AVEIA', 'FARINHA DE AVEIA'), 'FARINHA MANDIOCA', 'FARINHA DE MANDIOCA'), 'LEITE P�', 'LEITE EM P�'), '�GUA MINERAL NATURAL','�GUA MINERAL'), '�GUA MINERAL', '�GUA MINERAL NATURAL'), 'IOGURTE NATURAL', 'IOGURTE'), 'IOGURTE', 'IOGURTE NATURAL'), 'PEIXE CONSERVA', 'PEIXE EM CONSERVA')