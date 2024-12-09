
-- Order Processing Analysis
WITH HourlyOrders AS (
    SELECT
        EXTRACT(HOUR FROM order_purchase_timestamp) AS order_hour,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY order_hour
),
RankedOrders AS (
    SELECT
        order_hour,
        order_count,
        RANK() OVER (ORDER BY order_count DESC) AS rank
    FROM HourlyOrders
)
SELECT
    order_hour,
    order_count
FROM RankedOrders
WHERE rank = 1;

-- Payment Success Rates
SELECT 
    ROUND((COUNT(*) FILTER (WHERE order_status = 'delivered')::DECIMAL / COUNT(*) * 100), 2) AS payment_success_rate
FROM orders;

-- Review Sentiment Analysis
SELECT 
    r.review_id,
    r.order_id,
    r.review_score,
    CASE 
        WHEN r.review_score = 3 THEN 'Neutral'
        WHEN r.review_score > 3 THEN 'Positive'
        ELSE 'Negative'
    END AS sentiment
FROM reviews r;

-- Profitability Metrics
WITH RegionalSales AS (
    SELECT
        g.geolocation_state AS region,
        p.product_category_name,
        COUNT(oi.order_item_id) AS total_items_sold,
        SUM(oi.price) AS total_sales_value,
        AVG(oi.price) AS average_price
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN geolocation g ON o.customer_id = g.geolocation_zip_code_prefix
    GROUP BY g.geolocation_state, p.product_category_name
)
SELECT
    region,
    product_category_name,
    total_sales_value,
    total_items_sold,
    average_price
FROM RegionalSales
ORDER BY total_sales_value DESC;
