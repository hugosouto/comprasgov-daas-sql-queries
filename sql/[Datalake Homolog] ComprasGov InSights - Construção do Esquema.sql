CREATE SCHEMA comprasgov_insights;

CREATE TABLE [comprasgov_insights].[temp]
(
    id INT PRIMARY KEY,
    coluna VARCHAR(MAX)
);

INSERT [comprasgov_insights].[temp] VALUES (1, 'Teste');