SELECT TOP 1
	MONTH(order_date) AS MONTH,
	YEAR(order_date) AS YEAR,
	sales AS SALES
FROM orders
ORDER BY sales DESC;
