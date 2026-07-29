use superstore;

-- Show categories whose total sales are greater than 700000.
select category, sum(sales) as total_sales from orders group by category having total_sales > 700000;

-- Show regions whose average sales are greater than 230.
select region, avg(sales) as avg_sales from orders group by region having avg_sales > 230;

-- Show customer segments having more than 3000 orders.
select segment, count(*) as count from orders group by segment having count > 3000;

-- Show states where the average sales are greater than 250.
select state, avg(sales) as avg_sales from orders group by state having avg_sales > 250;

-- Show sub-categories whose total sales are greater than 100000.
select sub_category, sum(sales) as total_sales from orders group by sub_category having total_sales > 100000;

-- Show categories where the highest sale is greater than 10000.
 select category, max(sales) as max_sale from orders group by category having max_sale > 10000;
 
 -- Show ship modes having more than 1000 orders.
 select ship_mode, count(*) as count from orders group by ship_mode having count > 1000;
 
 -- Show customers whose total spending is greater than 10000.
 select customer_id, sum(sales) as total_spending from orders group by customer_id having total_spending > 10000;
 
 -- Show regions whose total sales are between 400000 and 700000.
 select region, sum(sales) as total_sales from orders group by region having total_sales between 400000 and 700000;
 
 -- Show categories whose average sales are less than 400.
select category, avg(sales) as avg_sales from orders group by category having avg_sales < 400;