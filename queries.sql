-- ============================================================
-- Northwind Database — Business Question Queries
-- Schema source: https://github.com/jpwhite3/northwind-SQLite3
-- Dialect: SQLite3
-- Note: "Order Details" has a space in its name, so it must be
--       double-quoted every time it's referenced.
-- ============================================================

-- QUERY: top_10_products
-- Description: Top 10 selling products by total revenue generated
-- (revenue = Quantity * UnitPrice * (1 - Discount), the standard
-- Northwind line-item revenue formula used in its own official views).
SELECT
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity)                                            AS TotalUnitsSold,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue
FROM "Order Details" od
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 10;


-- QUERY: top_10_customers
-- Description: Top 10 customers by total revenue.
SELECT
    c.CustomerID,
    c.CompanyName,
    COUNT(DISTINCT o.OrderID)                                    AS TotalOrders,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue
FROM Customers c
JOIN Orders o          ON o.CustomerID = c.CustomerID
JOIN "Order Details" od ON od.OrderID = o.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalRevenue DESC
LIMIT 10;


-- QUERY: monthly_sales_trend
-- Description: Monthly revenue and order-count trend across the
-- full history of the store, for spotting seasonality/growth.
SELECT
    strftime('%Y-%m', o.OrderDate)                               AS OrderMonth,
    COUNT(DISTINCT o.OrderID)                                     AS OrderCount,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS MonthlyRevenue
FROM Orders o
JOIN "Order Details" od ON od.OrderID = o.OrderID
GROUP BY OrderMonth
ORDER BY OrderMonth;


-- QUERY: category_performance
-- Description: Revenue and units sold per product category, to find
-- the best (and worst) performing categories.
SELECT
    cat.CategoryID,
    cat.CategoryName,
    SUM(od.Quantity)                                             AS TotalUnitsSold,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalRevenue,
    COUNT(DISTINCT p.ProductID)                                  AS ProductCount
FROM Categories cat
JOIN Products p          ON p.CategoryID = cat.CategoryID
JOIN "Order Details" od  ON od.ProductID = p.ProductID
GROUP BY cat.CategoryID, cat.CategoryName
ORDER BY TotalRevenue DESC;


-- QUERY: customer_purchase_frequency
-- Description: How often each customer orders — number of orders,
-- their active date range, and average days between orders.
SELECT
    c.CustomerID,
    c.CompanyName,
    COUNT(DISTINCT o.OrderID)                                    AS NumberOfOrders,
    MIN(o.OrderDate)                                             AS FirstOrderDate,
    MAX(o.OrderDate)                                             AS LastOrderDate,
    ROUND(
        CAST(julianday(MAX(o.OrderDate)) - julianday(MIN(o.OrderDate)) AS FLOAT)
        / NULLIF(COUNT(DISTINCT o.OrderID) - 1, 0)
    , 1)                                                          AS AvgDaysBetweenOrders
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY NumberOfOrders DESC;
