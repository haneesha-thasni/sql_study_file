CREATE DATABASE haneesha;
USE haneesha;
create table students (std_id int,std_name varchar(10),age int);
show tables;
alter table students add column std_email varchar(10);
-- alter
/* multiple sentence comment */
alter table students add column std_address varchar(20);
ALTER table students rename column age to std_age;
alter table students drop column std_address;
alter table students modify column std_email varchar(15);
select * from students;
alter table students rename to student_info;

-- drop
-- drop table student_info;

-- TRUNCATE
-- truncate table student_info;

/* DML
1. INSERT
2. UPDATE
3. DELETE
*/

select * from student_info;
insert into student_info (std_id,std_name,std_age,std_email)values (1,'haneesha',23,'haneesha@gmail');
insert into student_info (std_id,std_name,std_age,std_email) values (2,'fabina',25,'fabina@gmail'),(3,'mikhthad',22,'mikku@gmail'),(4,'ridha',21,'ridha@gmail'),(5,'sana',21,'sana@gmail');
select * from student_info;
update student_info set std_name='sanoofa' where std_id=5;
select * from student_info;
delete from student_info where std_id=5;
select * from student_info;

create table department_info (dpt_id int primary key, dpt_name varchar(10) not null);
show tables;

create table staff_info (staff_id int, 
	staff_name varchar(10) not null, 
	primary key (staff_id), 
    dpt_id int,
    CONSTRAINT fk_dpt_id FOREIGN KEY (dpt_id) REFERENCES department_info (dpt_id)
);
show tables;

/* DQL ( Data Query Language )
1. SELECT
*/
select *  from student_info;
select std_id,std_name from student_info;
select std_id,std_email from student_info;
alter table department_info add column room_no int;
insert into department_info (dpt_id,dpt_name,room_no) values (1,'DA' ,200),(2,'DS',201),(3,'FLUTTER',202),(4,'PYTHON',203),(5,'DJANGO',204);
SELECT * FROM department_info;
select dpt_name from department_info;
select * from department_info where room_no=200;
insert into department_info (dpt_id,dpt_name,room_no) values (6,'DA',205),(7,'FLUTTER',206),(8,'DA',207),(9,'DS',208),(10,'DA',209);
SELECT * from department_info;
select * from department_info where dpt_name='DS';
select * from student_info where std_age in (23,22);
select * from student_info;
select * from student_info where std_age > 23;
insert into staff_info (staff_id,staff_name,dpt_id) values (1,'nayana',1),(2,'asif',2),(3,'theertha',3),(4,'nisam',2);
insert into staff_info (staff_id,staff_name,dpt_id) values (5,'neethu',7),(6,'dilshad',5),(7,'sreekanth',4),(8,'jithin',3),(9,'aslam',10),(10,'aysha',6);
select * from staff_info;
insert into staff_info (staff_id,staff_name,dpt_id) values (8,'jithin',3);

/* TCL(Transaction Control Language)
 1. SAVEPOINT
 2. COMMIT
 3. ROLLBACK
 */

select * from staff_info;
begin;
SAVEPOINT x;

delete from staff_info where staff_id=5;
ROLLBACK to x;
commit ;
select * from staff_info;

/* DCL (Data Control Language)
 1. REVOKE
 2. GRAND
 */
 
CREATE TABLE employees(
employee_id int PRIMARY KEY,
first_name varchar(15),
last_name varchar(10),
department varchar(10),
salary decimal(10,2),
hire_date date,
email varchar(100),
active boolean
);
insert into employees (employee_id,first_name,last_name,department,salary,hire_date,email,active) values (1, 'John', 'Doe', 'Sales', 55000.00, '2018-07-15', 'john.doe@example.com', TRUE),
(2, 'Jane', 'Smith', 'Marketing', 62000.50, '2019-04-22', 'jane.smith@example.com', TRUE),
(3, 'Michael', 'Brown', 'HR', 48000.00, '2020-10-10', 'michael.brown@example.com', FALSE),
(4, 'Emily', 'Davis', 'IT', 71000.00, '2017-02-05', 'emily.davis@example.com', TRUE),
(5, 'Chris', 'Wilson', 'Finance', 85000.00, '2021-06-18', 'chris.wilson@example.com', TRUE),
(6, 'Sophia', 'Lee', 'Sales', 46000.00, '2016-11-30', 'sophia.lee@example.com', FALSE),
(7, 'David', 'Johnson', 'IT', 67000.00, '2018-09-25', 'david.johnson@example.com', TRUE),
(8, 'Emma', 'Garcia', 'Marketing', 58000.25, '2022-01-19', 'emma.garcia@example.com', TRUE),
(9, 'Daniel', 'Martinez', 'HR', 49500.00, '2020-03-17', 'daniel.martinez@example.com', TRUE),
(10, 'Ava', 'Rodriguez', 'Finance', 93000.00, '2015-05-11', 'ava.rodriguez@example.com', FALSE);

-- ARITHMETIC OPERATORS
-- employees who are salary grater than 65000?
select * from employees where salary>65000;

-- print the name of the employee whose email is david.johnson@example.com?
select first_name, last_name from employees where email='david.johnson@example.com';

-- print the employees whose are in IT and Finance department?
select * from employees where department IN ("IT","Finance");

-- print the employees whose salary is not 55000?
select * from employees where salary !=55000;

select employee_id,salary, salary*1.10 as 'salary_bonus' from employees;
select employee_id,salary, salary+500 as 'salary_increment' from employees;

-- LOGICAL OPERATORS
select * from employees where department='Sales' and active=True;
select * from employees where department='IT' or active=True;
select * from employees where department='IT' or salary>70000;
select * from employees where department="HR" or department="Finance";
select * from employees where not department='Sales';
select * from employees where not department='Finance' and salary>60000;

/* SPECIAL OPERATORS
1. IN
2. NOT IN
3. BETWEEN
4. NOT BETWEEN
5. IS NULL
6. IS NOT NULL
7. LIKE
8. NOT LIKE
9. AS
10. DISTINCT
11. ANY
12. EXISTS
*/

SELECT * from employees where department IN('IT',"Sales","Marketing");
select * from employees where department NOT IN("IT","Sales","Marketing");
select * from employees where salary BETWEEN 55000 and 80000;
select * from employees where salary NOT BETWEEN 60000 AND 70000;
SELECT * FROM employees where email is NULL;
select * from employees where salary IS NOT NULL;
select * from employees where last_name LIKE 'D%';
select * from employees where first_name NOT LIKE '%a';
select * from employees where first_name LIKE '%n%';
select * from employees where last_name LIKE 'd_%';
select * from employees where first_name LIKE 'S_%';
select * from employees where first_name LIKE 'j__%';
SELECT first_name AS "First Name",last_name AS"Last Name" from employees;
select DISTINCT employee_id,department,salary from employees;
select DISTINCT department from employees;

SELECT concat(first_name," ",last_name)full_name,salary from employees;
select length("Hello world");
select count(employee_id) from employees;

select hire_date,adddate(hire_date,7) future_date from employees;
select hire_date, subdate(hire_date,4) order_date from employees;
select hire_date, date_add(hire_date,interval 7 day)future_date from employees;
select hire_date, date_sub(hire_date,interval 3 day)order_date from employees;
select datediff(curdate(),hire_date) as day_since_joined from employees;
select first_name,hire_date,year(hire_date) hired_year from employees;
select first_name,hire_date,month(hire_date) hired_month from employees;
select first_name,hire_date,monthname(hire_date) hired_month_name from employees;
select first_name,hire_date,day(hire_date) hired_day from employees;
select first_name,hire_date,dayname(hire_date) hired_day_name from employees;

select sum(salary) total_salary from employees;
select max(salary) maximum_salary from employees;
select min(salary) minimum_salary from employees;
select avg(salary) average_salary from employees;
select count(salary) count_salary from employees;

SELECT salary,first_name from employees where salary>ANY(select salary from employees where salary in (50000,60000,70000));
select salary,first_name from employees where salary>ANY(select salary from employees where department="Marketing");
select * from employees; 

-- CANDIDATE WHO HAVE A PLACMENT STATUS IS PLACED AND BELONG TO THE COMPUTER SCIENCE STREAM
select name,stream,college_name,placement_status from job_placement jp where exists(select 1 from job_placement where jp.placement_status ="Placed" and stream="Computer Science" and jp.stream=stream);

-- join
	-- 1.inner join
	-- 2. outer join
    -- 3.cross join
    -- 4.self join
    
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);


INSERT INTO Customers (customer_id, customer_name, country)
VALUES 
    (1, 'Alice', 'USA'),
    (2, 'Bob', 'Canada'),
    (3, 'Charlie', 'UK'),
    (4, 'David', 'Australia'),
    (5, 'Eve', 'India');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES 
    (101, 1, 1001, '2024-01-15', 2),
    (102, 2, 1002, '2024-02-10', 1),
    (103, 1, 1003, '2024-02-15', 1),
    (104, 4, 1001, '2024-03-05', 3),
    (105, 5, 1004, '2024-03-12', 2),
    (106, NULL, 1005, '2024-03-15', 1);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO Products (product_id, product_name, price)
VALUES 
    (1001, 'Laptop', 1200.00),
    (1002, 'Smartphone', 800.00),
    (1003, 'Tablet', 600.00),
    (1004, 'Smartwatch', 200.00),
    (1005, 'Headphones', 150.00);
    
-- inner join
-- Find all customers who have placed an order. Show each customer's name product id  and the order ID?    
select customers.customer_id,customers.customer_name,orders.order_id
from customers inner join orders 
on customers.customer_id=orders.customer_id;
 
-- Get a list of product names and the order ID where they were ordered?
 select p.product_id,p.product_name,o.quantity
 from products as p inner join orders as o
 on p.product_id=o.product_id;
 
 -- Retrieve each customer’s name along with the product they ordered?
 select p.product_name,c.customer_name from products as p inner join orders as o on  p.product_id=o.product_id
 inner join customers as c on o.customer_id=c.customer_id;
 
 
 -- outer join
	-- left join
 -- Show all customers and their order IDs, including customers who have not placed any orders.
 select customers.customer_name,orders.order_id from customers left join orders on customers.customer_id=orders.customer_id; 
 
 select products.product_name,orders.order_id from products left join orders on products.product_id=orders.product_id;
 
 -- List all orders and the customer names associated with them, including any orders without a customer.
 select orders.order_id,customers.customer_name from orders right join customers on orders.customer_id=customers.customer_id;
 
 select products.product_name,orders.order_id from products right join orders on products.product_id=orders.product_id;
 
 -- outer join
 -- Get a list of all customers and orders, showing all customers and all orders, even if they don’t match.
select c.customer_name, o.order_id
FROM Customers c FULL OUTER JOIN orders o on c.customer_id=o.customer_id ; 

-- MySQL or another database that doesn’t support FULL OUTER JOIN, you can simulate it with a combination of LEFT JOIN and RIGHT JOIN using UNION
 select customers.customer_id,orders.order_id from customers left join orders on orders.customer_id=customers.customer_id
 union
 select customers.customer_id,orders.order_id from orders right join customers on orders.customer_id=customers.customer_id;
 
 -- cross join
 select * from customers cross join orders;
 
 
 
 -- SET OPERATORS
	-- UNIQUE
    -- INTERSECT
    -- EXCEPT
    -- UNIQUE ALL

-- Get a unique list of all customer names and all product names.    
select customer_name as name from customers
UNION
select product_name as name from products;

select customer_id from customers
union all
select customer_id from orders;

-- Find any customer_ids that exist in both the Customers and Orders tables.
select customer_id from customers
intersect
select customer_id from orders;

-- List customer_ids of customers who have not placed any orders.
select customer_id from customers
except
select customer_id from orders;

-- 	SQL CONSTRAINTS
	-- NOT NULL
create table staff(id int primary key,first_name varchar(10) not null,last_name varchar(10) not NULL,email varchar(15));
insert into staff(id,first_name,last_name,email) values (1,"adil","muhammed","adil@gmail.com"),(2,"","sinan","sinan@gmail.com");
select * from STAFF;

-- AUTO_INCREMENT
create table CUSTOMER_MALL(id int AUTO_INCREMENT PRIMARY key,first_name varchar(10) not null,last_name varchar(10) not NULL,email varchar(15));
INSERT INTO CUSTOMER_MALL(FIRST_NAME,LAST_NAME,EMAIL) VALUES ("ASNA","SHERIN","ASNA@GMAIL.COM"),("ANAS","MON","ANAS@GMAIL.COM"),("SUKOR","AHMAD","SUKUR@GMAIL.COM");
SELECT * FROM CUSTOMER_MALL;


	-- UNIQUE CONSTRAINTS
create table instagram_users(id int AUTO_INCREMENT	primary key,user_name varchar(15) unique,pass_word varchar(8) unique);
insert into instagram_users(user_name,pass_word) values ("haneesha","hanrizz"),("haneesha","heisan");
-- we get error due to duplicate entry, because user_name,pass_word are unique
insert into instagram_users(user_name,pass_word) values("riyas","yraz"),("mikhthad","mikku"),("nayana","nayans");
select * from instagram_users;

	-- PRIMARY KEY
create table order_detail(shop_id int AUTO_INCREMENT primary key,shop_owner varchar(20) unique);
insert into order_detail(shop_owner) values("haneesha"),("nayana"),("fabina");
alter table order_detail add column sales int ;
insert into order_detail(sales) values (123),(345),(678);
select * from order_detail;

	--  FOREIGN KEY
create table customer_detail(customer_id int AUTO_INCREMENT primary key,customer_name varchar(20) unique);
create table order_details(order_id INT AUTO_INCREMENT PRIMARY KEY, order_date DATE NOT NULL,customer_id INT,FOREIGN KEY(customer_id) REFERENCES customer_detail(customer_id));

	-- CHECK 
CREATE TABLE cosmetics(order_id INT AUTO_INCREMENT PRIMARY KEY,product_name varchar(100) NOT NULL,price DECIMAL(10,2) CHECK(price>0));

	-- DEFAULT
CREATE TABLE employees_details(id INT AUTO_INCREMENT PRIMARY KEY,name_employee varchar(100) NOT NULL,email varchar(100) Not null,salary int DEFAULT 10000);

-- ADDING CONSTRAINTS TO EXISTING TABLE
ALTER TABLE employees_details ADD CONSTRAINT unique_email UNIQUE(email);


-- INDEXING
CREATE INDEX name_employee_indexing ON employees_details(name_employee);
show index from employees_details;

-- WINDOWS FUNCTIONS
	-- ROW_NUMBER()
SELECT * from employees;
insert into employees(employee_id,first_name,last_name,department,salary,hire_date,email,active)
values (11,"haneesha","Thasni","Finance",85000,"2021-06-19","haneesha@gmail.com",1),(12,"fabina","thasni","Finance",70000,"2021-07-21","fabina@gmail.com",0);
select employee_id,first_name,department,salary,ROW_NUMBER() OVER (PARTITION BY department Order by salary desc) as row_no from employees;

	-- RANK()
select employee_id,first_name,department,salary,RANK() OVER (PARTITION BY department ORDER BY salary desc)as row_no from employees;


create table student (std_id int AUTO_INCREMENT primary key,std_name varchar(20),class char(1),subjects varchar(10),mark int);
insert into student(std_name,class,subjects,mark) values("Haneesha","A","Maths",100),("Mikhthad","B","Physics",90),
("fabina","C","chemistry",80),("nayana","A","physics",98),("shifna","B","Maths",50),("rizvi","A","chemistry",100),
("Haneesha","A","physics",50),("mikhthad","B","Maths",99),("Fabina","C","physics",40),("Nayana","A","Maths",53);
select * from student;
select std_id,std_name,class,subjects,mark,rank() over(partition by subjects order by mark desc)as rank_of_students from student;
select *,ROW_NUMBER() over(partition by class)as roll_no from student;
select *,rank() over(partition by class order by mark desc) as rank_class from student;

	-- DENSE_RANK()
select *,DENSE_RANK() OVER(PARTITION BY class ORDER BY mark desc) as rank_student from student;
select *,DENSE_RANK() OVER(PARTITION BY department ORDER BY salary desc) as salary_rank from employees;
	
    -- AGGREGATE FUNCTIONS- MIN()/MAX()/AVG()/SUM()
select *,MAX(mark) OVER(PARTITION BY subjects ORDER BY mark desc) as max_mark from student;
select *,MIN(mark) OVER(PARTITION BY subjects) as min_mark from student;
select *,AVG(mark) OVER(PARTITION BY subjects) as average_mark from student;
select *,SUM(mark) OVER(PARTITION BY std_name) as total_mark from student;

	-- VALUE FUNCTIONS- LAG()/LEAD()/FIRST_VALUE()/LAST_VALUE()/NTH_VALUE()
SELECT employee_id,first_name,department,salary,LAG(salary,1,0) OVER(PARTITION BY department ORDER BY salary desc)as previous_salary from employees;
select *,lag(mark,1,0) over(PARTITION BY subjects ORDER BY mark desc) as previous_mark from student;
select *,lead(mark,1,0) over(PARTITION BY subjects ORDER BY mark desc) as future_mark from student;
select employee_id,first_name,department,salary,lead(salary,1,0) over(PARTITION BY department ORDER BY salary desc)as future_salary from employees;
select *,FIRST_VALUE(mark) over(PARTITION BY subjects)as first_mark from student;
select employee_id,first_name,department,salary,FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary desc)as first_salary from employees;
select *,LAST_VALUE(mark) over(PARTITION BY subjects RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)as last_mark from student;
select employee_id,first_name,department,salary,LAST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary desc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
 as last_salary from employees;
select *,NTH_VALUE(mark,2) OVER(PARTITION BY subjects ORDER BY mark desc RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as second_mark from student;


-- 	VIEWS
	-- 1. SIMPLE VIEW
    -- 2. COMPLEX VIEW
select * from employees;
CREATE VIEW employee_view AS SELECT concat(first_name," ",last_name) full_name,department,salary from employees;
select * from employee_view;
select * from employee_view where department="sales";
CREATE VIEW finance_view AS select * from employees;
select * from finance_view;
-- ADD NEW RECORDS TO A VIEW
insert into finance_view(employee_id,first_name,last_name,department,salary,hire_date,email,active) values(13,"mikhthad","muhammed","IT",45000,"2024-11-12","mikhthad@gmail.com",1);
select * from finance_view;
-- DELETE A RECORD FROM THE ORIGINAL DATA- "IT WILL EFFECT THE VIEW"
delete from employees where employee_id=12;
select * from finance_view;
select * from employees;
-- DROP  A VIEW
 drop view employee_view;
 -- UPDATE A VIEW
 update employee_view set salary=90000 where employee_id=11;
 
 
-- STORED PROCEDURES
CREATE PROCEDURE employee_with_large_salary()
select * from employees where salary>=50000;
CALL employee_with_large_salary();
create procedure employee_dpt_finance()
select * from employees where department="Finance";
call employee_dpt_finance();

-- MULTIPLE QUERY CASES  -- DELIMITER
delimiter $$
CREATE PROCEDURE employee_with_high_salary_finance()
BEGIN
	select * from employees where salary>=50000;
    select * from employees where department="Finance";
END $$
delimiter ;
call employee_with_high_salary_finance();

delimiter //
CREATE PROCEDURE employee_salary_sales()
BEGIN
	select * from employees where salary>60000;
    select * from employees where department="sales";
END //
delimiter ;
call employee_salary_sales();

-- ADD PARAMETER
delimiter $$
CREATE PROCEDURE employee_with_id(id INT)
BEGIN
	select * from employees where employee_id=id;
END $$
delimiter ;
CALL employee_with_id(4);
call employee_with_id(11);
