# 🏢 SQL Data Warehouse Project

A SQL Server project demonstrating the implementation of a Data Warehouse using the **Bronze → Silver → Gold** architecture.

## 📌 Project Overview

This project focuses on building a data warehouse entirely using SQL Server.

The project includes:
- Database initialization
- Bronze layer for raw data
- Silver layer for cleaned and transformed data
- Gold layer with dimension and fact tables for analytics

---

## 📂 Project Structure

```
sql-data-warehouse-project/
│
├── datasets/
│
├── scripts/
│   ├── bronze/
│   │   ├── ddl_bronze.sql
│   │   └── proc_load_bronze.sql
│   │
│   ├── silver/
│   │   ├── ddl_silver.sql
│   │   └── proc_load_silver.sql
│   │
│   ├── gold/
│   │   ├── 01_Creating_Dimension_Customers.sql
│   │   ├── 02_Creating_Dimension_Products.sql
│   │   └── 03_Creating_Fact_Sales.sql
│   │
│   └── init_database.sql
│
└── README.md
```

---

## 🥉 Bronze Layer

- Creates raw tables
- Loads source data
- Preserves original records without modification

---

## 🥈 Silver Layer

- Cleans and standardizes data
- Removes duplicates
- Handles NULL values
- Applies business rules
- Prepares data for analysis

---

## 🥇 Gold Layer

Creates analytical tables using a Star Schema.

### Dimension Tables
- dim_customers
- dim_products

### Fact Table
- fact_sales

---

## 🛠 Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)

---

## 📚 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- ALTER TABLE
- INSERT INTO
- UPDATE
- DELETE
- TRUNCATE
- BULK INSERT
- Stored Procedures
- Common Table Expressions (CTEs)
- Window Functions
- CASE Expressions
- JOINs
- Aggregate Functions
- Constraints
- Data Cleaning Techniques

---

## 🎯 Objectives

- Design a SQL Data Warehouse
- Build an ETL pipeline using SQL
- Transform raw data into analytical datasets
- Create dimension and fact tables
- Implement the Bronze, Silver, and Gold architecture

---

## 👨‍💻 Author

**Amey Waikar**

Aspiring Data Analyst specializing in SQL and Data Warehousing.
