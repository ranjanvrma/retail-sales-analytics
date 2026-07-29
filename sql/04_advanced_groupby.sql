use superstore;

-- Show total sales, average sales, highest sale and lowest sale for each category.
select category, sum(sales) as total_sales, avg(sales) as avg_sales, max(sales) as max_sale, min(sales) as min_sale from orders group by category;

-- Show total sales and total number of orders for each region.
select region, sum(sales) as total_sales, count(*) as count from orders group by region;

-- Show total sales and average sales for each customer segment ordered by total sales descending.
select segment, sum(sales) as total_sales, avg(sales) as avg_sales from orders group by segment order by total_sales desc;

-- Show the top 5 customers based on total sales.
select customer_id, customer_name, sum(sales) as total_sales from orders group by customer_id, customer_name order by total_sales desc limit 5;

-- Show the top 5 states based on average sales.
select state, avg(sales) as avg_sales from orders group by state order by avg_sales desc limit 5;

-- Show the bottom 5 sub-categories based on total sales.
select sub_category, sum(sales) as total_sales from orders group by sub_category order by total_sales limit 5;

-- Show the total sales for every Region and Category combination ordered by total sales descending.
select region, category, sum(sales) as total_sales from orders group by region, category order by region, total_sales desc;

-- Show the average sales for every Ship Mode and Segment combination.
select ship_mode, segment, avg(sales) as avg_sales from orders group by ship_mode, segment order by ship_mode;

-- Show the top selling sub-category in each category.
select category, sub_category, sum(sales) as total_sales from orders group by category, sub_category order by category;

-- Show the customer who placed the maximum number of orders.
select customer_id, customer_name, count(distinct order_id) as count from orders group by customer_id, customer_name order by count desc limit 1;