🛍️ Retail Sales Analysis (Beginner-Level SQL Project)

Level: Beginner
Tools Used: SSMS

📌 Project Overview
This project demonstrates foundational SQL skills used by data analysts to explore, clean, and analyze retail sales data. It involves:

Setting up a retail sales database

Performing exploratory data analysis (EDA)

Answering business questions through SQL queries


🎯 Objectives
Database Setup: Create and populate a retail sales database.

Data Cleaning: Identify and remove records with missing/null values.

Exploratory Data Analysis: Understand customer and product data.

Business Analysis: Use SQL queries to answer real-world questions.

🧱 Project Structure

1. 📂 Database Setup
   
Create Database and Table
  
        CREATE TABLE retail_sales (
    
        transactions_id INT PRIMARY KEY,
        sale_date DATE,
        sale_time TIME,
        customer_id INT,
        gender VARCHAR(10),
        age INT,
        category VARCHAR(35),
        quantity INT,
        price_per_unit FLOAT,
        cogs FLOAT,
        total_sale FLOAT
        ;

3. 🧹 Data Exploration & Cleaning
 Total Number of Records

       SELECT 
       COUNT(*) 
       FROM retail_sales;


 Unique Customers
 
     
     SELECT 
     COUNT(DISTINCT customer_id) 
     FROM retail_sales;
    
     Unique Categories
 
      SELECT DISTINCT category FROM retail_sales;


Null Check

    SELECT * 
    FROM retail_sales 
    WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL 
          OR gender IS NULL OR age IS NULL OR category IS NULL 
          OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
          


Delete Null Records

     DELETE FROM retail_sales
    WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL 
      OR gender IS NULL OR age IS NULL OR category IS NULL 
       OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    


3. 📊 Data Analysis & Business Queries
   
1. Sales on a Specific Date

       SELECT * 
       FROM retail_sales 
       WHERE sale_date = '2022-11-05';


2. Clothing Sales with Quantity > 4 in Nov-2022
        
        SELECT * 
       FROM retail_sales 
       WHERE category = 'Clothing' 
       AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
       AND quantity > 4;
      

3. Total Sales per Category

        SELECT 
            category, 
            SUM(total_sale) AS net_sale, 
            COUNT(*) AS total_orders 
        FROM retail_sales 
        GROUP BY category;
        

4. Average Age of 'Beauty' Category Customers

 
       SELECT ROUND(AVG(age), 2) AS avg_age 
       FROM retail_sales 
       WHERE category = 'Beauty';


5. High-Value Transactions (> ₹1000)

       SELECT * 
       FROM retail_sales 
       WHERE total_sale > 1000;


6. Transaction Count by Gender and Category

       SELECT 
       category, 
       gender, 
         COUNT(*) AS total_trans 
       FROM retail_sales 
       GROUP BY category, gender 
       ORDER BY category;
         
8. Average Sale per Month & Best Month per Year

       SELECT year, month, avg_sale 
       FROM (
           SELECT 
              EXTRACT(YEAR FROM sale_date) AS year,
              EXTRACT(MONTH FROM sale_date) AS month,
              AVG(total_sale) AS avg_sale,
              RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS rank
          FROM retail_sales
          GROUP BY 1, 2
         ) t
       WHERE rank = 1;


9. Top 5 Customers by Sales
   
       SELECT 
        customer_id, 
        SUM(total_sale) AS total_sales 
       FROM retail_sales 
       GROUP BY customer_id 
       ORDER BY total_sales DESC 
       LIMIT 5;
    

10. Unique Customers per Category
    
        SELECT 
        category, 
        COUNT(DISTINCT customer_id) AS cnt_unique_cs 
        FROM retail_sales 
        GROUP BY category;

10. Orders by Time Shift
    
        WITH hourly_sale AS 
                SELECT 
        CASE 
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
        FROM retail_sales)
        SELECT shift, COUNT(*) AS total_orders
        FROM hourly_sale
        GROUP BY shift;



📈 Findings
Customer Demographics: Customers from a range of age groups and genders.

High-Value Sales: Many transactions exceeded ₹1000.

Popular Categories: "Clothing" and "Beauty" had strong engagement.

Sales Trends: Sales varied significantly by month and shift.

Top Customers: Identified high-spending customers by total purchase value.

📋 Reports
Sales Summary: Total sales by category, transaction counts.

Trend Analysis: Monthly & time-of-day sales patterns.

Customer Insights: Top 5 customers and unique customers by category.

✅ Conclusion
This project serves as a comprehensive SQL portfolio piece for aspiring data analysts. It walks through:

Database setup and cleaning

EDA and insights

Real-world business queries

These findings provide valuable insights into customer behavior, sales performance, and seasonality — critical factors for retail decision-making.

📌 Author & Contact

Name: Soni Kumari

LinkedIn: (https://www.linkedin.com/in/soni-kumari-8530a7328/)


GitHub: https://github.com/SONI-KUMARI1





