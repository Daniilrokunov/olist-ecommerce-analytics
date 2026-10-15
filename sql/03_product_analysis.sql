-- sales by categories / продажи по категориям
SELECT
    t.product_category_name_english AS category,
    COUNT(*) AS items_sold
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN category_translation t
    ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY items_sold DESC;
-- revenue by categories / выручка по категориям
SELECT
	T.PRODUCT_CATEGORY_NAME_ENGLISH AS CATEGORY,
	SUM(OI.PRICE) AS REVENUE
FROM
	ORDER_ITEMS OI
	JOIN ORDERS O ON OI.ORDER_ID = O.ORDER_ID
	JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
	LEFT JOIN CATEGORY_TRANSLATION T ON P.PRODUCT_CATEGORY_NAME = T.PRODUCT_CATEGORY_NAME
WHERE
	O.ORDER_STATUS = 'delivered'
GROUP BY
	1
order by REVENUE desc;
-- revenue share by categories / доля выручки по категориям
WITH category_sales AS (
    SELECT
        pct.product_category_name_english AS category,
        SUM(oi.price) AS revenue
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
    LEFT JOIN category_translation pct
        ON p.product_category_name = pct.product_category_name
    WHERE o.order_status = 'delivered'
    GROUP BY 1
)

SELECT
    category,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        revenue * 100.0 / SUM(revenue) OVER (),
        2
    ) AS revenue_share
FROM category_sales
ORDER BY revenue DESC;