use superstore;

-- ============================================================
-- RETAIL SALES BUSINESS ANALYSIS
-- ============================================================

select * from orders;

-- 1. Total sales, orders and customers
select round(sum(sales), 2) as total_sales, count(distinct order_id) as total_orders, count(distinct customer_id) as total_customers from orders;

-- 2. Yearly sales performance
select year(order_date) as year, sum(sales) as yearly_sales from orders group by year order by year;

-- 3. Sales by category
select category, sum(sales) as categorical_sales from orders group by category order by sum(sales) desc;

-- 4. Top 10 products by sales
select product_id, product_name, sum(sales) as total_sales from orders group by product_id, product_name order by total_sales desc limit 10;

-- 5. Top 3 products within each category
with product_sales as (
	select category, product_id, product_name, sum(sales) as total_sales, ROW_NUMBER() OVER(partition by category order by sum(sales) desc) as rn
    from orders group by category, product_id, product_name
)
select category, product_id, product_name, total_sales from product_sales where rn <= 3;

-- 6. Top 10 customers by sales
select customer_id, customer_name, sum(sales) as total_sales from orders group by customer_id, customer_name order by total_sales desc limit 10;

-- Customers whose sales are above average customer sales
with customer_sales as (
	select customer_id, customer_name, sum(sales) as total_sales from orders group by customer_id, customer_name
)
select customer_id, customer_name, total_sales from customer_sales where total_sales > (select avg(total_sales) from customer_sales) order by total_sales desc;

-- 8. Sales by region and percentage contributio
with region_sales as (
	select region, sum(sales) as regional_sales from orders group by region
)
select region, regional_sales, round(regional_sales * 100 / sum(regional_sales) OVER(), 2) as sales_percentage from region_sales order by regional_sales desc;

-- 9. Highest-selling category in each region
with category_sales as (
	select region, category, sum(sales) as total_sales, RANK() OVER(partition by region order by sum(sales) desc) as rnk from orders group by region, category
)
select region, category, total_sales from category_sales where rnk = 1;

-- 10. Monthly sales and month-over-month growth
with monthly_sales as (
	select year(order_date) as year, month(order_date) as month, sum(sales) as monthly_sales from orders group by year, month order by year, month
), sales_with_prev as (
	select year, month, monthly_sales, LAG(monthly_sales) OVER(order by year, month) as prev_month_sales from monthly_sales
)
select year, month, monthly_sales, prev_month_sales,
round((monthly_sales - prev_month_sales) * 100 / prev_month_sales, 2) as mom_percentage_growth from sales_with_prev;

-- 11. Running total of sales by region
with daily_sales as (
	select region, order_date, sum(sales) as daily_sales from orders group by region, order_date
)
select region, order_date, daily_sales, sum(daily_sales) OVER(partition by region order by order_date) as running_total from daily_sales order by region, order_date;

-- 12. Average shipping time by region
with shipping_time as(
	select region, round(avg(datediff(ship_date, order_date)), 2) as avg_shipping_days from orders group by region
)
select region, avg_shipping_days, RANK() OVER(order by avg_shipping_days) as shipping_rank from shipping_time order by shipping_rank;