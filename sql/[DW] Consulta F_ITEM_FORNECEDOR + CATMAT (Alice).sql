SELECT
	ic.*, 
	fif.*,
	f.NO_FRND_FORNECEDOR,
	ms.ID_ITCP_MATERIAL_SERVICO,
	ms.DS_ITCP_MATERIAL_SERVICO
FROM Siasg_DW_VBL.D_ITCP_ITEM_COMPRA ic -- Dados do cadastro dos itens de compra
	 JOIN Siasg_DW_VBL.D_CMPR_COMPRA c ON c.DS_CMPR_COMPRA = SUBSTRING(ic.CH_ITCP_ITEM_COMPRA, 1, 17) -- Dados gerais das compras
	 JOIN Siasg_DW_VBL.F_ITEM_COMPRA fic ON fic.ID_ITCP_ITEM_COMPRA = ic.ID_ITCP_ITEM_COMPRA -- Dados dos itens relacionados à disputa e a SRP
	 JOIN Siasg_DW_VBL.F_ITEM_FORNECEDOR fif ON fif.ID_ITCP_ITEM_COMPRA = ic.ID_ITCP_ITEM_COMPRA -- Dados relacionados ao resultado do item 
	 JOIN Siasg_DW_VBL.D_ITCP_MATERIAL_SERVICO ms ON fif.ID_ITCP_TP_COD_MAT_SERV = ms.ID_ITCP_TP_COD_MAT_SERV -- Dados relacionados ao CATMAT/CATSER
	 JOIN Siasg_DW_VBL.D_FRND_FORNECEDOR f ON f.ID_FRND_FORNECEDOR = fif.ID_FRND_FORNECEDOR_COMPRA -- Dados detalhados do fornecedor
;
	 

