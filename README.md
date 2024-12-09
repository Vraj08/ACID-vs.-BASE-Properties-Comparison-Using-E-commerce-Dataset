
# **ACID vs. BASE Properties Testing Using E-commerce Dataset**

### **Overview**
This project compares the strengths and weaknesses of **PostgreSQL** (ACID-compliant) and **MongoDB** (BASE-compliant) databases in the context of an e-commerce platform. Using the **Brazilian E-commerce Dataset (Olist)**, the project evaluates the performance, scalability, flexibility, complexity, and functionality of each database by implementing real-world scenarios like order processing, payment tracking, and review sentiment analysis.

This repository contains all the scripts, data, and instructions required to replicate the project and reproduce the results.

---

### **Project Objectives**
1. Compare PostgreSQL and MongoDB based on:
   - **Performance**: Query speed and efficiency.
   - **Scalability**: Ability to handle large datasets.
   - **Flexibility**: Adaptability to changing data structures.
   - **Complexity**: Ease of managing relational or schema-less data.
   - **Functionality**: Ability to perform complex operations.
2. Provide actionable insights for choosing the optimal database based on use cases.
3. Demonstrate advanced database operations such as denormalization, aggregation pipelines, and relational queries.

---

### **Dataset**
The project utilizes the **Brazilian E-commerce Dataset (Olist)**, which consists of interrelated tables representing customer transactions, product details, order items, reviews, payments, and seller information.

#### **Key Tables**
- **Customers**: Customer demographic and location details.
- **Orders**: Purchase timestamps and statuses.
- **Order Items**: Links orders with products and sellers.
- **Products**: Metadata like product dimensions and categories.
- **Sellers**: Seller identifiers and locations.
- **Payments**: Transaction types, values, and installments.
- **Reviews**: Customer feedback with review scores.
- **Geolocation**: Maps ZIP codes to regions.
- **Product Category Translation**: Translates product categories to human-readable labels.

---

### **Repository Structure**

```plaintext
.
├── README.md                  # Project documentation
├── data/                      # Dataset files (CSV)
│   ├── orders_customers.csv
│   ├── order_items_products.csv
│   ├── products_categories.csv
│   ├── orders_payments.csv
│   ├── sellers_geolocation.csv
│   ├── reviews_orders.csv
├── scripts/                   # Scripts for PostgreSQL and MongoDB
│   ├── postgres_import.sql    # PostgreSQL schema and import commands
│   ├── mongodb_import.sh      # MongoDB data import script
│   ├── mongodb_schema.js      # MongoDB schema design and queries
├── presentation/              # Presentation materials
│   ├── final_presentation.pdf
├── report/                    # Final report
│   ├── final_report.pdf
├── results/                   # Query outputs and performance screenshots
│   ├── postgres_query_output.png
│   ├── mongodb_query_output.png
│   ├── comparison_chart.png
```

---

### **Setup Instructions**

#### **1. Clone the Repository**
```bash
git clone https://github.com/Vraj08/ACID-vs.-BASE-Properties-Comparison-Using-E-commerce-Dataset.git
cd ACID-vs.-BASE-Properties-Comparison-Using-E-commerce-Dataset
```

---

### **2. Set Up PostgreSQL**

1. **Install PostgreSQL** (version 13+ recommended).

2. **Run the PostgreSQL Schema Script**:
   - Execute `postgres_import.sql` in **pgAdmin** or the `psql` command-line tool:
     ```bash
     psql -U your_username -d your_database -f scripts/postgres_import.sql
     ```
   - This script creates all necessary tables and sets up the schema for PostgreSQL.

3. **Import Data into PostgreSQL**:
   - Ensure the CSV files are located in the `data/` directory.
   - Modify the file paths in `scripts/postgres_import.sql` to point to the correct CSV file locations.
   - Run the script to import the data:
     ```sql
     COPY customers(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
     FROM '/path/to/orders_customers.csv' DELIMITER ',' CSV HEADER;
     ```

4. **Verify Data**:
   - Query each table to confirm the data has been imported successfully:
     ```sql
     SELECT COUNT(*) FROM customers;
     SELECT COUNT(*) FROM orders;
     ```

---

### **3. Set Up MongoDB**

1. **Install MongoDB** (version 6+ recommended).

2. **Import CSV Data into MongoDB**:
   - Run the provided script `mongodb_import.sh`:
     ```bash
     bash scripts/mongodb_import.sh
     ```
   - This script will import the CSV files into MongoDB as collections.

3. **Run the MongoDB Schema Script**:
   - Execute `mongodb_schema.js` to denormalize the data and create indices:
     ```bash
     mongo scripts/mongodb_schema.js
     ```

4. **Verify Collections**:
   - Use the following MongoDB query to ensure the collections are populated:
     ```javascript
     db.orders_customers.find().limit(5);
     ```

---

### **Implemented Scenarios**

1. **Order Processing**:
   - PostgreSQL: Used `CTEs` and `RANK()` functions to find peak ordering hours.
   - MongoDB: Aggregated order timestamps using `$group` and `$sort`.

2. **Payment Success Rates**:
   - PostgreSQL: Used conditional aggregates to calculate success rates.
   - MongoDB: Leveraged `$cond` for dynamic calculations.

3. **Review Sentiment Analysis**:
   - PostgreSQL: Used `CASE` statements for sentiment classification.
   - MongoDB: Applied `$project` with `$cond` for flexible sentiment tagging.

4. **Profitability Metrics**:
   - PostgreSQL: Calculated regional sales and price elasticity using window functions.
   - MongoDB: Added derived fields like profit margins with `$set`.

---

### **Key Findings**

| **Factor**        | **Winner**    | **Justification**                                                                                                                                                                                                 |
|--------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Performance**   | PostgreSQL    | Handled complex relational queries efficiently, outperforming MongoDB for structured data tasks.                                                                                                                 |
| **Scalability**   | MongoDB       | Sharding allowed MongoDB to scale effectively for distributed datasets, whereas PostgreSQL required additional tools for horizontal scaling.                                                                     |
| **Flexibility**   | MongoDB       | Schema-less design easily handled dynamic fields like reviews, whereas PostgreSQL required strict schema adherence.                                                                                             |
| **Complexity**    | PostgreSQL    | Advanced query capabilities provided robust analytics, especially for relational datasets.                                                                                                                       |
| **Functionality** | PostgreSQL    | ACID compliance ensured strong consistency for critical operations like payments and inventory updates.                                                                                                         |

---

### **Usage Instructions**
- Follow the **setup instructions** to load the data into PostgreSQL and MongoDB.
- Run the provided scripts to execute queries and analyze results.
- Refer to the `presentation/` and `report/` folders for additional project insights.

---

### **Contributors**
- Vraj Patel
- [Add other group members here]

---

### **License**
This project is licensed under the MIT License. See `LICENSE` for more details.
