SELECT * FROM ComprasGov_FaseExterna_VBL.item
WHERE quantidade_solicitada != qtde_aceita AND qtde_aceita > 0 AND qtde_adjudicada IS NOT NULL 