-- Import Script for PostgreSQL

-- Create Tables
\i EcommerceDatasetScriptPGAdmin.sql

-- Import Data (use COPY command for large datasets)
COPY customers(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM '/path/to/orders_customers.csv' DELIMITER ',' CSV HEADER;

COPY order_items(order_item_id, order_id, product_id, seller_id, shipping_limit_date, price, freight_value)
FROM '/path/to/order_items_products.csv' DELIMITER ',' CSV HEADER;

COPY products(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
FROM '/path/to/products_categories.csv' DELIMITER ',' CSV HEADER;

COPY payments(payment_id, order_id, payment_type, payment_installments, payment_value)
FROM '/path/to/orders_payments.csv' DELIMITER ',' CSV HEADER;

COPY sellers(seller_id, seller_zip_code_prefix, seller_city, seller_state)
FROM '/path/to/sellers_geolocation.csv' DELIMITER ',' CSV HEADER;

COPY reviews(review_id, order_id, review_score)
FROM '/path/to/reviews_orders.csv' DELIMITER ',' CSV HEADER;

-- Verify Data
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM reviews;
