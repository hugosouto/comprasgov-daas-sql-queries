-- Count Duplicates
SELECT codigo_item FROM catalogo.item_material GROUP BY codigo_item HAVING COUNT(codigo_item) > 1;

-- Show Duplicates
SELECT *
FROM catalogo.item_material
WHERE codigo_item IN (SELECT codigo_item FROM catalogo.item_material GROUP BY codigo_item HAVING COUNT(codigo_item) > 1) AND item_suspenso = TRUE;