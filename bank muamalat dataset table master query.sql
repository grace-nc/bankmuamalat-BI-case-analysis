# Query for BI Analyst Project-based Internship
# By Grace Natalie Catherine

# Primary Key Orders
SELECT OrderID, COUNT(OrderID) as Total_Orders
FROM `user_churn.Orders`
GROUP BY OrderID
ORDER BY Total_Orders
LIMIT 5;

# Primary Key Customers
SELECT CustomerID, COUNT(CustomerID) AS Total_Customers
FROM `user_churn.Customers`
GROUP BY CustomerID
ORDER BY Total_Customers
LIMIT 5;

# Primary Key Products
SELECT ProdNumber, COUNT(ProdNumber) AS Total_Products
FROM `user_churn.Products`
GROUP BY ProdNumber
ORDER BY Total_Products
LIMIT 5;

# Primary Key Product Category
SELECT CategoryID, COUNT(CategoryID) AS Total_Category
FROM `user_churn.ProductCategory`
GROUP BY CategoryID
ORDER BY Total_Category
LIMIT 5;

# Query Join For Table Master
SELECT
  o.Date AS order_date,
  pc.CategoryName AS prod_category_name,
  p.ProdName AS product_name,
  p.Price AS product_price,
  o.Quantity AS order_qty,
  (o.Quantity * p.Price) AS total_sales,
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city

FROM `user_churn.Orders` o
JOIN `user_churn.Customers` c ON o.CustomerID = c.CustomerID
JOIN `user_churn.Products` p ON o.ProdNumber = p.ProdNumber
JOIN `user_churn.ProductCategory` pc ON p.Category = pc.CategoryID
ORDER BY 1 ASC;