# SQL Functions and Queries Explained

This repository contains a detailed breakdown of SQL functions and queries across different types of operations, including database creation, table management, data manipulation, querying, and complex operations. Below are explanations of the SQL functions and queries used in the provided code:

---

### 1. **Data Definition Language (DDL)**

- **CREATE DATABASE**: Creates a new database (`CREATE DATABASE haneesha;`).
- **CREATE TABLE**: Defines a new table with columns and their data types (`CREATE TABLE students (std_id int, std_name varchar(10), age int);`).
- **ALTER TABLE**: Used to modify an existing table:
  - Add columns (`ALTER TABLE students ADD COLUMN std_email varchar(10);`).
  - Rename columns (`ALTER TABLE students RENAME COLUMN age TO std_age;`).
  - Drop columns (`ALTER TABLE students DROP COLUMN std_address;`).
  - Modify column type (`ALTER TABLE students MODIFY COLUMN std_email varchar(15);`).
  - Rename the table (`ALTER TABLE students RENAME TO student_info;`).
- **SHOW TABLES**: Lists all the tables in the database.
- **DROP TABLE**: Deletes an entire table (`DROP TABLE student_info;`).
- **TRUNCATE**: Removes all rows from a table without deleting the table structure (`TRUNCATE TABLE student_info;`).

---

### 2. **Data Manipulation Language (DML)**

- **INSERT**: Adds new rows to a table. Example:  
  ```sql
  INSERT INTO student_info (std_id, std_name, std_age, std_email) VALUES (1, 'haneesha', 23, 'haneesha@gmail');
  ```
- **UPDATE**: Modifies existing data in a table. Example:  
  ```sql
  UPDATE student_info SET std_name = 'sanoofa' WHERE std_id = 5;
  ```
- **DELETE**: Deletes rows from a table based on a condition. Example:  
  ```sql
  DELETE FROM student_info WHERE std_id = 5;
  ```

---

### 3. **Data Query Language (DQL)**

- **SELECT**: Retrieves data from a table. Examples:
  - Basic `SELECT` query:
    ```sql
    SELECT * FROM student_info;
    ```
  - Conditional `SELECT` with `WHERE` clause:
    ```sql
    SELECT * FROM department_info WHERE room_no = 200;
    ```

---

### 4. **Transactions Control Language (TCL)**

- **SAVEPOINT**: Sets a savepoint within a transaction to which you can roll back later (`SAVEPOINT x;`).
- **COMMIT**: Saves the changes made in the transaction permanently (`COMMIT;`).
- **ROLLBACK**: Reverts changes made after a savepoint (`ROLLBACK TO x;`).

---

### 5. **Data Control Language (DCL)**

- **GRANT**: Provides specific privileges to users.
- **REVOKE**: Removes privileges granted to users.

---

### 6. **SQL Operators**

- **Arithmetic Operators**: Used for performing arithmetic operations:
  ```sql
  SELECT employee_id, salary * 1.10 AS 'salary_bonus' FROM employees;
  ```
- **Logical Operators**: Used to combine multiple conditions:
  ```sql
  SELECT * FROM employees WHERE department = 'Sales' AND active = TRUE;
  ```
- **Special Operators**: Used for advanced filtering:
  - `IN`, `NOT IN`, `BETWEEN`, `NOT BETWEEN`, `LIKE`, `IS NULL`:
    ```sql
    SELECT * FROM employees WHERE department IN ('IT', 'Sales');
    SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;
    ```
- **Set Operators**: Combine the results of two queries:
  - `UNION`, `INTERSECT`, `EXCEPT`:
    ```sql
    SELECT customer_name FROM customers
    UNION
    SELECT product_name FROM products;
    ```

---

### 7. **SQL Functions**

- **Aggregate Functions**: Perform calculations on a set of values and return a single result:
  - `SUM()`, `MAX()`, `MIN()`, `AVG()`, `COUNT()`:
    ```sql
    SELECT SUM(salary) AS total_salary FROM employees;
    SELECT MAX(salary) AS max_salary FROM employees;
    ```
- **String Functions**: Work with text data:
  - `CONCAT()`, `LENGTH()`, `DISTINCT`:
    ```sql
    SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
    ```
- **Date Functions**: Perform operations on date values:
  - `DATEDIFF()`, `YEAR()`, `MONTHNAME()`, `DATE_ADD()`, `DATE_SUB()`:
    ```sql
    SELECT DATEDIFF(CURDATE(), hire_date) AS days_since_joined FROM employees;
    ```
- **Ranking Functions**: Assign ranks based on conditions:
  - `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`:
    ```sql
    SELECT employee_id, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_no FROM employees;
    ```
- **Value Functions**: Access data relative to the current row:
  - `LAG()`, `LEAD()`, `FIRST_VALUE()`, `LAST_VALUE()`:
    ```sql
    SELECT employee_id, salary, LAG(salary, 1) OVER (ORDER BY salary DESC) AS previous_salary FROM employees;
    ```

---

### 8. **Joins**

- **INNER JOIN**: Returns only matching rows from both tables.
  ```sql
  SELECT * FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id;
  ```
- **LEFT JOIN (OUTER JOIN)**: Returns all rows from the left table and matching rows from the right table.
  ```sql
  SELECT * FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id;
  ```
- **RIGHT JOIN (OUTER JOIN)**: Returns all rows from the right table and matching rows from the left table.
  ```sql
  SELECT * FROM orders RIGHT JOIN customers ON orders.customer_id = customers.customer_id;
  ```
- **FULL OUTER JOIN**: Combines the results of both LEFT JOIN and RIGHT JOIN.
  ```sql
  SELECT * FROM customers FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id;
  ```

---

### 9. **Views**

- **Simple View**: A virtual table that provides a simplified query interface.
  ```sql
  CREATE VIEW employee_view AS SELECT concat(first_name, ' ', last_name) AS full_name FROM employees;
  ```
- **Complex View**: May include joins or subqueries.
- **Managing Views**: Add, delete, and update records via views with proper privileges.

---

### 10. **Stored Procedures**

- **Creating a Stored Procedure**: A stored procedure is a set of SQL queries that are saved and can be executed repeatedly.
  ```sql
  CREATE PROCEDURE employee_with_large_salary()
  SELECT * FROM employees WHERE salary >= 50000;
  ```

---

This README provides an overview of SQL operations ranging from basic to advanced functions. Each SQL function and query has been explained with examples to help users understand how to apply them in various use cases.
