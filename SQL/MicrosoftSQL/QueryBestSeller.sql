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

#Query top 20 customers in 2014-2017
--- 2014
SELECT TOP 20
	cus.customer_id AS ID,
	cus.customer_name AS CUSTOMER_NAME,
	SUM(ord.sales) AS TOTAL_SALES2014
FROM customer AS cus
JOIN orders AS ord ON cus.customer_id = ord.customer_id
WHERE YEAR(ord.order_date) = 2014
GROUP BY cus.customer_id, cus.customer_name
ORDER BY total_sales2014 DESC;

--- 2015
SELECT TOP 20
	cus.customer_id AS ID,
	cus.customer_name AS CUSTOMER_NAME,
	SUM(ord.sales) AS TOTAL_SALES2015
FROM customer AS cus
JOIN orders AS ord ON cus.customer_id = ord.customer_id
WHERE YEAR(ord.order_date) = 2015
GROUP BY cus.customer_id, cus.customer_name
ORDER BY total_sales2015 DESC;

--- 2016
SELECT TOP 20
	cus.customer_id AS ID,
	cus.customer_name AS CUSTOMER_NAME,
	SUM(ord.sales) AS TOTAL_SALES2016
FROM customer AS cus
JOIN orders AS ord ON cus.customer_id = ord.customer_id
WHERE YEAR(ord.order_date) = 2016
GROUP BY cus.customer_id, cus.customer_name
ORDER BY total_sales2016 DESC;

--- 2017
SELECT TOP 20
	cus.customer_id AS ID,
	cus.customer_name AS CUSTOMER_NAME,
	SUM(ord.sales) AS TOTAL_SALES2017
FROM customer AS cus
JOIN orders AS ord ON cus.customer_id = ord.customer_id
WHERE YEAR(ord.order_date) = 2017
GROUP BY cus.customer_id, cus.customer_name
ORDER BY total_sales2017 DESC;

#Calculate and create new field for control quality of delivery (city)
--1
SELECT 
	FORMAT(ord.order_date, 'dd/MM/yy') AS ORDER_DATE,
	FORMAT(ord.ship_date, 'dd/MM/yy') AS SHIP_DATE,
	DATEDIFF(day, ord.order_date, ord.ship_date) AS TRANSIT_TIME,
	CASE 
		WHEN DATEDIFF(day, ord.order_date, ord.ship_date) < 3 THEN 'First Class'
		WHEN DATEDIFF(day, ord.order_date, ord.ship_date) < 5 THEN 'Second Class'
		ELSE 'Standard Class'
	END AS SHIP_MOTE
FROM customer AS cus
JOIN orders AS ord ON cus.customer_id = ord.customer_id
JOIN products AS pro ON ord.product_id = pro.product_id
GROUP BY ord.ship_date, ord.order_date;
--2
SELECT
	cus.city AS CITY,
	sum(datepart(day, ord.ship_date - ord.order_date)) AS TOTAL_TRANSIT_TIME,
	COUNT(ord.order_date) AS NUMBER_TRANSPORTATION,
	AVG(datepart(day, ord.ship_date - ord.order_date)) AS AVG_TRANSIT_TIME
FROM orders AS ord
JOIN customer AS cus ON cus.customer_id = ord.customer_id
GROUP BY cus.city;

#Query and compare profit in 2014-2017
WITH sumprofit AS (
	SELECT
	pro.sub_category,
	ROUND(SUM(CASE WHEN YEAR(ord.order_date) = 2014 THEN ord.profit ELSE 0 END), 2) AS profit_2014,
	ROUND(SUM(CASE WHEN YEAR(ord.order_date) = 2015 THEN ord.profit ELSE 0 END), 2) AS profit_2015,
	ROUND(SUM(CASE WHEN YEAR(ord.order_date) = 2016 THEN ord.profit ELSE 0 END), 2) AS profit_2016,
	ROUND(SUM(CASE WHEN YEAR(ord.order_date) = 2017 THEN ord.profit ELSE 0 END), 2) AS profit_2017,
	ROUND(SUM(ord.profit), 2) AS TOTAL_PROFIT
	FROM orders AS ord
	JOIN products AS pro ON ord.product_id = pro.product_id 
	GROUP BY pro.sub_category
)
SELECT 
	sub_category,
	profit_2014 AS PROFIT_2014,
	profit_2015 AS PROFIT_2015,
	(profit_2015 - profit_2014) AS DIFF_2015_2014,
	profit_2016 AS PROFIT_2016,
	(profit_2016 - profit_2015) AS DIFF_2016_2015,
	profit_2017 AS PROFIT_2017,
	(profit_2017 - profit_2016) AS DIFF_2017_2016
FROM sumprofit;






