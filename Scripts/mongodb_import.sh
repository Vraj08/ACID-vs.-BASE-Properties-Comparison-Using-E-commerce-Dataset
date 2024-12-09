#!/bin/bash

# MongoDB Import Script
# Ensure MongoDB server is running locally
# Usage: bash mongodb_import.sh

# Import orders_customers.csv into MongoDB
mongoimport --db ecommerce --collection orders_customers --type csv --headerline --file ./orders_customers.csv

# Import order_items_products.csv into MongoDB
mongoimport --db ecommerce --collection order_items_products --type csv --headerline --file ./order_items_products.csv

# Import products_categories.csv into MongoDB
mongoimport --db ecommerce --collection products_categories --type csv --headerline --file ./products_categories.csv

# Import orders_payments.csv into MongoDB
mongoimport --db ecommerce --collection orders_payments --type csv --headerline --file ./orders_payments.csv

# Import sellers_geolocation.csv into MongoDB
mongoimport --db ecommerce --collection sellers_geolocation --type csv --headerline --file ./sellers_geolocation.csv

# Import reviews_orders.csv into MongoDB
mongoimport --db ecommerce --collection reviews_orders --type csv --headerline --file ./reviews_orders.csv

echo "All collections imported successfully into MongoDB."
