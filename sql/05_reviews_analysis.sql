-- mean rating / средняя оценка 
SELECT
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM reviews;
-- ratings distribution / распределение оценок 
SELECT
	REVIEW_SCORE,
	COUNT(*) AS REVIEWS,
	ROUND((COUNT(*) * 100 / SUM(COUNT(*)) OVER ()), 1) as share
FROM
	REVIEWS
GROUP BY
	REVIEW_SCORE;
-- avg rating by category / средний рейтинг по категориям
SELECT
	PRODUCT_CATEGORY_NAME_ENGLISH AS CATEGORY,
	AVG(REVIEW_SCORE) AVG_RATING
FROM
	ORDERS O
	LEFT JOIN REVIEWS R ON O.ORDER_ID = R.ORDER_ID
	JOIN ORDER_ITEMS OI ON O.ORDER_ID = OI.ORDER_ID
	JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID
	JOIN CATEGORY_TRANSLATION T ON P.PRODUCT_CATEGORY_NAME = T.PRODUCT_CATEGORY_NAME
GROUP BY
	T.PRODUCT_CATEGORY_NAME_ENGLISH
HAVING
	COUNT(*) > 50;
-- rating depending on delay / оценка в зависимости от задержки 
WITH delivery AS (
    SELECT
        o.order_id,
        EXTRACT(
            EPOCH FROM (
                o.order_delivered_customer_date
                - o.order_estimated_delivery_date
            )
        ) / 86400 AS delay_days
    FROM orders o
    WHERE o.order_status = 'delivered'
)

SELECT
    CASE
        WHEN delay_days <= 0 THEN 'On time'
        WHEN delay_days <= 3 THEN '1-3 days late'
        WHEN delay_days <= 7 THEN '4-7 days late'
        ELSE '8+ days late'
    END AS delivery_group,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS reviews
FROM delivery d
JOIN reviews r
    ON d.order_id = r.order_id
GROUP BY 1
ORDER BY 1;