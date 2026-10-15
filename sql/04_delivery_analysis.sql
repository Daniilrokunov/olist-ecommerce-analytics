-- avg delivery time / среднее время доставки
SELECT
    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    order_delivered_customer_date
                    - order_purchase_timestamp
                )
            ) / 86400
        ),
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;
/*
delivery delay / задержка доставки 
negative value = delivery was on time / отрицательное значение = доставка вовремя
*/
SELECT
    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    order_delivered_customer_date
                    - order_purchase_timestamp
                )
            ) / 86400
        ),
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;
-- delayed orders share / доля задержанных заказов 
WITH delivery AS (
    SELECT
        order_id,
        order_delivered_customer_date
            > order_estimated_delivery_date AS is_late
    FROM orders
    WHERE order_status = 'delivered'
      AND order_delivered_customer_date IS NOT NULL
      AND order_estimated_delivery_date IS NOT NULL
)

SELECT
    COUNT(*) AS orders,
    COUNT(*) FILTER (WHERE is_late) AS late_orders,
    ROUND(
        COUNT(*) FILTER (WHERE is_late) * 100.0
        / COUNT(*),
        2
    ) AS late_rate
FROM delivery;