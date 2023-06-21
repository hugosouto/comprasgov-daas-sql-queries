SELECT DISTINCT nr_ano Ano, COUNT(id_artefato) Contagem
FROM Comprasnet_faseinterna_VBL.artefato
WHERE in_tipo=0 AND in_estado IN (3,5)
GROUP BY nr_ano;

SELECT DISTINCT nr_ano Ano, COUNT(id_artefato) QtdCopiados
FROM Comprasnet_faseinterna_VBL.artefato
WHERE in_tipo=0 AND in_estado IN (3,5) AND qt_copiado > 0
GROUP BY nr_ano;

SELECT DISTINCT
(SELECT DISTINCT nr_ano Ano, COUNT(id_artefato) Contagem
FROM Comprasnet_faseinterna_VBL.artefato
WHERE in_tipo=0 AND in_estado IN (3,5)) Contagem,
(SELECT DISTINCT nr_ano Ano, COUNT(id_artefato) QtdCopiados
FROM Comprasnet_faseinterna_VBL.artefato
WHERE in_tipo=0 AND in_estado IN (3,5) AND qt_copiado > 0) QtdCopiados
FROM Comprasnet_faseinterna_VBL.artefato;
