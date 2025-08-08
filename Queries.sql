select * from Ecommerce_data;

-- 1. Total transactions

SELECT COUNT(*) AS total_transactions
FROM Ecommerce_data;

-- 2. Total revenue

SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM Ecommerce_data;

-- 3. Countries (excluding primary one, e.g., UK)

SELECT DISTINCT Country
FROM Ecommerce_data

-- 4. Unique customers

SELECT COUNT(DISTINCT CustomerID) AS unique_customers
FROM Ecommerce_data;

-- 5. Top 10 products by quantity sold

SELECT Description, SUM(Quantity) AS total_quantity
FROM Ecommerce_data
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

-- 6. Products with highest revenue

SELECT Description, SUM(Quantity * UnitPrice) AS total_revenue
FROM Ecommerce_data
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- 7. Products sold only once

SELECT StockCode, Description, COUNT(*) AS sale_count
FROM Ecommerce_data
GROUP BY 1,2
HAVING COUNT(*) = 1;

-- 8. Average unit price

SELECT round(AVG(UnitPrice),2) AS avg_unit_price
FROM Ecommerce_data;

-- 9. Top customers by spend

SELECT CustomerID, SUM(Quantity * UnitPrice) AS total_spent
FROM Ecommerce_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 10. Customers with highest number of different products

SELECT CustomerID, COUNT(DISTINCT StockCode) AS unique_products
FROM Ecommerce_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 11. Average orders per customer

SELECT round(AVG(order_count),2) AS avg_orders_per_customer
FROM (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS order_count
    FROM Ecommerce_data
    GROUP BY 1
) sub;

-- 12. One-time buyers

SELECT CustomerID
FROM Ecommerce_data
GROUP BY 1
HAVING COUNT(DISTINCT InvoiceNo) = 1;

-- 13. Transactions per month

SELECT to_char(InvoiceDate, 'YYYY') AS Year,to_char(InvoiceDate, 'mm') AS Month, COUNT(*) AS total_transactions
FROM Ecommerce_data
GROUP BY 1,2
ORDER BY 1,2;

-- 14. Peak sales month by revenue

SELECT to_char(InvoiceDate, 'YYYY') AS Year,to_char(InvoiceDate, 'mm') AS Month,SUM(Quantity * UnitPrice) AS revenue
FROM Ecommerce_data
GROUP BY 1,2
ORDER BY 1,2;

-- 15. Weekday vs weekend sales

select 
	case when EXTRACT(DOW FROM InvoiceDate) in (1,7) then 'Weekend' else 'Weekday' end as day_type,
	SUM(Quantity * UnitPrice) AS revenue	
from Ecommerce_data
group by 1

-- 16. Busiest hour of day

SELECT extract(hour from InvoiceDate) AS hour, COUNT(*) AS transactions
FROM Ecommerce_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 17. Most popular product in each country

SELECT Country, Description, total_quantity
FROM (
    SELECT Country, Description, SUM(Quantity) AS total_quantity,
           ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Quantity) DESC) AS rn
    FROM Ecommerce_data
    GROUP BY Country, Description
) ranked
WHERE rn = 1;

-- 18. Month-over-month revenue growth

with cte as (
SELECT extract(month from InvoiceDate) AS month,
			sum(Quantity * UnitPrice)  AS revenue
FROM Ecommerce_data
GROUP BY 1
)

select month,coalesce(round((revenue - LAG(revenue) OVER (ORDER BY month)) / LAG(revenue) OVER (ORDER BY month) * 100,2),0) AS growth_percent
from cte

-- 19. Refunds / returns impact

SELECT SUM(Quantity * UnitPrice)*(-1) AS refund_impact
FROM Ecommerce_data
WHERE Quantity < 0;

-- 20. First and latest purchase per customer

SELECT CustomerID, MIN(InvoiceDate) AS first_purchase, MAX(InvoiceDate) AS last_purchase
FROM Ecommerce_data
GROUP BY 1;











