-- customers by state / покупатели по штатам 
SELECT
	CUSTOMER_STATE AS STATE,
	COUNT(DISTINCT CUSTOMER_UNIQUE_ID) CNT
FROM
	CUSTOMERS
GROUP BY
	CUSTOMER_STATE
ORDER BY
	CNT DESC;
-- orders per customer / кол-во заказов на клиента 
SELECT
    customer_unique_id,
    COUNT(DISTINCT o.order_id) AS orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY customer_unique_id
ORDER BY orders DESC;
-- top-10 customers by payments / топ-10 клиентов по расходам
SELECT
    c.customer_unique_id,
    ROUND(SUM(oi.price), 2) AS total_spent,
    COUNT(DISTINCT o.order_id) AS orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;
--orders ditribution / распределение заказов
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    CASE
        WHEN orders = 1 THEN '1 order'
        WHEN orders = 2 THEN '2 orders'
        WHEN orders = 3 THEN '3 orders'
        ELSE '4+ orders'
    END AS customer_segment,
    COUNT(*) AS customers
FROM customer_orders
GROUP BY 1
ORDER BY 1;
-- repeat customers / повторные клиенты
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)

SELECT
    COUNT(*) FILTER (WHERE orders > 1) AS repeat_customers,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) FILTER (WHERE orders > 1) * 100.0
        / COUNT(*),
        2
    ) AS repeat_customer_rate
FROM customer_orders;
