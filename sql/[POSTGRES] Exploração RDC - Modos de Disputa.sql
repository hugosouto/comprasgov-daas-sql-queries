SELECT 
	 sn.*
	,sg.it_va_estimado valorhomologado
FROM analises.rdc_itens_siasgnet sn
JOIN analises.rdc_itens_siasg sg ON sn.coditem = sg.coditem
;

SELECT
	 sn.mododisputa
	,ROUND(SUM(sg.it_va_estimado) / SUM(sg.it_va_referencia_item) * 100, 2) percentual_diferenca_homologacao
FROM analises.rdc_itens_siasgnet sn
JOIN analises.rdc_itens_siasg_2 sg ON sn.coditem = sg.coditem
GROUP BY sn.mododisputa
ORDER BY 2 DESC
;