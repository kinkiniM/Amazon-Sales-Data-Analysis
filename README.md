# Amazon-Sales-Data-Analysis

## Project Purpose
The major aim of this project is to gain insight into Amazon's sales data to understand the different factors that affect sales across various branches.

## About the Data
This dataset contains sales transactions from three different branches of Amazon, located in Mandalay, Yangon, and Naypyitaw. The data consists of 17 columns and 1000 rows.

### Column Descriptions:
| Column Name | Description | Data Type |
|-------------|-------------|------------|
| invoice_id | Invoice of the sales made | VARCHAR(30) |
| branch | Branch at which sales were made | VARCHAR(5) |
| city | The location of the branch | VARCHAR(30) |
| customer_type | The type of the customer | VARCHAR(30) |
| gender | Gender of the customer making purchase | VARCHAR(10) |
| product_line | Product line of the product sold | VARCHAR(100) |
| unit_price | The price of each product | DECIMAL(10, 2) |
| quantity | The amount of the product sold | INT |
| VAT | The amount of tax on the purchase | FLOAT(6, 4) |
| total | The total cost of the purchase | DECIMAL(10, 2) |
| date | The date on which the purchase was made | DATE |
| time | The time at which the purchase was made | TIMESTAMP |
| payment_method | The total amount paid | DECIMAL(10, 2) |
| cogs | Cost Of Goods Sold | DECIMAL(10, 2) |
| gross_margin_percentage | Gross margin percentage | FLOAT(11, 9) |
| gross_income | Gross Income | DECIMAL(10, 2) |
| rating | Rating | FLOAT(2, 1) |

## Analysis List
### 1. Product Analysis
- Identify the different product lines.
- Determine the best-performing product lines.
- Identify product lines that need improvement.

### 2. Sales Analysis
- Analyze sales trends of products.
- Measure the effectiveness of sales strategies.
- Suggest modifications for increased sales.

### 3. Customer Analysis
- Identify customer segments.
- Understand purchase trends.
- Evaluate the profitability of each customer segment.

## Approach Used
### 1. Data Wrangling
- Build a database.
- Create a table and insert the data.
- Ensure no NULL values exist in the dataset.

### 2. Feature Engineering
- **`timeofday`**: Classify sales into Morning, Afternoon, or Evening.
- **`dayname`**: Extract the day of the week for each transaction.
- **`monthname`**: Extract the month of each transaction.

### 3. Exploratory Data Analysis (EDA)
- Answer business questions based on the dataset insights.

## Business Questions to Answer
1. What is the count of distinct cities in the dataset?
2. For each branch, what is the corresponding city?
3. What is the count of distinct product lines?
4. Which payment method is most frequently used?
5. Which product line has the highest sales?
6. How much revenue is generated each month?
7. In which month did the cost of goods sold peak?
8. Which product line generated the highest revenue?
9. In which city was the highest revenue recorded?
10. Which product line incurred the highest VAT?
11. Classify each product line as "Good" or "Bad" based on sales performance.
12. Identify the branch that exceeded the average number of products sold.
13. Which product line is most frequently purchased by each gender?
14. Calculate the average rating for each product line.
15. Count sales occurrences for each time of day per weekday.
16. Identify the customer type contributing the highest revenue.
17. Determine the city with the highest VAT percentage.
18. Identify the customer type with the highest VAT payments.
19. What is the count of distinct customer types?
20. What is the count of distinct payment methods?
21. Which customer type is most frequent?
22. Identify the customer type with the highest purchase frequency.
23. Determine the predominant gender among customers.
24. Examine gender distribution within each branch.
25. Identify the time of day when customers provide the most ratings.
26. Determine the time of day with the highest customer ratings for each branch.
27. Identify the day of the week with the highest average ratings.
28. Determine the day of the week with the highest average ratings for each branch.

## Installation and Usage
### Prerequisites
- Python 3.x
- Pandas, NumPy, Matplotlib, Seaborn
- SQL database for structured data storage

### Running the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/amazon-sales-analysis.git
   cd amazon-sales-analysis
   ```
2. Install required libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the data processing script:
   ```bash
   python data_analysis.py
   ```

## Contributing
Contributions are welcome! If you have suggestions, please create an issue or submit a pull request.

## License
This project is licensed under the MIT License.


