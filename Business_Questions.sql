
-- ------------------------------------------------- Business Questions --------------------------------------------------------------

-- 1. What is the count of distinct cities in the dataset?
SELECT 
	COUNT(distinct city) AS No_Of_cities 
FROM sales_transactions; 

-- 2. For each branch, what is the corresponding city?
SELECT
	DISTINCT branch, 
    city
FROM sales_transactions;

-- 3. What is the count of distinct product lines in the dataset?
SELECT 
	COUNT(DISTINCT product_line) AS unique_productlines 
FROM sales_transactions;

-- 4. Which payment method occurs most frequently?
SELECT 
	DISTINCT payment_method, 
			 COUNT(payment_method) AS noOfTimesUsed 
FROM sales_transactions
GROUP BY payment_method
ORDER BY count(payment_method) DESC;

-- 5.Which product line has the highest sales?
SELECT 
	DISTINCT product_line, 
       SUM(total) AS total_sales
FROM sales_transactions
GROUP BY product_line
ORDER BY count(total) DESC;

-- 6. How much revenue is generated each month?
SELECT 
	DISTINCT month_name, 
    SUM(total) AS revenue
FROM sales_transactions
GROUP BY month_name;

-- 7. In which month did the cost of goods sold reach its peak?
SELECT 
	DISTINCT month_name, 
	SUM(cogs) AS totalCostOfGoods 
FROM sales_transactions
GROUP BY month_name
ORDER BY SUM(cogs) DESC;

-- 8. Which product line generated the highest revenue?
SELECT 
	DISTINCT product_line, 
    SUM(total) AS revenue
FROM sales_transactions
GROUP BY product_line
ORDER BY SUM(total) DESC;

-- 9. In which city was the highest revenue recorded?
SELECT 
	DISTINCT city, 
	SUM(total) AS revenue
FROM sales_transactions
GROUP BY city
ORDER BY SUM(total) DESC;

-- 10. Which product line incurred the highest Value Added Tax?
SELECT
	DISTINCT product_line, 
	SUM(VAT) AS total_VAT
FROM sales_transactions
GROUP BY product_line
ORDER BY SUM(VAT) DESC;

-- 11. For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
SELECT
	product_line,
    SUM(total) AS revenue,
    CASE
		WHEN SUM(total) > (SELECT AVG(revenue)
						   FROM (SELECT 
									product_line, 
                                    SUM(total) AS revenue
								 FROM sales_transactions
                                 GROUP BY product_line) AS avg_sales_table)
         THEN 'Good'
         ELSE 'Bad'
	 END AS sales_performance
FROM sales_transactions
GROUP BY product_line;

-- 12. Identify the branch that exceeded the average number of products sold.
SELECT DISTINCT branch,
       SUM(quantity) AS total_quantity,
           (SELECT AVG(total_quantity)
            FROM (
                  SELECT branch, SUM(quantity) AS total_quantity
                  FROM sales_transactions
                  GROUP BY branch
                 ) AS avg_branch_sales) AS avg_total_quantity
FROM sales_transactions
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(total_quantity)
                       FROM (SELECT branch, SUM(quantity) AS total_quantity
							 FROM sales_transactions
                             GROUP BY branch) AS avg_branch_sales);

-- 13. Which product line is most frequently associated with each gender?
WITH GenderProductLineCount AS (
    SELECT 
        gender,
        product_line,
        COUNT(*) AS product_line_count
    FROM 
        sales_transactions
    GROUP BY 
        gender, product_line
)
SELECT 
    gender,
    product_line,
    product_line_count
FROM 
    (
        SELECT 
            gender,
            product_line,
            product_line_count,
            ROW_NUMBER() OVER (PARTITION BY gender ORDER BY product_line_count DESC) AS row_num
        FROM 
            GenderProductLineCount
    ) AS ranked
WHERE 
    row_num = 1;     
    
-- 14. Calculate the average rating for each product line.
SELECT
	product_line, 
    AVG(rating) AS average_rating
FROM sales_transactions 
GROUP BY product_line;

-- 15. Count the sales occurrences for each time of day on every weekday.
SELECT
	dayoftheweek,
	timeofday,
    COUNT(*) AS sales_count
FROM sales_transactions
GROUP BY dayoftheweek,timeofday
ORDER BY dayoftheweek,timeofday;
-- 16. Identify the customer type contributing the highest revenue.
select customer_type, sum(total) as revenue
from sales_transactions
group by customer_type
order by sum(total) desc;

-- 17. Determine the city with the highest VAT percentage.
SELECT city,
       MAX(VAT) AS max_VAT_percentage
FROM sales_transactions
GROUP BY city
ORDER BY MAX(VAT) DESC;
-- 18. Identify the customer type with the highest VAT payments.
SELECT 
	customer_type, 
    MAX(VAT) AS max_VAT_payment
FROM sales_transactions
GROUP BY customer_type
ORDER BY MAX(VAT) DESC;
-- 19. What is the count of distinct customer types in the dataset?
SELECT 
	COUNT(DISTINCT customer_type) AS unique_cust_type_no
FROM sales_transactions;

-- 20. What is the count of distinct payment methods in the dataset?
SELECT 
	COUNT(DISTINCT payment_Method) AS unique_PaymentMethod_no
FROM sales_transactions;

-- 21.Which customer type occurs most frequently?
SELECT
	customer_type,
	COUNT(*) AS cust_type_count
FROM sales_transactions
GROUP BY customer_type
ORDER BY count(*) DESC;

-- 22. Identify the customer type with the highest pur frochase frequency.
SELECT
	customer_type,
    COUNT(*) AS purchase_frequency
FROM sales_transactions
GROUP BY customer_type
ORDER BY COUNT(*) desc;
-- 23. Determine the predominant gender among customers.
SELECT
	gender,
    COUNT(*) AS gender_count
FROM sales_transactions
GROUP BY gender
ORDER BY COUNT(*) DESC;
-- 24. Examine the distribution of genders within each branch.
SELECT
	branch, 
    gender,
    COUNT(*) AS gender_count
FROM sales_transactions
GROUP BY branch, gender 
ORDER BY branch, gender DESC;
-- 25. Identify the time of day when customers provide the most ratings.
SELECT 
	timeofday,
    COUNT(rating) AS rating_count
FROM sales_transactions
GROUP BY timeofday
ORDER BY COUNT(rating) DESC;
-- 26. Determine the time of day with the highest customer ratings for each branch.
SELECT 
	timeofday,
    branch,
    COUNT(rating) AS rating_count
FROM sales_transactions
GROUP BY timeofday, branch
ORDER BY COUNT(rating) DESC;
-- 27. Identify the day of the week with the highest average ratings.
SELECT 
    day_of_week, 
    avg_rating,
    ranks
FROM (
    SELECT 
        DAYNAME(dates) AS day_of_week, 
        AVG(rating) AS avg_rating, 
        RANK() OVER (ORDER BY AVG(rating) DESC) AS ranks
    FROM 
        sales_transactions
    GROUP BY 
        DAYNAME(dates)
) ranked_avg_ratings;
-- 28. Determine the day of the week with the highest average ratings for each branch.
SELECT
	branch, 
    dayoftheweek, 
    avg_rating,ranks
FROM (SELECT  	
		  branch, 
          dayoftheweek, 
          AVG(rating) AS avg_rating,
          RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS ranks
      FROM sales_transactions
      GROUP BY branch, dayoftheweek
      )ranked_ratings
WHERE ranks = 1;
