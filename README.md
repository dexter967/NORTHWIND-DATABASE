# Northwind Database — SQL + Pandas Business Analysis
 
## 📦 Database Overview
 
**Source:** [Northwind SQLite3](https://github.com/jpwhite3/northwind-SQLite3) — a SQLite3 port
of Microsoft's classic Northwind sample database.
 
Northwind models a small specialty food import/export company and includes customers, orders,
order line items, products, categories, suppliers, employees, and shippers. The core tables used
in this analysis:
 
| Table | Purpose |
|---|---|
| `Customers` | Company/contact info per customer. |
| `Orders` | One row per order (who ordered, when, who processed it, how it shipped). |
| `Order Details` | One row per product line within an order — quantity, unit price, discount. |
| `Products` | Product catalogue, including category and supplier. |
| `Categories` | Product category names/descriptions. |
| `Employees`, `Suppliers`, `Shippers` | Supporting reference tables. |
 
Revenue for any line item is computed as:
 
```
Revenue = Quantity × UnitPrice × (1 − Discount)
```
 
which matches the formula Northwind's own built-in views (`Order Details Extended`, `Order
Subtotals`) use.
 
## 💼 Business Questions
 
This analysis answers five concrete business questions:
 
1. **Which products sell the best?** → Top 10 products by total revenue.
2. **Who are the most valuable customers?** → Top 10 customers by total revenue.
3. **How does demand change over time?** → Monthly sales/revenue trend.
4. **Which product categories perform best?** → Revenue and units sold by category.
5. **How often do customers come back?** → Purchase frequency per customer (order count,
   active date range, average days between orders).
## 🗂️ Repository Contents
 
- **`queries.sql`** — the 5 SQL queries that answer the business questions above, written for
  SQLite3. Each is labeled with a `-- QUERY: <name>` marker so `analysis.ipynb` can load them
  programmatically instead of duplicating SQL in Python.
- **`analysis.ipynb`** — connects to the database, runs each query via `pandas.read_sql_query`,
  explores the results (shape, dtypes, summary stats), builds a chart per question, and ends with
  a cell that **auto-generates the 5 key insights** from the live query results (see below).
- **`README.md`** — this file.
## 🔑 Key Insights
 
`analysis.ipynb` computes these automatically from the query results, so the numbers always match
whatever data is loaded. The five insights it generates are:
 
1. **Best-selling product** — which product leads in total revenue and how many units it sold.
2. **Top customer** — the single highest-revenue customer and their order count.
3. **Seasonality** — the best and worst month for revenue, and the percentage swing between them.
4. **Category concentration** — the top-performing product category and how many products
   drive its revenue.
5. **Purchase frequency** — the average number of orders per customer, and how concentrated
   ordering is among the most frequent (top-decile) customers.
*(Run the notebook once to see the actual filled-in numbers for your data — see screenshots
placeholder below.)*
 
### 📸 SQL Output Screenshots
 
*(Add screenshots here after running `analysis.ipynb` — e.g. the Top 10 Products table, the
monthly revenue chart, and the printed insights cell.)*
 
## 🛠️ How to Reproduce
 
1. Download the database file from the repo's own download link:
   [`northwind.db`](https://raw.githubusercontent.com/jpwhite3/northwind-SQLite3/main/dist/northwind.db)
   and place it in the same folder as `analysis.ipynb` (keep the filename `northwind.db`, or
   update `DB_PATH` at the top of the notebook).
2. `pip install pandas matplotlib` (SQLite support is built into Python's standard library).
3. Run `analysis.ipynb` top to bottom. Each business question prints/plots its result, and the
   final insights cell prints all 5 insights generated from the real numbers.
 
