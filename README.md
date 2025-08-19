# 📊 SQL Project – Data-Driven Decision Making  

This project demonstrates how SQL can be applied to transform raw data into actionable insights for **sales, customers, products, and profitability**.  
Using a star-schema database with fact and dimension tables, I performed end-to-end data analysis to support business decision-making.  

---

## 📂 Dataset & Tables  

### Dimension Tables  
- **dim_customer** → Customer information (region, market, channel).  
- **dim_product** → Product details (division, category, subcategory, manufacturing info).  

### Fact Tables  
- **fact_sales_monthly** → Monthly sales transactions.  
- **fact_gross_price** → Gross price of each product.  
- **fact_manufacturing_cost** → Cost of manufacturing each product.  
- **fact_pre_invoice_deductions** → Discounts and deductions applied before invoicing.  

---

## 📌 Project Objectives  
- Clean and transform raw transactional data for analysis.  
- Analyze **sales performance across channels and years**.  
- Track **customer growth and retention**.  
- Identify **high-performing and profitable products**.  
- Apply **advanced SQL techniques** like CTEs, Window Functions, and Subqueries.  

---

## 📂 Analysis Performed  

### 1. Data Cleaning & Preparation  
- Removed duplicates and standardized date formats.  
- Handled missing values in product and customer data.  

### 2. Sales Performance  
- Calculated total sales across years.  
- Identified **channel-wise contribution** to revenue.  
- Highlighted the **most profitable sales channels**.  

### 3. Customer Insights  
- Measured unique customer growth YoY (2020 → 2021).  
- Identified high-value customers.  
- Segmented customers based on spend levels.  

### 4. Product Analysis  
- Ranked products within regions by sales contribution.  
- Tracked increase in unique products sold YoY.  
- Found top-selling products driving majority of revenue.  

### 5. Profitability Analysis  
- Calculated **Gross Sales, Net Sales, and Profit** by combining sales, cost, and deduction tables.  
- Identified the **most profitable products and divisions**.  

### 6. Advanced SQL Features  
- Implemented **CTEs** for structured analysis.  
- Used **Window Functions** (`ROW_NUMBER`, `RANK`, `DENSE_RANK`) for ranking.  
- Applied **CASE WHEN** for customer segmentation.  
- Designed **subqueries** to find above-average sales.  

---

## 📊 Key Business Insights  
- The **Online channel** generated the highest gross sales in FY2021.  
- Unique products sold increased by **~18% in 2021 vs 2020**.  
- The customer base grew by **~12% YoY**.  
- The **top 5 products contributed ~30% of total revenue**.  
- The **Consumer Goods division** was the most profitable.  

---

## 🛠️ Skills Demonstrated  
- SQL Data Cleaning & Transformation  
- Joins across multiple fact and dimension tables  
- Aggregations & Grouping  
- Common Table Expressions (CTEs)  
- Window Functions (Ranking, Running Totals, Percentages)  
- Subqueries & Conditional Logic  
- Business Performance Analysis 
