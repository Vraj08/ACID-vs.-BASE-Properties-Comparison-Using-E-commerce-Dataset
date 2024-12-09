
# **ACID vs. BASE Properties Comparison Using E-commerce Dataset**

### **Overview**
This project evaluates the strengths and weaknesses of **PostgreSQL (ACID-compliant)** and **MongoDB (BASE-compliant)** databases using the **Brazilian E-commerce Dataset (Olist)**. We compared both databases across five critical metrics: **Performance, Scalability, Flexibility, Complexity, and Functionality**, using real-world e-commerce scenarios such as order processing, payment tracking, and review sentiment analysis.

The goal is not to declare one database superior but to provide a nuanced understanding of their trade-offs, focusing on the dataset's characteristics and operational needs.

---

### **Dataset**
The **Brazilian E-commerce Dataset (Olist)** consists of multiple linked tables representing e-commerce operations. It includes:
- **Customers**: Demographic and location data.
- **Orders**: Order details, timestamps, and statuses.
- **Order Items**: Mapping products to orders with pricing and freight values.
- **Products**: Metadata such as dimensions and categories.
- **Sellers**: Seller location and identifiers.
- **Payments**: Transaction types, values, and installments.
- **Reviews**: Customer feedback with review scores.
- **Geolocation**: ZIP codes mapped to city and state.
- **Product Category Translation**: Translates product categories into human-readable labels.

**Dataset Link**: [Brazilian E-commerce Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce?resource=download)

---

### **Repository Structure**

```plaintext
.
├── README.md                  # Documentation
├── LICENSE                    # License file
├── EcommerceDatasetERD.pgerd  # Entity-Relationship Diagram
├── Presentation/              # Final project presentation
│   ├── ACID-vs.-BASE-Properties-Comparison-Using-E-commerce-Dataset.pptx
├── Report/                    # Final project report
│   ├── Report.pdf
├── Scripts/                   # Query and schema scripts
│   ├── postgres_schema.sql    # PostgreSQL schema creation
│   ├── postgres_import.sql    # PostgreSQL data import
│   ├── queries_postgresql.sql # PostgreSQL queries
│   ├── mongodb_schema.js      # MongoDB schema creation
│   ├── mongodb_import.sh      # MongoDB data import
│   ├── queries_mongodb.js     # MongoDB queries
├── Results/                   # Query outputs and analysis
│   ├── Order Processing Postgres.png
│   ├── Order Processing MongoDB.png
│   ├── Payment Success Rates Postgres.png
│   ├── Payment Success Rates MongoDB.png
│   ├── Review Sentiment Analysis Postgres.png
│   ├── Review Sentiment Analysis MongoDB.png
│   ├── Profitability Metrics Postgres.png
│   ├── Profitability Metrics MongoDB.png
├── DatasetFiles/              # Dataset files for SQL and NoSQL
│   ├── SQL/
│   │   ├── customers.csv
│   │   ├── orders.csv
│   │   ├── order_items.csv
│   │   ├── products.csv
│   │   ├── sellers.csv
│   │   ├── payments.csv
│   │   ├── reviews.csv
│   │   ├── geolocation.csv
│   │   ├── product_category_translation.csv
│   ├── NOSQL/
│       ├── orders_customers.csv
│       ├── order_items_products.csv
│       ├── products_categories.csv
│       ├── sellers_geolocation.csv
│       ├── reviews_orders.csv
│       ├── orders_payments.csv
```

---

### **Setup Instructions**

#### **1. Clone the Repository**
```bash
git clone https://github.com/Vraj08/ACID-vs.-BASE-Properties-Comparison-Using-E-commerce-Dataset.git
cd ACID-vs.-BASE-Properties-Comparison-Using-E-commerce-Dataset
```

#### **2. Set Up PostgreSQL**
1. **Install PostgreSQL** (version 13+).
2. **Run the schema creation script**:
   ```bash
   psql -U your_username -d your_database -f Scripts/postgres_schema.sql
   ```
3. **Import the dataset**:
   ```bash
   psql -U your_username -d your_database -f Scripts/postgres_import.sql
   ```

#### **3. Set Up MongoDB**
1. **Install MongoDB** (version 6+).
2. **Run the import script**:
   ```bash
   bash Scripts/mongodb_import.sh
   ```
3. **Set up schema and queries**:
   ```bash
   mongo Scripts/mongodb_schema.js
   mongo Scripts/queries_mongodb.js
   ```

---

### **Implemented Scenarios**
1. **Order Processing Analysis**:
   - PostgreSQL: Identified peak ordering hours using `CTEs` and `RANK()`.
   - MongoDB: Used `$group` and `$sort` for peak order analysis.

2. **Payment Success Rates**:
   - PostgreSQL: Used conditional aggregates for calculating success rates.
   - MongoDB: Leveraged `$cond` for dynamic calculations.

3. **Review Sentiment Analysis**:
   - PostgreSQL: Classified reviews with `CASE` statements.
   - MongoDB: Used `$project` and `$cond` for dynamic review sentiment tagging.

4. **Profitability Metrics**:
   - PostgreSQL: Aggregated sales and calculated price elasticity.
   - MongoDB: Derived profit margins using `$set`.

---

### **Key Findings**

| **Metric**        | **Winner**    | **Justification**                                                                                                               |
|--------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Performance**   | PostgreSQL    | Efficient for structured data and complex joins.                                                                               |
| **Scalability**   | MongoDB       | Horizontal scaling is better suited for distributed systems.                                                                  |
| **Flexibility**   | MongoDB       | Schema-less design easily handles dynamic fields.                                                                             |
| **Complexity**    | PostgreSQL    | Advanced query capabilities (e.g., window functions, subqueries) provide robust tools for relational datasets.                |
| **Functionality** | PostgreSQL    | ACID compliance ensures strong consistency for critical operations like payments and inventory updates.                       |

---

### **Insights**
- **Use PostgreSQL** for transactional systems with structured data and immediate consistency requirements.
- **Use MongoDB** for distributed systems needing high availability and handling semi-structured/unstructured data.

---

### **Contributors**
- **Developers**: Kathan, Vraj, Harsh
- **Documentation**: Devarsh, Devanshi, Divy
- **Research**: Kathan, Harsh, Vraj, Devarsh

---

### **License**
This project is licensed under the MIT License. See the `LICENSE` file for details.

---
