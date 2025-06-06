-- Query 1: Get all rows where Item_Fat_Content is 'Low Fat'
SELECT * 
FROM delivery_data
WHERE Item_Fat_Content = 'Low Fat';

-- Query 2: Get top 10 items by Sales (descending order)
SELECT Item_Identifier, Sales
FROM delivery_data
ORDER BY Sales DESC
LIMIT 10;

-- Query 3: Get all Outlet_Type = 'Supermarket Type1' AND Sales > 2000
SELECT *
FROM delivery_data
WHERE Outlet_Type = 'Supermarket Type1' AND Sales > 2000;

-- Query 4: List all outlet types and how many entries each has
SELECT Outlet_Type, COUNT(*) AS Total_Records
FROM delivery_data
GROUP BY Outlet_Type;

-- Query 5: Total Sales per Outlet_Type
SELECT Outlet_Type, SUM(Sales) AS Total_Sales
FROM delivery_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

-- Query 6: Average Item_Weight per Item_Type
SELECT Item_Type, AVG(Item_Weight) AS Avg_Weight
FROM delivery_data
GROUP BY Item_Type
ORDER BY Avg_Weight DESC;

-- Query 7: Total Sales per Year
SELECT Outlet_Establishment_Year, SUM(Sales) AS Total_Sales
FROM delivery_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

-- Query 8: Show items with sales above the average
SELECT Item_Identifier, Sales
FROM delivery_data
WHERE Sales > (
    SELECT AVG(Sales) FROM delivery_data
);

-- Query 9: Show outlet(s) with the highest total sales
SELECT Outlet_Identifier, SUM(Sales) AS Total_Sales
FROM delivery_data
GROUP BY Outlet_Identifier
HAVING SUM(Sales) = (
    SELECT MAX(total_sales)
    FROM (
        SELECT SUM(Sales) AS total_sales
        FROM delivery_data
        GROUP BY Outlet_Identifier
    ) AS outlet_sales
);

-- Query 10: Find item types that have more than average weight
SELECT Item_Type, AVG(Item_Weight) AS Avg_Weight
FROM delivery_data
GROUP BY Item_Type
HAVING AVG(Item_Weight) > (
    SELECT AVG(Item_Weight) FROM delivery_data
);

-- Query 11: Create a View of Total Sales by Outlet Type
CREATE VIEW OutletSalesSummary AS
SELECT Outlet_Type, SUM(Sales) AS Total_Sales, AVG(Sales) AS Avg_Sales
FROM delivery_data
GROUP BY Outlet_Type;
SELECT * FROM OutletSalesSummary;

-- Query 12: Create a View of High-Performing Items (Sales > 2500)
CREATE VIEW HighSellingItems AS
SELECT Item_Identifier, Item_Type, Sales
FROM delivery_data
WHERE Sales > 2500;
SELECT * FROM HighSellingItems ORDER BY Sales DESC;

-- Query 13: Add Index on Item_Fat_Content (used in WHERE)
CREATE INDEX idx_fat_content ON delivery_data(Item_Fat_Content);

-- Query 14: Add Index on Outlet_Type (used in GROUP BY, filters)
CREATE INDEX idx_outlet_type ON delivery_data(Outlet_Type);

-- Query 15: Composite Index: Outlet_Type + Sales
CREATE INDEX idx_type_sales ON delivery_data(Outlet_Type, Sales);

-- Query 16: Checking if Index Exists?
SHOW INDEX FROM delivery_data;


