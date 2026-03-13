# 🗃️ Cochin Traders SQL Analysis — Business Intelligence with MySQL

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Queries](https://img.shields.io/badge/Queries-10-orange)
![Dataset](https://img.shields.io/badge/Dataset-Cochin_Traders-blueviolet)

A structured SQL analysis project built on the classic **Cochin_Traders** using MySQL. The project answers 10 real business questions across sales, inventory, customer behavior, and revenue — covering everything from basic filtering to advanced window functions.

---

## 📌 Project Objective

To analyze the Cochin_Traders retail dataset and extract actionable business insights using SQL — covering employee performance, product demand, customer segmentation, and monthly revenue trends.

---

## 🗂️ Dataset Overview

The Cochin_Traders database is a sample dataset representing a trading company's operations. It includes 11 tables:
```
| Table | Description |
|---|---|
| `employees` | Sales staff and their details |
| `customers` | Company clients and contact info |
| `orders` | All customer orders placed |
| `order_details` | Line items for each order |
| `products` | Product catalog with stock levels |
| `categories` | Product category groupings |
| `suppliers` | Vendor information |
| `shippers` | Shipping company records |
| `territories` | Regional sales territories |
| `employee_territories` | Employee–territory mapping |
| `regions` | Geographic region definitions |

> **Date Range:** July 1996 – May 1998  
> **Total Revenue:** $1,265,793  
> **Total Orders:** 830+
```
---

## 🧠 Business Questions Solved

The 10 questions are grouped by complexity:

```
### 🟢 Basic
| # | Question | Key Table(s) |
|---|---|---|
| Q1 | Full name & hiring date of all Sales Representatives | `employees` |
| Q2 | Products that need to be reordered | `products` |
| Q3 | Customers who placed more than 5 orders | `customers`, `orders` |

### 🔵 Intermediate
| # | Question | Key Table(s) |
|---|---|---|
| Q4 | Customers who never ordered via Margaret Peacock (EmpID 4) | `customers`, `orders` |
| Q5 | Top 10 orders with the most line items | `order_details` |
| Q6 | Top 5 best-selling products by quantity | `order_details`, `products` |

### 🟣 Advanced
| # | Question | Key Table(s) |
|---|---|---|
| Q7 | Monthly order count for 1997 | `orders` |
| Q8 | Month-over-month revenue difference | `orders`, `order_details` |
| Q9 | Each product's % of total sales revenue | `order_details`, `products` |
| Q10 | Cumulative % of total revenue by month | `orders`, `order_details` |
```
---

## 💡 Key Insights

- **Côte de Blaye** alone drives **11.17%** of all revenue — the single most valuable product in the catalog
- **Order #11077** has 25 line items — a massive outlier compared to the average of 2–3 items per order
- **December 1997** had 48 orders — the highest in any single month, confirming strong Q4 seasonality
- **16 customers** have never placed an order through Margaret Peacock, the company's top-performing rep
- **50% of total revenue** was not reached until **September 1997**, showing back-loaded, accelerating growth
- Only **2 products** are below reorder level with active stock: Nord-Ost Matjeshering and Outback Lager

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| **MySQL 8.0** | Query execution and database management |
| **VS Code** | Query writing and project development |
| **SQLTools Extension** | MySQL connection inside VS Code |
| **Git & GitHub** | Version control and project hosting |

---

## 📁 Project Structure

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


## 📊 SQL Concepts Used

```
| Concept | Questions |
|---|---|
| `WHERE`, `CONCAT`, filtering | Q1, Q2 |
| `JOIN`, `GROUP BY`, `HAVING` | Q3, Q6 |
| Subquery with `NOT IN` | Q4 |
| Aggregate functions (`COUNT`, `SUM`) | Q3, Q5, Q6 |
| Date functions (`YEAR`, `MONTH`, `MONTHNAME`) | Q7 |
| CTEs (`WITH` clause) | Q8, Q10 |
| Window functions (`LAG`, `SUM OVER`, `ORDER BY`) | Q8, Q9, Q10 |
```
---


## 👤 Author

**Shubham Gupta**  

Aspiring Data Scientist · Building projects across GenAI, SQL, and Python  
🔗 [GitHub][(https://github.com/theShubhmGupta)], 
💼 [LinkedIn][(https://www.linkedin.com/in/theshubhamguptaa/)]

---

> *This project is part of a data science portfolio focused on real-world business problem solving using SQL, Python, and AI tools.*
