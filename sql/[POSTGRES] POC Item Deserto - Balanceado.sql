CREATE OR REPLACE FUNCTION clean_outliers(in_deserto_status bool)
RETURNS void LANGUAGE plpgsql AS $$
DECLARE
    Q1 numeric;
    Q3 numeric;
    IQR numeric;
    lower_bound numeric;
    upper_bound numeric;
BEGIN
    SELECT percentile_cont(0.25) WITHIN GROUP (ORDER BY valor_estimado) INTO Q1 FROM analises.poc_item_deserto_final WHERE in_deserto = in_deserto_status;
    SELECT percentile_cont(0.75) WITHIN GROUP (ORDER BY valor_estimado) INTO Q3 FROM analises.poc_item_deserto_final WHERE in_deserto = in_deserto_status;
    IQR := Q3 - Q1;
    lower_bound := Q1 - 1.5 * IQR;
    upper_bound := Q3 + 1.5 * IQR;

    DELETE FROM analises.poc_item_deserto_final WHERE in_deserto = in_deserto_status AND (valor_estimado < lower_bound OR valor_estimado > upper_bound);
END;
$$;

SELECT clean_outliers(false);
SELECT clean_outliers(true);

WITH False_Sample AS (
    SELECT * FROM analises.poc_item_deserto_final WHERE in_deserto = false LIMIT (SELECT COUNT(*) FROM analises.poc_item_deserto_final WHERE in_deserto = true)
),
True_Sample AS (
    SELECT * FROM analises.poc_item_deserto_final WHERE in_deserto = true
)
SELECT * FROM False_Sample
UNION ALL
SELECT * FROM True_Sample;
