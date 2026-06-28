USE `E-Commerce Sales Database`;


--1. Create Table: customers 

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    join_date DATE NOT NULL,
    is_premium BOOLEAN DEFAULT FALSE
);

--2. Create Table: products

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK(unit_price > 0),
    stock_qty INT NOT NULL DEFAULT 0 CHECK(stock_qty >= 0)
); 

--3. Create Table: orders

CREATE TABLE orders ( 
    order_id      INT           PRIMARY KEY, 
    customer_id   INT           NOT NULL, 
    order_date    DATE          NOT NULL, 
    status        VARCHAR(20)   NOT NULL  DEFAULT 'Pending' 
                  CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')), 
    total_amount  DECIMAL(12,2) NOT NULL  CHECK (total_amount >= 0), 
     
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
); 


--4. Create Table: order_items

CREATE TABLE order_items ( 
    item_id       INT           PRIMARY KEY, 
    order_id      INT           NOT NULL, 
    product_id    INT           NOT NULL, 
    quantity      INT           NOT NULL  CHECK (quantity > 0), 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    discount_pct  DECIMAL(5,2)  DEFAULT 0 CHECK (discount_pct BETWEEN 0 AND 100), 
     
    FOREIGN KEY (order_id)   REFERENCES orders(order_id), 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
    );


    CREATE INDEX idx_customers_city ON customers(city);

    CREATE INDEX idx_customers_state ON customers(state);

    CREATE INDEX idx_products_category ON products(category);

    CREATE INDEX idx_orders_date ON orders(order_date);

    CREATE INDEX idx_orders_status ON orders(status);




-- ========== INSERT: customers ========== 
INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', FALSE); 

SELECT * FROM customers;

-- ========== INSERT: products ========== 
INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400); 

SELECT * FROM products;


-- ========== INSERT: orders ========== 
INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00);

SELECT * FROM orders;


-- ========== INSERT: order_items ========== 
INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0); 


SELECT * FROM order_items;


--Section A — SQL Basics (SELECT, Constraints, Primary Keys) 
 
--Q1. Write a query to display all columns and rows from the customer's table. 
 SELECT * FROM customers;

--Q2. Retrieve only the first_name, last_name, and city of all customers. 
SELECT first_name, last_name, city FROM customers;

--Q3. List all unique categories available in the products table. 
SELECT DISTINCT category FROM products;

--Q4. Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL. 
-- ANS : Primary Keys
/* Primary Keys : 
 1) Table customers :-	customer_id
 2) Table products	:-  product_id
 3) Table orders	:-  order_id
 4) Table order_items :- item_id

* Explanation :
A Primary Key:

1.Uniquely identifies each row in a table.
2.Does not allow duplicate values.
3.Cannot contain NULL values.
4.Maintains data integrity and relationships between tables.

For example:
customer_id = 101
identifies one and only one customer.
*/

--Q5. What constraints are applied to the email column in the customers table? What would happen if you tried to insert a duplicate email? 
/*
- ANS:
In the customers table, the email column is defined as:
email VARCHAR(100) UNIQUE NOT NULL

This means that two constraints are applied to the column:

1. UNIQUE Constraint :
The UNIQUE constraint ensures that each customer has a distinct email address. No two rows in the table can contain the same email value. This helps maintain data integrity and prevents duplicate records.
For example, if the email address:
aarav.s@email.com
already exists in the table, another customer cannot be inserted with the same email address.

2. NOT NULL Constraint :

The NOT NULL constraint ensures that the email column cannot contain NULL values. Every customer record must have an email address, and leaving this field empty is not allowed.
Example of inserting a duplicate email
Suppose the following email already exists in the table:
aarav.s@email.com
Now, consider the following query:*/

INSERT INTO customers
VALUES (
109,
'Rahul',
'Sharma',
'aarav.s@email.com',
'Nagpur',
'Maharashtra',
'2024-09-01',
TRUE
);
/*What happens?

MySQL checks the UNIQUE constraint on the email column before inserting the record.
Since the email address:
aarav.s@email.com
already belongs to another customer, MySQL rejects the insertion and generates an error similar to:

ERROR 1062 (23000):
Duplicate entry 'aarav.s@email.com'
for key 'customers.email'
Explanation

The insertion fails because the UNIQUE constraint does not allow duplicate email values. This ensures that every customer in the database has a unique email address, which is important for customer identification and maintaining consistency in the data.

*/

--#Q6. Try inserting a product with unit_price = -50. What happens and which constraint prevents it? Write both the INSERT statement and explain the error.
/*
- ANS :
In the products table, the unit_price column is defined as:
- unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0)

This definition applies two constraints:
1. NOT NULL Constraint :
The NOT NULL constraint ensures that every product must have a price value. The price cannot be left empty.

2. CHECK Constraint :
The CHECK (unit_price > 0) constraint ensures that the value of unit_price must always be greater than zero. Negative prices or zero values are not allowed because a product cannot logically have a negative selling price.

-Example
Consider the following query:*/

INSERT INTO products
VALUES (209,'Headphones','Electronics','Sony',-50,100);/*

What happens?
Before inserting the row, MySQL verifies the condition:
unit_price > 0
Since:
-50 < 0
the condition is violated.
Therefore, MySQL rejects the insertion and displays an error indicating that the CHECK constraint has failed.
The error message may appear similar to:

ERROR:
Check constraint 'products_chk_1' is violated.
Constraint responsible
The following constraint is responsible for preventing the insertion:
CHECK (unit_price > 0)
This constraint was specified during table creation:

Since the value -50 is less than zero, it violates the condition specified by the CHECK constraint. Consequently, MySQL does not allow the record to be inserted into the table.
This validation prevents incorrect or unrealistic data from entering the database and helps maintain data accuracy and reliability.
*/



--Section B — Filtering & Optimization (WHERE, Indexes) 

--Q7. Retrieve all orders with status = 'Delivered'. 
  SELECT * FROM orders WHERE status = 'Delivered';

--Q8. Find all products in the 'Electronics' category with a unit_price greater than ₹2000. 
   SELECT * FROM products WHERE category = 'Electronics' AND unit_price > 2000;

--Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'.
   SELECT * FROM  customers WHERE YEAR(join_date) = 2024 AND state ='Maharashtra';

--Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled. 
 SELECT * FROM orders  WHERE order_date BETWEEN '2024-08-10' and '2024-08-25' AND status != "Cancelled";

--Q11. Explain what the index idx_orders_date does. How would it improve the performance of a query that filters orders by order_date? Write a sample query that would benefit from this index. 
/* ANS :
The Index:*/
CREATE INDEX idx_orders_date ON orders(order_date);/*
creates an index on the order_date column of the orders table.

An index acts like the index of a book. Instead of scanning every row in the table, MySQL can directly locate the required records based on the date value.

* Benefits of the Index :-
-Improves query performance.
-Reduces search time.
-Avoids full table scans.
-Speeds up filtering and sorting operations involving order_date.*/

--Sample Query Benefiting from the Index ;
SELECT * FROM orders WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25';
/*

Explanation:
Since the query filters records based on order_date, MySQL can use the index idx_orders_date to quickly locate the matching rows, thereby improving performance.

*/

--Q12. If you run: SELECT * FROM customers WHERE YEAR(join_date) = 2024; — would the index on join_date be used? Explain why or why not, and rewrite the query to be index-friendly (SARGable)
/* ANS: 
No, the index on join_date would not be used efficiently.
-Reason
The function:
YEAR(join_date)
is applied directly to the indexed column.
When MySQL has to calculate the year for every row, it cannot use the index effectively. As a result, a full table scan may occur, which decreases performance.

-Non-SARGable Query

*/SELECT * FROM customers WHERE YEAR(join_date)=2024;

/*Index-Friendly (SARGable) Query*/

SELECT *
FROM customers
WHERE join_date >= '2024-01-01'
AND join_date < '2025-01-01';
/*
or*/

SELECT *
FROM customers
WHERE join_date BETWEEN '2024-01-01'
AND '2024-12-31';/*

Explanation
These queries compare the actual values stored in the join_date column rather than applying a function to the column. 
Therefore, MySQL can utilize the index efficiently, resulting in faster query execution.

*/


--Section C — Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX) 

--Q13. Count the total number of orders in the orders table. 
  SELECT COUNT(*) AS total_orders FROM orders;

--Q14. Find the total revenue (SUM of total_amount) from all 'Delivered' orders. 
SELECT SUM(total_amount) AS total_revenue FROM  orders WHERE status = 'Delivered';

--Q15. Calculate the average unit_price of products in each category.
SELECT category,AVG(unit_price) AS average_category_price from products GROUP BY category;

--Q16. For each order status, find the count of orders and the total revenue. Sort the result by total revenue in descending order. 
SELECT status , COUNT(*) AS no_of_orders , SUM(total_amount) AS total_revenue FROM orders GROUP BY status ORDER BY total_revenue DESC;

--Q17. Find the most expensive (MAX) and cheapest (MIN) product in each category. 
SELECT category , MAX(unit_price) AS most_expensive_category, MIN(unit_price) AS cheapest_category from products GROUP BY category;

--Q18. List all product categories where the average unit_price is greater than ₹2000. (Hint: Use HAVING clause) 
 SELECT category , AVG(unit_price) AS average_price FROM products GROUP BY category HAVING average_price > 2000;
 
 
--Section D — Joins & Relationships 


--Q19. Write an INNER JOIN query to display each order along with the customer's first_name and last_name. Show: order_id, order_date, first_name, last_name, total_amount. 
SELECT o.order_id ,o.order_date, c.first_name,c.last_name, o.total_amount FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

--Q20. Using a LEFT JOIN, list ALL customers and their orders (if any). Customers with no orders should still appear with NULL values for order columns. 
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.total_amount FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

--Q21. Write a query using JOINs across three tables (orders → order_items → products) to show: order_id, product_name, quantity, unit_price, and discount_pct for each order item. 
SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price, oi.discount_pct from  orders o INNER JOIN order_items oi ON o.order_id = oi.order_id INNER JOIN products p ON p.product_id = oi.product_id;
 
--Q22. Explain the difference between LEFT JOIN and RIGHT JOIN with an example from this schema. When would you use a FULL OUTER JOIN? 
/*
LEFT JOIN ::
It Returns:
-All rows from the left table
-Matching rows from the right table
-NULL values when no match exists
 * Example*/
SELECT c.customer_id,
       c.first_name,
       o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
/*
Result
All customers are shown.
Customers without orders will still appear.


RIGHT JOIN ::
It Returns:

-All rows from the right table
-Matching rows from the left table
-NULL values when no match exists

Example*/
SELECT c.customer_id,
       c.first_name,
       o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
/*

Result
All orders are shown.
Even if an order has no matching customer (hypothetically), it would still appear.

**Difference :
           LEFT JOIN	                              RIGHT JOIN
Returns all rows from left table	       Returns all rows from right table
Unmatched right rows become NULL	       Unmatched left rows become NULL
Most commonly used	                       Less commonly used


-When would you use FULL OUTER JOIN?
A FULL OUTER JOIN returns:

-All rows from the first table
-All rows from the second table
-Matching rows where possible
-NULL where no match exists

Example:
Customers without orders + Orders without customers
would both be displayed.

*/

--Q23. Identify all Foreign Key relationships in the schema. Explain what would happen if you tried to insert an order with customer_id = 999 (which doesn't exist in customers).
/* ANS :
*****Foreign Key Relationships******

-Relationship 1
orders.customer_id   references   customers.customer_id

Meaning:
One Customer → Many Orders

-Relationship 2

order_items.order_id   references   orders.order_id

Meaning:
One Order → Many Order Items

-Relationship 3

order_items.product_id   references    products.product_id

Meaning:
One Product → Many Order Items


ER Diagram Representation
customers
    |
    | customer_id
    |
    V
orders
    |
    | order_id
    |
    V
order_items
    ^
    |
    | product_id
    |
products

--What happens if we insert: */
INSERT INTO orders
VALUES(
1011,
999,
'2024-09-01',
'Pending',
1000
);/*

Result
MySQL will reject the insertion.

-Error
Cannot add or update a child row:
a foreign key constraint fails
Reason

Customer ID 999 does not exist in the customers table.

The Foreign Key:

FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)

ensures that every order must belong to an existing customer.
Therefore, MySQL prevents invalid references and maintains referential integrity.

*/




--Section E — Advanced Concepts (CASE, ACID, Transactions) 


/*Q24. Write a query using CASE to classify products into price tiers: 
  • 'Budget'    → unit_price < 1000 
  • 'Mid-Range' → unit_price BETWEEN 1000 AND 3000 
  • 'Premium'   → unit_price > 3000 
Display: product_name, unit_price, price_tier. */

SELECT product_name,
       unit_price,
       CASE
           WHEN unit_price < 1000 THEN 'Budget'
           WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
           ELSE 'Premium'
       END AS price_tier
FROM products;

--Q25. Using a CASE statement inside an aggregate function, count how many orders are 'Delivered' vs 'Not Delivered' (all other statuses). Display the result in a single row.
SELECT SUM(
    CASE
        WHEN status = 'Delivered' THEN 1
        ELSE 0
    END
) AS Delivered_Orders,
SUM(
    CASE
        WHEN status <> 'Delivered' THEN 1
        ELSE 0
    END
) AS Not_Delivered_Orders
FROM orders; 

/*Q26. Explain each letter of ACID: 
  • A – Atomicity 
  • C – Consistency 
  • I – Isolation 
  • D – Durability 
Give a real-world example (e.g., bank transfer) showing why each property is important. */
/*
ANS:

ACID properties ensure that database transactions are reliable, accurate, and secure.

*******A – Atomicity*******
Atomicity means "All or Nothing".
A transaction must complete fully or not execute at all.
-Example: Bank Transfer
Suppose ₹5000 is transferred from Account A to Account B.

Transaction:
Step 1: Deduct ₹5000 from Account A
Step 2: Add ₹5000 to Account B

If Step 1 succeeds but Step 2 fails:
 Money disappears.
Atomicity prevents this.
The entire transaction is rolled back.

******C – Consistency********
A transaction must move the database from one valid state to another valid state.
Database rules and constraints must always be maintained.

-Example
Suppose product price must be positive.
unit_price > 0
Trying to insert:
*/INSERT INTO products VALUES(209,'Headphones','Electronics','Sony',-50,100);/*
violates the constraint.
Consistency prevents invalid data from entering the database.

*******I – Isolation********
Multiple transactions should not interfere with each other.
Each transaction behaves as if it is running alone.

-Example
Suppose two customers attempt to purchase the last product in stock simultaneously.
Without Isolation:
Customer A buys item
Customer B buys item
Stock becomes negative.
Isolation prevents such conflicts.

********D – Durability**********
Once a transaction is committed, it remains permanently stored.
Even if the system crashes afterward.

-Example
After a successful bank transfer:
COMMIT;
The transaction is saved permanently.
Even if power fails immediately after the commit, the data remains intact.

*/

#Q27. Write a SQL transaction that does the following atomically: 
 START TRANSACTION;

-- 1. Insert a new order
INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

-- 2. Insert two order items
INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price, discount_pct) VALUES (5016, 1011, 202, 1, 799.00, 0), (5017, 1011, 208, 1, 599.00, 0);

-- 3. Update stock quantity
UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 202;

UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 208;

-- 4. Commit if everything succeeds
COMMIT;

-- If any statement fails before COMMIT,
-- execute:
ROLLBACK;

*/ROLLBACK;/*

Example:
START TRANSACTION;
*/INSERT INTO orders
VALUES(1011,102,CURDATE(),'Pending',1598.00);/*

-- Error occurs here
*/ROLLBACK;/*

Result:
Order is removed.
Order items are removed.
Stock updates are undone.
Database returns to its original state. */
