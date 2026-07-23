Epochs '26 - Assignment 2: Northwind Database Analysis
Database Overview
This project analyzes the Northwind sample database, a classic small-business dataset covering customers, orders, products, categories, suppliers and employees. The database used is the SQLite version: https://github.com/jpwhite3/northwind-SQLite3 (dist/northwind.db).

The goal was to answer real-world business questions using SQL, then explore and visualize the results using Pandas in Python.

Business Questions Answered
What are the Top 10 selling products (by quantity sold)?
Who are the Top 10 customers by revenue?
What do monthly sales trends look like over time?
Which product categories perform best by revenue?
Which customers order most frequently?
Repository Contents
queries.sql - Raw SQL queries used to answer each business question
analysis.ipynb - SQL execution against the database, results loaded into Pandas, exploratory analysis and charts
README.md - This file
screenshots - Screenshots of sql queries' execution
SQL Output Screenshots
Top 10 Products

Top 10 Customers

Monthly Sales Trend

Best Categories

Purchase Frequency

Key Insights
Product sales are remarkably even at the top. The top 10 products all sold within a narrow band of roughly 203,000–206,000 units (Louisiana Hot Spiced Okra leads at 206,213), showing no single "hero product" dominates — demand is spread broadly across the catalog rather than concentrated in one bestseller.

Revenue is heavily concentrated among a small set of customers. The top customer generated over $9.7M in revenue, roughly 58% more than the second-highest customer (B's Beverages at ~$6.15M), indicating the business relies significantly on a handful of major accounts.

Sales have grown substantially over time. Monthly revenue rose from around $2.07M in mid-2012 to a fairly stable $3-3.5M range by 2023, showing steady long-term growth, with the business roughly 50%+ larger by revenue in its later years compared to its early months.

Beverages is the standout category. Beverages generated ~$92.2M in revenue, well ahead of the next category (Confections at ~$66.3M) - nearly 39% higher, making it the clear priority category for inventory and marketing focus.

High-value customers also tend to order most frequently, but not perfectly in sync. The top customer by order count (335 orders) also topped revenue, but customers ranked #2–4 by order frequency don't fully match the top revenue ranks, suggesting a mix of frequent, smaller-basket customers and infrequent, high-value ones.

Tools Used
SQLite (via Python's sqlite3 module)
Pandas for data analysis
Google Colab as the development environment
