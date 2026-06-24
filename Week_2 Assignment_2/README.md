# E-Commerce Sales Database Analysis using SQL

## Overview

This project was completed as part of a SQL database assignment. The objective was to design and query an E-Commerce Sales Database to analyze customer behavior, product performance, sales trends, and order management using SQL.

The assignment demonstrates the use of SQL concepts including table creation, constraints, indexes, filtering, aggregation, joins, CASE statements, and transaction management.

---

## Database Schema

The database consists of four related tables:

### 1. Customers

Stores customer information such as:

* Customer ID
* Name
* Email
* City
* State
* Join Date
* Premium Membership Status

### 2. Products

Stores product details such as:

* Product ID
* Product Name
* Category
* Brand
* Unit Price
* Stock Quantity

### 3. Orders

Stores order information including:

* Order ID
* Customer ID
* Order Date
* Order Status
* Total Amount

### 4. Order_Items

Stores item-level order details:

* Item ID
* Order ID
* Product ID
* Quantity
* Unit Price
* Discount Percentage

---

## Entity Relationships

customers (1:N) orders

orders (1:N) order_items

products (1:N) order_items

Foreign Key Relationships:

* orders.customer_id → customers.customer_id
* order_items.order_id → orders.order_id
* order_items.product_id → products.product_id

---

## SQL Concepts Covered

### Section A – SQL Basics

* SELECT statements
* Primary Keys
* Constraints
* UNIQUE and NOT NULL
* CHECK Constraints

### Section B – Filtering & Optimization

* WHERE clause
* BETWEEN operator
* AND / OR conditions
* Indexes
* Query Optimization
* SARGable Queries

### Section C – Aggregation

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING
* ORDER BY

### Section D – Joins & Relationships

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* Multi-table Joins
* Foreign Keys
* Referential Integrity

### Section E – Advanced SQL Concepts

* CASE Statements
* ACID Properties
* Transactions
* COMMIT
* ROLLBACK

---

## Indexes Implemented

### Customers Table

* idx_customers_city
* idx_customers_state

### Products Table

* idx_products_category

### Orders Table

* idx_orders_date
* idx_orders_status

Indexes improve query performance by reducing table scans and allowing faster searching and filtering.

---

## Key Queries Performed

### Customer Analysis

* Retrieve customer details
* Filter customers by state and join year
* Analyze premium customers

### Product Analysis

* Product categorization
* Price tier classification
* Average pricing by category
* Most expensive and cheapest products

### Order Analysis

* Delivered order tracking
* Revenue calculation
* Order status analysis
* Date-based filtering

### Join Operations

* Customer and order mapping
* Product sales tracking
* Order item analysis

### Transaction Management

* Order insertion
* Stock updates
* Rollback handling
* Commit operations

---

## ACID Properties Demonstrated

### Atomicity

Ensures all transaction steps succeed or all fail together.

### Consistency

Maintains valid data according to constraints and relationships.

### Isolation

Prevents concurrent transactions from interfering with each other.

### Durability

Ensures committed transactions remain permanently stored.

---

## Tools Used

* MySQL Workbench
* MySQL Database Server
* SQL

---

## Learning Outcomes

Through this assignment, I gained practical experience in:

* Database Design
* Relational Database Management
* SQL Query Writing
* Data Filtering and Aggregation
* Table Relationships and Joins
* Query Optimization using Indexes
* Transaction Management
* ACID Properties of Databases

---

## Conclusion

This project demonstrates the implementation of a complete E-Commerce relational database system using SQL. The assignment helped strengthen concepts related to database design, query optimization, data analysis, joins, aggregation functions, constraints, and transaction management, providing hands-on experience with real-world database operations.
