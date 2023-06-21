SELECT item.*
FROM Comprasnet_faseinterna_VBL.item_secao item
LEFT JOIN Comprasnet_faseinterna_VBL.secao_artefato sa
ON sa.id_secao_artefato = item.id_secao_artefato
LEFT JOIN Comprasnet_faseinterna_VBL.artefato a
ON a.id_artefato = sa.id_artefato
WHERE a.bo_sigiloso = true
--AND item.bo_sigiloso = false
------AND a.in = false
--AND a.in_tipo IN (0, 6);


SELECT dfd.id_unico AS dfd, contratacao.id_unico AS contratacao, ms.*
FROM Comprasnet_faseinterna_VBL.material_servico ms
LEFT JOIN Comprasnet_faseinterna_VBL.formalizacao_demanda fd ON fd.id_formalizacao_demanda = ms.id_formalizacao_demanda
LEFT JOIN Comprasnet_faseinterna_VBL.artefato dfd ON dfd.id_artefato = fd.id_artefato LEFT JOIN Comprasnet_faseinterna_VBL.projeto_compra pc
ON pc.id_projeto_compra = ms.id_processo_compra LEFT JOIN Comprasnet_faseinterna_VBL.artefato contratacao ON contratacao.id_artefato = pc.id_artefato
WHERE dfd.bo_sigiloso IS FALSE AND contratacao.bo_sigiloso IS FALSE;