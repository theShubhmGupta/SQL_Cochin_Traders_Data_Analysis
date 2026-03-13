
# SQL Business Analysis — Cochin Traders 

A SQL project where I analyzed a retail company's data to answer 10 real business questions using MySQL.

---

## What is this project?

This project uses a sample retail database (orders, customers, products, employees) to practice writing SQL queries — from simple selects to advanced window functions.

The goal was not just to write queries, but to read the output and say **"what does this mean for the business?"**

---

## Database Tables

```
employees        → who works here
customers        → who buys from us
orders           → when they bought
order_details    → what they bought
products         → what we sell
categories       → product groups
suppliers        → who supplies us
shippers         → who delivers orders
territories      → sales regions
```

---

## The 10 Questions

```sql
-- BASIC
Q1.  Which employees are Sales Representatives, and when were they hired?
Q2.  Which products are running low and need to be reordered?
Q3.  Which customers have placed more than 5 orders?

-- INTERMEDIATE
Q4.  Which customers have never placed an order through Margaret Peacock?
Q5.  Which orders have the most products in them? (top 10)
Q6.  What are the top 5 best-selling products by quantity?

-- ADVANCED
Q7.  How many orders were placed each month in 1997?
Q8.  How did revenue change month over month?
Q9.  What percentage of total revenue does each product contribute?
Q10. What is the running total of revenue month by month?
```

---

## SQL Concepts Covered

- `WHERE`, `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`
- `COUNT`, `SUM`, `ROUND`, `CONCAT`
- `DATE_FORMAT`, `YEAR`, `MONTH`, `MONTHNAME`
- Subqueries with `NOT IN`
- CTEs using `WITH`
- Window functions — `LAG()`, `SUM() OVER()`, `ORDER BY` inside `OVER()`

---

## Interesting Findings

- One product (**Côte de Blaye**) alone makes up 11% of all revenue
- **December 1997** had the most orders in any single month — 48 orders
- **16 customers** have never interacted with the top sales rep
- One order (**#11077**) had 25 individual items — way more than any other order
- The business hit 50% of its all-time revenue only by September 1997

---

## How to Run This

**Step 1 — Set up the database**
```sql
CREATE DATABASE cochin_traders_db;
USE cochin_traders_db;
```

**Step 2 — Import the CSV files**

Use MySQL Workbench → Table Data Import Wizard → import each file from the `/data` folder.

**Step 3 — Open the queries**

Open `queries/business-question.sql` in VS Code. Connect to your database using the SQLTools extension and run queries one by one.

---

## Folder Structure


```
SQL_Cochin_Traders-Data-Analysis/
│
├── data/                    
│   ├── employees.csv
│   ├── customers.csv
│   ├── orders.csv
│   ├── orders_details.csv
│   ├── products.csv
│   └── ...
│
├── queries/
│   └── business-question.sql    
│    
├── insights-recommendations/
│   └── business_report.pdf   
│
├── schema 
│   └── schema.png   
│
├── project_overview.md
│      
└── README.md
```

---

## Tools Used

- **MySQL** — database and queries
- **VS Code** — writing and running queries
- **SQLTools** — MySQL connection inside VS Code
- **Git & GitHub** — version control

---

