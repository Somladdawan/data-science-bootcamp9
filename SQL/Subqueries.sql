--Database
chinook.db


-- basic query
SELECT
	firstname,
	lastname,
	email,
  COUNT(*) count_order
FROM customers c
JOIN invoices i ON c.customerid = i.customerid
WHERE c.country = 'USA' AND STRFTIME("%Y-%m",i.invoicedate) = "2009-10"
GROUP BY 1,2,3; --column 1,2,3 firstname , lastname , email

-- with clauses : common table expression
WITH usa_customers AS (
	SELECT * FROM customers
	WHERE country = 'USA'
), invoice_2009 AS (
	SELECT * FROM invoices
	WHERE STRFTIME("%Y-%m",invoicedate) = "2009-10"
)

SELECT firstname, lastname, email, COUNT(*)
FROM usa_customers t1
JOIN invoice_2009  t2
ON t1.customerid = t2.customerid
GROUP BY 1,2,3;

-- standard subquery
SELECT firstname, lastname, email, COUNT(*)
FROM  (
	SELECT * FROM customers
	WHERE country = 'USA'
) AS t1
JOIN (
	SELECT * FROM invoices
	WHERE STRFTIME("%Y-%m",invoicedate) = "2009-10"
) AS t2
ON t1.customerid = t2.customerid
GROUP BY 1,2,3;
