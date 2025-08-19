# 📊 SQL Project – Data-Driven Decision Making  

This project uses **SQL** to analyze sales, customer behavior, and product performance using a star-schema dataset.  
The database consists of **dimension tables** (`dim_customer`, `dim_product`) and **fact tables** (`fact_sales_monthly`, `fact_gross_price`, `fact_manufacturing_cost`, `fact_pre_invoice_deductions`).  

---

## 📌 Project Objectives
- Clean and transform raw transactional data for analysis.  
- Generate insights into **sales trends, product growth, and channel contribution**.  
- Identify **profitable products and regions**.  
- Use **advanced SQL functions** like CTEs, Window Functions, and Subqueries for analytics.  

---

## 🛠️ Tech Stack
- SQL (MS SQL Server / PostgreSQL / MySQL compatible)  
- Dataset: Sales, Customers, Products (sample star schema)  

---

## 📂 Queries Included  

### 🔹 01_data_cleaning.sql
- Handled duplicate sales records using `ROW_NUMBER()`.  
- Standardized `order_date` from `fact_sales_monthly`.  
- Removed invalid or missing product/customer IDs.  

### 🔹 02_sales_performance.sql
- Total gross sales across months & years from `fact_sales_monthly`.  
- Channel-wise contribution of gross sales using:  
  ```sql


🔹 03_channel_analysis.sql
Identified which channel contributed the most sales in FY2021.

Ranked channels by gross sales.

🔹 04_customer_growth.sql
Count of unique customers from dim_customer.

Year-over-year % increase in customers (2020 → 2021).

🔹 05_product_segmentation.sql
Regional product segmentation using dim_product.region.

Ranked products by sales within each region using RANK().

Found unique product growth between 2020 & 2021.

🔹 06_profitability_analysis.sql
Joined fact_sales_monthly, fact_gross_price, fact_manufacturing_cost, and fact_pre_invoice_deductions to calculate:

Net Sales = Gross Price – Discounts

Profit = Net Sales – Manufacturing Cost

Identified most profitable products.

🔹 07_advanced_sql_functions.sql
Used ROW_NUMBER(), RANK(), and DENSE_RANK() to identify top customers and products.

Applied CASE WHEN for categorizing customers based on spend.

Subqueries to extract sales above average.
