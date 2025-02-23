SELECT

     country
    ,SUM(refund) AS refund
    ,SUM(cancelled) AS cancelled
    ,COUNT(*) AS qtd_vendas
    ,ROUND(
        CAST(COUNT(*) AS FLOAT) / 
        (SUM(refund) + SUM(cancelled)), 2
    ) AS loss_performance

FROM tb_sales AS A
LEFT JOIN tb_products AS B
    ON A.product_id = B.product_id
LEFT JOIN tb_producers AS C
    ON B.producer_id = C.producer_id

WHERE 1=1
AND B.type = 'Assinatura'

GROUP BY
    country

ORDER BY 5 DESC