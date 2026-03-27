# 🛒 Zepto Sales SQL Data Analysis Project

## Project Overview

## Project Title: Zepto Sales
## Database: Zepto_sales

## Tools Used
- SQL (POSTGRESQL)
- GitHub

## PROJECT OBJECTIVES

- Set up a messy, real-world e-commerce inventory **database**

- Perform **Exploratory Data Analysis (EDA)** to explore product categories, availability, and pricing inconsistencies

- Implement **Data Cleaning** to handle null values, remove invalid entries, and convert pricing from paise to rupees

- Write **business-driven SQL queries** to derive insights around **pricing, inventory, stock availability, revenue** and more

## PROJECT STRUCTURE

Zepto-SQL-Data-Analysis
│
├── dataset
│   └── zepto_data.csv
│
├── business_problems
│   └── zepto_business_problems.sql
│
├── README.md

**ABOUT THE SCHEMA**
🧾 Columns:
- **sku_id:** Unique identifier for each product entry (PRIMARY KEY)

- **name:** Product name as it appears on the app

- **category:** Product category like Fruits, Snacks, Beverages, etc.

- **mrp:** Maximum Retail Price (originally in paise, converted to ₹)

- **discountPercent:** Discount applied on MRP

- **discountedSellingPrice:** Final price after discount (also converted to ₹)

- **availableQuantity:** Units available in inventory

- **weightInGms:** Product weight in grams

- **outOfStock:** Boolean flag indicating stock availability

- **quantity:** Number of units per package (mixed with grams for loose produce)

## Project Workflow

### 1. Database & Table Creation

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```

### 2. Data Exploration
- Counted the total number of records in the dataset

- Viewed a sample of the dataset to understand structure and content

- Checked for null values across all columns

- Identified distinct product categories available in the dataset

- Compared in-stock vs out-of-stock product counts

- Detected products present multiple times, representing different SKUs

### 3.  Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero

- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
  
### 4. Key Insights
- Found top 10 best-value products based on discount percentage

- Identified high-MRP products that are currently out of stock

- Estimated potential revenue for each product category

- Filtered expensive products (MRP > ₹500) with minimal discount

- Ranked top 5 categories offering highest average discounts

- Calculated price per gram to identify value-for-money products

- Grouped products based on weight into Low, Medium, and Bulk categories

- Measured total inventory weight per product category

### Reports
- Database Schema: Detailed table structures and relationships.
- Data Analysis: Insights into product categories, product sales and revenue.
- Summary Reports: Aggregated data on high-demand products and revenue generated.

### CONCLUSION
This project analyzes Zepto sales data using SQL to uncover key insights about product performance, customer demand, and revenue trends. The analysis demonstrates how SQL can be used to transform raw data into meaningful information that supports better business decisions.


     
     

