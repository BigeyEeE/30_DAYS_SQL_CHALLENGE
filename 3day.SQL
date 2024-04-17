-- DAY-3

-- DDL for Salaries table
CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

-- DML for Salaries table
INSERT INTO Salaries (emp_name, 
					  department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);



/*
Write an SQL query to calculate the difference 
between the highest salaries 
in the marketing and engineering department. 
Output the absolute difference in salaries.
*/

SELECT * FROM Salaries;
-- ----------------------------------------------
-- My solution
-- ----------------------------------------------


SELECT ABS(MAX(CASE WHEN DEPARTMENT = 'Marketing' THEN SALARY END) -
           MAX(CASE WHEN DEPARTMENT = 'Engineering' THEN SALARY END)) AS SALARY_DIFF
FROM SALARIES;


-- OTHER WAY

SELECT 
    ABS(m.SALARY - e.SALARY) AS SALARY_DIFF
FROM 
    (SELECT MAX(SALARY) AS SALARY FROM SALARIES WHERE DEPARTMENT = 'Marketing') AS m,
    (SELECT MAX(SALARY) AS SALARY FROM SALARIES WHERE DEPARTMENT = 'Engineering') AS e;



---------------------------------------------------------------------------------------------



-- Q2	
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    age INT,
    gender VARCHAR(10)
);
DROP TABLE ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Insert values into the customers table
INSERT INTO customers (customer_id, customer_name, age, gender)
VALUES
    (1, 'John Doe', 30, 'Male'),
    (2, 'Jane Smith', 25, 'Female'),
    (3, 'Alice Johnson', 35, 'Female'),
    (4, 'Bob Brown', 40, 'Male');

-- Insert values into the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-15', 150.50),
    (102, 2, '2022-02-20', 200.25),
    (103, 3, '2023-03-10', 180.75),
    (104, 4, '2023-04-05', 300.00),
    (105, 1, '2022-05-12', 175.80),
    (106, 2, '2021-06-18', 220.40),
    (107, 3, '2023-07-22', 190.30),
    (108, 4, '2023-08-30', 250.60),
	(109, 4, '2021-08-30', 250.60),
	(110, 4, '2024-01-30', 250.60),
	(111, 4, '2023-08-30', 250.60);;


/* IBM Data Analyst SQL Question
Q.1
Customer Segmentation Problem:
You have two tables: customers and orders.

customers table has columns: 
  customer_id, customer_name, age, gender.
orders table has columns: 
order_id, customer_id, order_date, total_amount.


Write an SQL query to find the average order amount 
for male and female customers separately
return the results with 2 DECIMAL.
*/

-- ----------------------------------------------
-- My solution
-- ----------------------------------------------

SELECT C.GENDER,
       CAST(AVG(O.total_amount)AS NUMERIC (10,2)) AS average_order_amount
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY 1
ORDER BY 1 DESC
