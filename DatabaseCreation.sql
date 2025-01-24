CREATE SCHEMA capstone_project;
USE capstone_project;

-- table name sales transactions
CREATE TABLE Sales_Transactions(
invoice_id VARCHAR(30) NOT NULL,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10, 2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6, 4) NOT NULL,
total DECIMAL(10, 2)NOT NULL,
dates DATE NOT NULL,
times TIME NOT NULL,
payment_Method VARCHAR(30) NOT NULL,
cogs DECIMAL(10, 2) NOT NULL,
gross_margin_percentage FLOAT(11, 9) NOT NULL,
gross_income DECIMAL(10, 2) NOT NULL,
rating FLOAT(2, 1) NOT NULL
);

SET SQL_SAFE_UPDATES = 0;
-- ------------------------------------------- Feature Engineering ---------------------------------------------------------
/*  
 * Add a new column named timeofday to give insight of sales in the Morning, Afternoon and Evening. 
   This will help answer the question on which part of the day most sales are made.
 * Add a new column named dayname that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri).
   This will help answer the question on which week of the day each branch is busiest.
 * Add a new column named monthname that contains the extracted months of the year on which the given transaction took place
   (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
 */

ALTER TABLE sales_transactions
ADD COLUMN timeofday VARCHAR(30);

UPDATE sales_transactions
SET timeofday = CASE
	WHEN HOUR(times) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN HOUR(times) BETWEEN 12 AND 17 THEN 'Afternoon'
    WHEN HOUR(times) BETWEEN 18 AND 21 THEN 'Evening'
    ELSE 'Night'
END;

ALTER TABLE sales_transactions
ADD COLUMN dayoftheweek VARCHAR(30);

UPDATE sales_transactions
SET dayoftheweek = DAYNAME(dates);

ALTER TABLE sales_transactions
ADD COLUMN month_name VARCHAR(30);

UPDATE sales_transactions
SET month_name = MONTHNAME(dates)

  
 