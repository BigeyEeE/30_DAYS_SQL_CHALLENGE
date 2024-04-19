/*
Q.2 You have been given a table named sales with the following columns:

order_id (unique identifier for each order)
order_date (date when the order was placed)
product_id (unique identifier for each product)
quantity (the quantity of the product ordered in that particular order)
price_per_unit (the price per unit of the product)

Write an SQL query to find out the total sales revenue generated for each month in the year 2023.
*/




-- Create the sales table
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2)
);

-- Insert sample values into the sales table
INSERT INTO sales (order_id, order_date, product_id, quantity, price_per_unit)
VALUES
    (1, '2022-03-10', 101, 2, 15.00),
    (2, '2022-04-05', 102, 1, 25.50),
    (3, '2023-01-15', 103, 3, 10.75),
    (4, '2023-02-20', 104, 2, 30.20),
    (5, '2022-05-12', 105, 4, 12.80),
    (6, '2023-06-18', 106, 2, 22.40),
    (7, '2023-07-22', 107, 1, 45.30),
    (8, '2021-08-30', 108, 3, 20.60);


/*
Q.2 You have been given a table named sales with the following columns:

order_id (unique identifier for each order)
order_date (date when the order was placed)
product_id (unique identifier for each product)
quantity (the quantity of the product ordered in that particular order)
price_per_unit (the price per unit of the product)

Write an SQL query to find out the total sales revenue generated for each month in the year 2023.
*/

-- extract(month from order_date) as month
-- extract(year from order_date) as year for 2023
-- group by months



-- ----------------------------------------------
-- My solution
-- ----------------------------------------------

SELECT * FROM ORDERS

SELECT 
    SUM(PRICE_PER_UNIT * QUANTITY) AS TOTAL_SALE_REVENUE,
    EXTRACT(MONTH FROM ORDER_DATE) AS MONTH,
    EXTRACT(YEAR FROM ORDER_DATE) AS YEAR
FROM 
    SALES
WHERE 
    EXTRACT(YEAR FROM ORDER_DATE) = 2023
GROUP BY 
    EXTRACT(MONTH FROM ORDER_DATE),
    EXTRACT(YEAR FROM ORDER_DATE)
ORDER BY 
    EXTRACT(MONTH FROM ORDER_DATE) DESC;
