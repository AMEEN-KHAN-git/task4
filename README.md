# task4
Day 5 task of the Data Analyst Internship

## Dataset used
**File:** `delivery_dataset.csv`  
**Imported into:** MySQL CLI using `LOAD DATA INFILE`  
**Database:** `delivery_analysis`  
**Table:** `delivery_data`

## Queries Performed

### 1️⃣ SELECT, WHERE, ORDER BY
- Filtered items by fat content and sales
- Sorted top-selling items
- Combined conditions with AND/OR logic

### 2️⃣ GROUP BY + Aggregations
- Total sales by outlet type
- Average item weight by item type
- Sales trends by outlet establishment year

### 3️⃣ Subqueries
- Found items with sales above the average
- Identified top-performing outlets using nested `MAX` query
- Compared item type weights above overall average

### 4️⃣ Views
- Created views for reusable insights:
  - `OutletSalesSummary`
  - `HighSellingItems`

### 5️⃣ Optimization
- Added indexes for better performance:
  - On `Item_Fat_Content`
  - On `Outlet_Type`
  - Composite index: `Outlet_Type, Sales`

---

## Output Files

- `task3_queries.sql` → All SQL queries used
- `task3_output.txt` → CLI output of queries and results

---

## Tools Used
- MySQL 8.x CLI
