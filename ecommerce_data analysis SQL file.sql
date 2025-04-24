CREATE DATABASE ecommerce_db;
USE ecommerce_db;

SELECT region, SUM(sales) AS total_sales
FROM ecommerce_data
GROUP BY region
ORDER BY total_sales DESC;

SELECT `Sub-Category`, SUM(Sales) AS total_sales
FROM ecommerce_data
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;

SELECT Category, SUM(Sales) AS total_sales
FROM ecommerce_data
WHERE Sales > 1000
GROUP BY Category
ORDER BY total_sales DESC;

SELECT `Order ID`, `Order Date`, `Ship Mode`, Sales
FROM ecommerce_data
WHERE `Ship Mode` = 'Second Class'
ORDER BY `Order Date` DESC
LIMIT 0, 1000;

SELECT a.`Order ID`, a.`Customer ID`, a.Sales AS Sales_1, b.Sales AS Sales_2
FROM ecommerce_data a
INNER JOIN ecommerce_data b
ON a.`Customer ID` = b.`Customer ID`
AND a.`Order ID` != b.`Order ID`
ORDER BY a.`Customer ID`, a.`Order Date` DESC;


SELECT a.`Order ID`, a.`Customer ID`, a.Sales, b.`Order ID` AS Other_Order_ID
FROM ecommerce_data a
LEFT JOIN ecommerce_data b
ON a.`Customer ID` = b.`Customer ID`
AND a.`Order ID` != b.`Order ID`
ORDER BY a.`Customer ID`, a.`Order Date` DESC;

SELECT b.`Order ID`, b.`Customer ID`, b.Sales, a.`Order ID` AS Previous_Order_ID
FROM ecommerce_data a
RIGHT JOIN ecommerce_data b
ON a.`Customer ID` = b.`Customer ID`
AND a.`Order ID` != b.`Order ID`
ORDER BY b.`Customer ID`, b.`Order Date` DESC;

SELECT `Order ID`, Sales
FROM ecommerce_data
WHERE Sales > (
    SELECT AVG(Sales)
    FROM ecommerce_data
);

SELECT `Ship Mode`, SUM(Sales) AS Total_Sales
FROM ecommerce_data
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;

SELECT Category, AVG(Profit) AS Average_Profit
FROM ecommerce_data
GROUP BY Category
ORDER BY Average_Profit DESC;

DROP VIEW IF EXISTS high_value_orders;
CREATE VIEW high_value_orders AS
SELECT `Order ID`, `Customer ID`, Sales, `Order Date`
FROM ecommerce_data
WHERE Sales > 100;

SELECT * FROM high_value_orders;

DROP INDEX idx_customer_id ON ecommerce_data;
CREATE INDEX idx_customer_id ON ecommerce_data(`Customer ID`(255));
SHOW INDEX FROM ecommerce_data;








