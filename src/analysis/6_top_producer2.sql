SELECT
     C.producer_id
    ,C.country
    ,ROUND(CAST(SUM(B.member_area_active) AS FLOAT)/ COUNT(*), 4)*100 AS member_active_rate
    ,ROUND(AVG(A.product_price), 2) AS avg_order_value
    ,ROUND((SUM(A.product_price*A.discount))/ SUM(A.product_price), 4)*100 AS discount_rate
    ,CAST((julianday(DATE(CURRENT_DATE, 'localtime')) - julianday(MAX(A.purchase_date))) AS INT) AS recency
    ,ROUND(CAST((SUM(A.refund) + SUM(A.cancelled)) AS FLOAT)/ COUNT(*), 4)*100 AS not_completed_sales_rate
    ,COUNT(*) AS frequency
    ,ROUND(SUM(A.product_price), 0) AS revenue_expected
FROM tb_sales AS A
LEFT JOIN tb_products AS B
    ON A.product_id = B.product_id
LEFT JOIN tb_producers AS C
    ON B.producer_id = C.producer_id

WHERE 1=1
AND CAST(strftime('%Y', A.purchase_date) AS DATE) >= 2019

GROUP BY
     C.producer_id
    ,C.country

ORDER BY 9 DESC