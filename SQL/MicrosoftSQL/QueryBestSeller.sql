#Query one of the best seller
SELECT TOP 1
	MONTH(order_date) AS MONTH,
	YEAR(order_date) AS YEAR,
	sales AS SALES
FROM orders
ORDER BY sales DESC;

#Query best seller top 5 by sub_category and also show product detail on each sub_category
SELECT TOP 5
	pro.sub_category AS PRODUCT_TYPE,
	SUM(ord.sales) AS TOTAL_SALES
FROM products AS pro
JOIN orders AS ord ON pro.product_id = ord.product_id
GROUP BY pro.sub_category
ORDER BY TOTAL_SALES DESC;

SELECT
    pro.sub_category AS PRODUCT_TYPE,
    pro.product_name AS PRODUCT_DESCRIPTION,
    SUM(ord.sales) AS TOTAL_SALES
FROM products AS pro
JOIN orders AS ord ON pro.product_id = ord.product_id
WHERE 
    pro.sub_category IN (
        SELECT TOP 5
            pro.sub_category
        FROM products AS pro
        JOIN orders AS ord ON pro.product_id = ord.product_id
        GROUP BY pro.sub_category
        ORDER BY SUM(ord.sales) DESC
    )
GROUP BY pro.sub_category, pro.product_name
ORDER BY pro.sub_category;
