WITH prod_with_calcelled
AS (
SELECT
         A.product_id
    FROM tb_sales AS A
    LEFT JOIN tb_products AS B
        ON A.product_id = B.product_id
    
    WHERE 1=1
    AND strftime('%Y-%m-%d', B.registry_date) >= '2019-01-01'
    AND B.type = 'Curso'

    GROUP BY
        A.product_id

    HAVING SUM(A.cancelled) > 0
),

comission_received
AS (
    SELECT
         A.product_id
        ,SUM(A.comission_value) AS comission_received

    FROM tb_sales AS A
    LEFT JOIN tb_products AS B
        ON A.product_id = B.product_id
    
    WHERE 1=1
    AND strftime('%Y-%m-%d', B.registry_date) >= '2019-01-01'
    AND B.type = 'Curso'
    AND A.product_id IN (SELECT product_id FROM prod_with_calcelled)
    AND A.refund = 0
    AND A.cancelled = 0
    AND A.chargeback = 0

    GROUP BY
        A.product_id
),

comission_total
AS (
    SELECT
         A.product_id
        ,B.niche
        ,B.recovery_active
        ,SUM(A.comission_value) AS total_comission
    FROM tb_sales AS A
    LEFT JOIN tb_products AS B
        ON A.product_id = B.product_id
    LEFT JOIN tb_producers AS C
        ON B.producer_id = C.producer_id

    WHERE 1=1
    AND strftime('%Y-%m-%d', B.registry_date) >= '2019-01-01'
    AND B.type = 'Curso'
    AND A.product_id IN (SELECT product_id FROM prod_with_calcelled)

    GROUP BY 
         B.product_id
        ,B.niche
)

SELECT
     A.product_id
    ,A.niche
    ,A.recovery_active
    ,SUM(B.comission_received) AS comission_received
    ,SUM(A.total_comission) AS total_comission
    ,ROUND(
        SUM(B.comission_received) / SUM(A.total_comission)*100, 2
    ) AS average_commission_retention
FROM comission_total AS A
LEFT JOIN comission_received AS B
    ON A.product_id = B.product_id

GROUP BY 1, 2, 3

ORDER BY 6 DESC