 create table retail_sales
			(
				transactions_id	int primary key,
				sale_date date ,
				sale_time time,
				customer_id	int,
				gender	  varchar(15),
				age	      int,
				category varchar(15),
				quantiy	  int,
				price_per_unit	float,
				cogs	float,
				total_sale float
			)

--- Data claning

SELECT TOP 10 * FROM retail_sales;


select COUNT(*) from retail_sales
  
select * from retail_sales
where 
 transactions_id is null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 category is null
 or
 price_per_unit is null
 or 
 cogs is null
 or
 total_sale is null;

 delete from retail_sales
 where 
 transactions_id is null
 or
 sale_date is null
 or
 sale_time is null
 or
 customer_id is null
 or
 gender is null
 or
 category is null
 or
 price_per_unit is null
 or 
 cogs is null
 or
 total_sale is null;


 -- Data Exploration
 -- How many sales we have?
 select		
	COUNT(*) as tot_sales 
from
	retail_sales

--  How many unique customers we have?
select 
	COUNT(distinct  customer_id) as total_customers
from
	retail_sales

select COUNT(distinct  customer_id) as total_customers
from
	retail_sales

-- Data Analysis & buisness key Problem & Answers

-- write a Sql query to retrieve all columns for sales made on '2022-11-05'?

select *
from 
retail_sales
where sale_date= '2022-11-05'

-- write a sql query to retrieve all transactions where the category is 'clothing' and
-- the quantity sold is more than 10 in the month of Nov-2022?


SELECT *
FROM retail_sales
WHERE 
    category = 'clothing'
    AND quantiy > 10
    AND sale_date >= '2022-11-01'
    AND sale_date < '2022-12-01';


-- write a sql query to calculate the total sales for each category?

select 
	category,
	SUM(total_sale) as net_sale
from
	retail_sales
group By category;

-- write a sql query ti  find the average age of customers who purcahesd 
-- item form the 'beauty' category?

select
	AVG(age)
from
	retail_sales
where
	category = 'beauty';

--- write a sul query  to find all transactions where the total_sales is greater than
--1000?

select
*
from
	retail_sales
where 
	total_sale > 1000;

-- Write a sql query to find the total number of transaction made by each 
-- gender in each category ?

select
	category,
	gender,
COUNT(*) as total_trans
from
	retail_sales
group by 
	category,
	gender;

--- Write a sql query to calculate the average sale for each month.
-- find out best selling month in each year?

	WITH MonthlySales AS (
    SELECT 
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        avg(total_sale) AS total_sales
    FROM retail_sales
    GROUP BY 
        YEAR(sale_date), 
        MONTH(sale_date)
),
RankedSales AS (
    SELECT *,
           RANK() OVER (PARTITION BY sale_year ORDER BY total_sales DESC) AS rank
    FROM MonthlySales
)
SELECT sale_year, sale_month, total_sales
FROM RankedSales
WHERE rank = 1;


-- Write s sql query to find the top 5 customers based on the highest total sales?

select top 5
customer_id,
sum(total_sale) as total_sales
from
	retail_sales
group by customer_id
order by  total_sales desc;

-- write a sql query to find the number of unique customers who purchased
-- items from each category.

select
	category,
	COUNT(distinct customer_id) as unique_customers
from
	retail_sales
	group by category;


-- write a sql query to create each shift and number of orders 
--- example( morning <= 12, afternoon between 12 & 17, evening > 17)
SELECT
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS number_of_orders
FROM retail_sales
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END;


---END OF PROJECT---

