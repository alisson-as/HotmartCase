WITH top_prod
AS (
    SELECT
        A.product_id
        ,B.niche
        ,COUNT(*) AS qtd_vendas
        ,ROW_NUMBER() OVER(PARTITION BY B.niche ORDER BY COUNT(*) DESC) AS top_rank
    FROM tb_sales AS A
    LEFT JOIN tb_products AS B
        ON A.product_id = B.product_id

    WHERE 1=1
    AND A.refund = 0
    AND A.cancelled = 0
    AND A.chargeback = 0
    AND B.member_area_active = 0
    AND B.recovery_active = 1

    GROUP BY
        A.product_id

    ORDER BY 3 DESC

)

SELECT
     product_id
    ,niche
    ,qtd_vendas
FROM top_prod
WHERE top_rank = 1