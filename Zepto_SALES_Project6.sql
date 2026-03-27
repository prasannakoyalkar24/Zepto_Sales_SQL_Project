-- CREATING TABLES

DROP TABLE IF EXISTS ZEPTO;
CREATE TABLE ZEPTO (
sku_id                  serial PRIMARY KEY,
Category                varchar(200),
name                    varchar(200) NOT NULL,
mrp	                    numeric(8, 2),
discountPercent         numeric(5 , 2),
availableQuantity       integer,
discountedSellingPrice  numeric(8 , 2),
weightInGms             integer,
outOfStock              boolean,
quantity                integer
);

SELECT * FROM zepto;

-- DATA EXPLORATION
SELECT COUNT(*) FROM zepto;

-- sample data
SELECT * FROM Zepto
LIMIT 10;

-- NULL VALUES
SELECT * FROM Zepto
WHERE category IS NULL 
OR
name IS NULL
OR 
mrp IS NULL
OR 
discountpercent IS NULL
OR 
availablequantity IS NULL 
OR
discountedsellingprice IS NULL 
OR
weightingms IS NULL 
OR
outofstock IS NULL 
OR
quantity IS NULL;

-- Different product categories
SELECT DISTINCT category FROM Zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock , count(*)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT name , count(*) as count
FROM zepto
GROUP BY name
HAVING count(*) > 1
ORDER BY count desc;

-- DATA CLEANING
-- products with price = 0
SELECT * FROM zepto 
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM Zepto 
WHERE mrp = 0 OR discountedsellingprice = 0;

-- convert paise to rupee 
UPDATE Zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

-- BUSINESS PROBLEMS
-- Q1.Find the top 10 best-value products based on the discount percentage.
SELECT * FROM zepto 
ORDER BY discountpercent desc
LIMIT 10;

-- Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedsellingprice * availablequantity) as revenue
FROM zepto
GROUP BY category
ORDER BY 2 desc;

--Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT * FROM zepto WHERE 
mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--Q5.Identify the top 5 categories offering the highest average discount percentage
SELECT category,
ROUND(
avg(discountpercent),2) as average
FROM zepto
GROUP BY category
ORDER BY 2;

--Q6.Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE 
    WHEN weightInGms < 1000 THEN 'LOW'
	WHEN weightInGms < 5000 THEN 'MEDIUM'
	ELSE 'BULK'
END AS weight_category
FROM Zepto;

--Q8.What is the Total Inventory Weight Per Category
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;














