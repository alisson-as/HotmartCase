WITH sales_weekday
AS (
    SELECT
         CAST(strftime("%Y", purchase_date) AS INT) AS year
        ,CASE CAST(strftime('%w', purchase_date) AS INTEGER)
            WHEN 0 THEN 'Sunday'
            WHEN 1 THEN 'Monday'
            WHEN 2 THEN 'Tuesday'
            WHEN 3 THEN 'Wednesday'
            WHEN 4 THEN 'Thursday'
            WHEN 5 THEN 'Friday'
            WHEN 6 THEN 'Saturday'
        END AS desc_weekday
        ,COUNT(*) AS currently_sales
        ,LAG(COUNT(*), 1, NULL)
            OVER(
                PARTITION BY CAST(strftime('%w', purchase_date) AS INTEGER)
                ORDER BY CAST(strftime('%w', purchase_date) AS INTEGER)
            ) AS previous_sales

    FROM tb_sales AS A
        LEFT JOIN tb_products AS B
            ON A.product_id = B.product_id
        LEFT JOIN tb_producers AS C
            ON B.producer_id = C.producer_id

    WHERE 1=1
    AND A.refund = 0
    AND A.cancelled = 0
    AND A.chargeback = 0
    AND C.country = 'BRASIL'
    AND CAST(strftime("%Y", purchase_date) AS INT) IN (2020, 2021, 2022)

    GROUP BY 1, 2

    ORDER BY
        CAST(strftime('%w', purchase_date) AS INTEGER)
)

SELECT
     year
    ,desc_weekday
    ,previous_sales
    ,currently_sales
    ,ROUND(
        (
            (CAST(currently_sales AS FLOAT) - previous_sales) / 
            currently_sales
        )*100, 2
    ) AS variation_sales
FROM sales_weekday