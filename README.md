# Zepto-SQL-Data-Analysis
SQL-based exploration and cleaning of Zepto's product dataset including inventory, pricing, and category-level insights.
# 🛒 Zepto SQL Data Exploration and Cleaning

This project performs SQL-based data exploration, cleaning, and analysis on product listings from **Zepto**, a fast-commerce platform. The dataset includes product attributes like price, discount, weight, and stock status, allowing for insightful queries around inventory, pricing, and product categorization.

---

## 📁 Contents

- `zepto_sql_file.sql`: Contains all SQL commands used for:
  - Table creation
  - Data exploration
  - Data cleaning
  - Revenue estimation
  - Product analysis

---

## 📌 Key Features

### ✅ Data Cleaning
- Removes records with invalid prices (e.g., MRP = 0)
- Converts values from paise to rupees

### 🔍 Data Exploration
- Total rows and null checks
- Identifies unique product categories
- Finds duplicate product names
- Checks in-stock vs out-of-stock distributions

### 📊 Analytical Queries
- Top 10 products by discount percentage
- High-MRP but out-of-stock items
- Estimated revenue by category
- Price-per-gram analysis for value assessment
- Inventory weight per category
- Product weight categorization (low, medium, bulk)

---

## 🛠️ Technologies Used

- **PostgreSQL** / SQL
- Compatible with tools like:
  - pgAdmin
  - DBeaver
  - Azure Data Studio

---

## 🚀 How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/zepto-sql-data-exploration.git
