
# Q1. Fetch the full name and hiring date of all Employees who work as Sales Representatives.

SELECT 
    CONCAT(firstname, ' ', lastname) AS full_name,
    hiredate
FROM employees
WHERE title = 'Sales Representative';



# Q2. Which of the products in our inventory need to be reordered?

SELECT productname, unitsinstock, unitsonorder, reorderlevel
FROM products
WHERE unitsinstock + unitsonorder <= reorderlevel
  AND discontinued = 0;



# Q3. Find and display the details of customers who have placed more than 5 orders.

SELECT c.customerid, c.companyname, c.contactname, COUNT(o.orderid) AS total_orders
FROM customers c
JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.companyname, c.contactname
HAVING COUNT(o.orderid) > 5
ORDER BY total_orders DESC;



# Q4. An employee (Margaret Peacock, EmployeeID 4) has the record
#     of completing the most orders. However, there are some customers
#     who've never placed an order with her. Show such customers.


SELECT customerid, companyname, contactname
FROM customers
WHERE customerid NOT IN (
    SELECT DISTINCT customerid
    FROM orders
    WHERE employeeid = 4
);



# Q5. The developers at Cochin Traders are testing an app that the
#     customers will use to show orders. In order to make sure that even the
#     largest orders will show up correctly on the app, they'd like some
#     samples of orders that have lots of individual line items. Display the top
#     10 orders with the most line items.


SELECT orderid, COUNT(productid) AS line_item_count
FROM order_details
GROUP BY orderid
ORDER BY line_item_count DESC
LIMIT 10;



# Q6. Retrieve the top 5 best-selling products based on total quantity ordered.


SELECT p.productname, SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN products p ON od.productid = p.productid
GROUP BY p.productname
ORDER BY total_quantity_sold DESC
LIMIT 5;



# Q7. Analyze the monthly order count for the year 1997.


SELECT 
    MONTHNAME(orderdate) AS month_name,
    MONTH(orderdate) AS month_num,
    COUNT(orderid) AS total_orders
FROM orders
WHERE YEAR(orderdate) = 1997
GROUP BY month_num, month_name
ORDER BY month_num;



# Q8. Calculate the difference in sales revenue for each month compared to the previous month.


WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(o.orderdate, '%Y-%m') AS month,
        ROUND(SUM(od.unitprice * od.quantity * (1 - od.discount)), 2) AS revenue
    FROM orders o
    JOIN order_details od ON o.orderid = od.orderid
    GROUP BY month
)
SELECT 
    month,
    revenue,
    ROUND(revenue - LAG(revenue) OVER (ORDER BY month), 2) AS revenue_diff
FROM monthly_revenue
ORDER BY month;



# Q9. Calculate the percentage of total sales revenue for each product.


SELECT 
    p.productname,
    ROUND(SUM(od.unitprice * od.quantity * (1 - od.discount)), 2) AS product_revenue,
    ROUND(
        SUM(od.unitprice * od.quantity * (1 - od.discount)) * 100.0 /
        SUM(SUM(od.unitprice * od.quantity * (1 - od.discount))) OVER (), 2
    ) AS revenue_pct
FROM order_details od
JOIN products p ON od.productid = p.productid
GROUP BY p.productname
ORDER BY revenue_pct DESC;



# Q10. Determine the cumulative percentage of total salesrevenue for each month.


WITH monthly_revenue AS (
    SELECT 
        DATE_FORMAT(o.orderdate, '%Y-%m') AS month,
        ROUND(SUM(od.unitprice * od.quantity * (1 - od.discount)), 2) AS revenue
    FROM orders o
    JOIN order_details od ON o.orderid = od.orderid
    GROUP BY month
)
SELECT 
    month,
    revenue,
    ROUND(
        SUM(revenue) OVER (ORDER BY month) * 100.0 / SUM(revenue) OVER (), 2
    ) AS cumulative_pct
FROM monthly_revenue
ORDER BY month;
