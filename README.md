# 📊 E-Commerce Sales Analysis (SQL)

## Overview
This project analyzes an e-commerce transactions dataset using SQL.  
The dataset contains sales transactions, product details, customer IDs, and order timestamps.  
The goal is to generate business insights such as top-selling products, revenue trends, customer behavior, and returns.

---

## Dataset Description
The dataset contains the following columns:

| Column Name   | Description |
|---------------|-------------|
| `InvoiceNo`   | Unique transaction/order number |
| `StockCode`   | Product code |
| `Description` | Product name/description |
| `Quantity`    | Number of items purchased (negative values indicate returns) |
| `InvoiceDate` | Date and time of the transaction |
| `UnitPrice`   | Price per unit of the product |
| `CustomerID`  | Unique ID assigned to the customer |
| `Country`     | Country of the customer |

---

## SQL Analysis
The analysis is divided into five sections:

1. **Basic Sales Insights** – Transaction counts, total revenue, customer count, and country-level purchases.  
2. **Product & Stock Analysis** – Top-selling products, highest revenue items, low-frequency sales, and average prices.  
3. **Customer Analysis** – Top customers by spend, purchase diversity, and loyalty.  
4. **Time-Based Analysis** – Monthly trends, busiest times, and weekday/weekend performance.  
5. **Advanced Insights** – Most popular product per country, month-over-month growth, and returns impact.

---

## Key Business Questions Answered
Some of the questions addressed in this analysis include:
- What is the total revenue generated?
- Which products and customers contribute the most to sales?
- What are the peak sales months and busiest hours?
- Which countries generate the most sales?
- How significant are returns/refunds?
- How has revenue changed month over month?

---

## How to Use
1. Import the dataset into your SQL environment (MySQL / PostgreSQL / SQL Server).  
2. Run the SQL script file provided (`ecommerce_analysis.sql`).  
3. View query results for each analysis section.  
4. Modify queries as needed for deeper insights.

---

## Tech Stack
- **Language:** SQL  
- **Database:** MySQL (queries can be adapted for PostgreSQL/SQLite)  
- **Version Control:** Git & GitHub  

---

## Files in Repository
- `ecommerce_analysis.sql` – Contains all SQL queries for analysis.  
- `dataset.csv` – Raw e-commerce transactions data (if allowed to share).  
- `README.md` – Project documentation (this file).

---

## License
This project is released under the MIT License.
