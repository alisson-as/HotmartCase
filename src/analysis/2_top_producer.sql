    
WITH top_produ
AS (
    SELECT
         C.producer_id
        ,C.country
        ,CAST(SUM(comission_value) AS INT) AS total_commission
        ,RANK() OVER( ORDER BY SUM(comission_value) DESC) AS rank_commission
    FROM tb_sales AS A
    LEFT JOIN tb_products AS B
        ON A.product_id = B.product_id
    LEFT JOIN tb_producers AS C
        ON B.producer_id = C.producer_id

    WHERE 1=1
    AND strftime('%Y-%m-%d', C.registry_date) >= '2019-01-01'
    AND B.recovery_active = 1

    GROUP BY
         C.producer_id
        ,C.country
)

SELECT
     producer_id
    ,country
    ,total_commission
FROM top_produ

WHERE 1=1
AND rank_commission <= 5

ORDER BY 3 DESC