DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantitiy INTEGER
);

--Data exploration

SELECT * FROM zepto;

--count of rows
SELECT COUNT(*) FROM zepto;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantitiy IS NULL

--DIFFRERNT PRODUCT CATEGORY
SELECT DISTINCT category
from zepto
ORDER BY category;

--product in stock vs out of stock
SELECT outOfStock, count(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name, count(sku_id) as "Number of SKUs"
from zepto
group by name
HAVING count(sku_id)>1
ORDER BY count(sku_id) DESC;

--data cleaning

--product with price =0
SELECT * FROM zepto
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto
where mrp =0;


--convert paise into rupees
update zepto
set mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100.0;

SELECT mrp,discountedSellingPrice from zepto;


--Q1. find the top 10 best value product based in the discout percentage
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
--Q2. what are the product with high mrp but out of stock
SELECT DISTINCT name,mrp 
FROM zepto
where outOfStock =True
ORDER BY mrp DESC
LIMIT 5;
--Q3 .calculate estimated revenue for each category
SELECT category,sum(discountedSellingPrice* availableQuantity) as total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;
--Q4 .find all product where mrp is greater than 500 and discount is less than 10%.
SELECT DISTINCT name ,mrp,discountPercent
FROM zepto
WHERE mrp>500 AND discountPercent<10
order by mrp DESC,discountpercent DESC;
--Q4 . identify the top 5 categories offering the highesst average discount percentage.
SELECT category,round(avg(discountPercent),2)as avg_percent
FROM zepto
GROUP BY category
ORDER BY avg_percent DESC
LIMIT 5;
--Q5. find the price per gram for product above 100g and sort by best value
SELECT DISTINCT name, weightInGms,discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) as price_per_gram
FROM zepto
WHERE  weightInGms>=100
ORDER BY price_per_gram;
--Q7. group the product into categories like , low ,medium,bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms<1000 then 'low'
WHEN weightInGms<5000 then 'medium'
ELSE 'bulk'
END AS weight_category
FROM zepto;
--Q8. what is the total inventory weight per category
SELECT category,
sum( weightInGms * availableQuantity) as total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
