SELECT
    *
FROM tb_sales AS A
LEFT JOIN tb_products AS B
    ON A.product_id = B.product_id
LEFT JOIN tb_producers AS C
    ON B.producer_id = C.producer_id