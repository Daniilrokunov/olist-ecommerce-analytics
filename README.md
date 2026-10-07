# 🛒 Olist E-commerce Analytics

> End-to-end e-commerce analytics project based on the Brazilian Olist marketplace dataset.

This project demonstrates an end-to-end data analytics workflow — from database design and SQL analysis to exploratory data analysis in Python and interactive dashboards in Power BI.

The project focuses on **sales, customers, products, delivery performance, sellers and customer reviews**.

---

## 🎯 Project Goals

The main objective is to analyze the Olist e-commerce dataset and identify patterns that can support business decision-making.

The project answers questions such as:

* 📈 How do sales and order volumes change over time?
* 🛍️ Which product categories generate the most revenue?
* 👥 How many customers make repeat purchases?
* 🌎 Which Brazilian states generate the most orders?
* 🚚 Which regions have the longest delivery times?
* ⭐ How does delivery performance affect customer satisfaction?
* 🏪 Which sellers demonstrate the best and worst performance?
* 💰 What factors are associated with higher order value?

---

## 🧰 Tech Stack

| Technology                  | Purpose                              |
| --------------------------- | ------------------------------------ |
| 🐍 **Python**               | Data preparation, EDA and analysis   |
| 🐼 **Pandas**               | Data manipulation and transformation |
| 🔢 **NumPy**                | Numerical calculations               |
| 📊 **Matplotlib / Seaborn** | Data visualization                   |
| 🗄️ **PostgreSQL**          | Database and SQL analytics           |
| 🔎 **SQL**                  | Data analysis and business queries   |
| 📈 **Power BI**             | Interactive dashboards               |
| 📐 **DAX**                  | Analytical measures                  |
| 🔧 **Git / GitHub**         | Version control                      |

---

## 🗂️ Project Structure

```text
olist-ecommerce-analytics/
│
├── 📁 data/
│   └── README.md
│
├── 📁 database/
│   ├── 📁 images/
│   │   └── db_schema.png
│   └── 📁 schema/
│       ├── 01_tables_creation.sql
│       ├── 02_constraints.sql
│       └── 03_indexes.sql
│
├── 📁 notebooks/
│   ├── 01_data_preparation.ipynb
│   ├── 02_eda.ipynb
│   └── 03_analysis.ipynb
│
├── 📁 sql/
│   ├── 01_data_quality.sql
│   ├── 02_sales_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_product_analysis.sql
│   ├── 05_delivery_analysis.sql
│   └── 06_reviews_analysis.sql
│
├── 📄 README.md
├── 📄 requirements.txt
└── 📄 .gitignore
```

---

## 🗄️ Database

The project uses **PostgreSQL** as the analytical database.

The database schema was designed to represent the main entities of the Olist marketplace:

* 👤 Customers
* 🛒 Orders
* 📦 Order items
* 💳 Payments
* ⭐ Reviews
* 🏷️ Products
* 🏪 Sellers
* 🌎 Geolocation

### Database Schema

![Database Schema](database/images/db_schema.png)

The database setup scripts include:

* table creation;
* primary and foreign keys;
* constraints;
* indexes for frequently used columns.

---

## 🔎 SQL Analysis

The SQL section contains analytical queries grouped by business domain.

### 📊 Data Quality

`01_data_quality.sql`

* missing values;
* duplicate records;
* uniqueness checks;
* data consistency checks.

### 💰 Sales Analysis

`02_sales_analysis.sql`

* total revenue;
* monthly sales dynamics;
* order volume;
* average order value;
* top categories and products.

### 👥 Customer Analysis

`03_customer_analysis.sql`

* customers by state;
* orders per customer;
* customer spending;
* repeat customers;
* customer segmentation.

### 🏷️ Product Analysis

`04_product_analysis.sql`

* category performance;
* product rankings;
* revenue contribution;
* cumulative revenue share;
* ABC analysis.

### 🚚 Delivery Analysis

`05_delivery_analysis.sql`

* delivery time;
* delivery delays;
* late delivery rate;
* regional delivery performance.

### ⭐ Reviews Analysis

`06_reviews_analysis.sql`

* review score distribution;
* average review score;
* relationship between delivery delays and customer satisfaction.

SQL techniques used in the project include:

`JOIN` · `GROUP BY` · `CASE WHEN` · `CTE` · `DATE_TRUNC` · `LAG` · `ROW_NUMBER` · `RANK` · Window Functions · Subqueries

---

## 🐍 Python Analysis

The Python analysis is divided into several notebooks.

### 1️⃣ Data Preparation

`01_data_preparation.ipynb`

* loading raw datasets;
* data type conversion;
* missing value analysis;
* duplicate detection;
* data validation;
* feature creation;
* preparation of analytical datasets.

### 2️⃣ Exploratory Data Analysis

`02_eda.ipynb`

Exploration of:

* 📈 sales dynamics;
* 🛍️ product categories;
* 👥 customers;
* 🌎 geography;
* 🚚 delivery performance;
* ⭐ customer reviews.

### 3️⃣ Business Analysis

`03_analysis.ipynb`

The final analytical notebook focuses on business questions and includes:

* sales dynamics;
* ABC analysis of product categories;
* repeat customer analysis;
* delivery performance by state;
* delivery delays vs review scores;
* seller performance.

---

## 📊 Power BI Dashboard

The Power BI dashboard provides an interactive overview of the Olist marketplace.

Planned dashboard metrics include:

* 💰 Total Revenue
* 🛒 Total Orders
* 👥 Total Customers
* 🏪 Total Sellers
* 💵 Average Order Value
* ⭐ Average Review Score
* 📈 Revenue dynamics
* 🏷️ Top product categories
* 🌎 Orders by state
* 🚚 Delivery performance
* ⭐ Review distribution

### Dashboard Preview

> 🚧 Dashboard is currently under development.

---

## 💡 Key Insights

> 🚧 This section will be updated after the final analysis.

The final version will contain the main business findings discovered during the analysis, supported by SQL queries, Python visualizations and Power BI dashboards.

---

## 📦 Dataset

The project is based on the **Brazilian E-Commerce Public Dataset by Olist**.

The original CSV files are not stored in this repository because of their size.

See [`data/README.md`](data/README.md) for instructions on downloading and preparing the dataset.

---

## 🚀 Project Status

| Stage                 | Status         |
| --------------------- | -------------- |
| 🗄️ Database schema   | ✅ Completed    |
| 🔎 SQL analysis       | ✅ Completed    |
| 🐍 Data preparation   | ✅ Completed    |
| 📊 EDA                | ✅ Completed    |
| 📈 Business analysis  | ✅ Completed    |
| 📊 Power BI dashboard | 🚧 In progress |
| 📝 Final insights     | 🚧 In progress |

---

## 👨‍💻 Author

**Daniil Rokunov**

Data Analytics / BI enthusiast with an engineering background.

Interested in:

`Data Analytics` · `BI` · `SQL` · `Python` · `Data Engineering` · `Machine Learning`

---

⭐ If you find this project interesting, feel free to explore the notebooks and SQL analysis.
