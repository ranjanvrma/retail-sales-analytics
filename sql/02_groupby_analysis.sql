use superstore;

-- Find the total sales for each category.
select category, sum(sales) as total_sales from orders group by category;

-- Find the total sales for each region.
select region, sum(sales) as total_sales from orders group by region;

-- Find the average sales for each category.
select category, avg(sales) as avg_sales from orders group by category;

-- Find the maximum sale in each category.
select category, max(sales) as max_sales from orders group by category;

-- Find the minimum sale in each category.
select category, min(sales) as min_sales from orders group by category;

-- Find the number of orders in each region.
select region, count(*) as count from orders group by region;

-- Find the total sales for each customer segment.
select segment, sum(sales) as total_sales from orders group by segment;

-- Find the total sales for each ship mode.
select ship_mode, sum(sales) as total_sales from orders group by ship_mode;

-- Find the average sales for each state.
select state, avg(sales) as avg_sales from orders group by state;

-- Find the total sales for each sub-category.
select sub_category, sum(sales) as total_sales from orders group by sub_category;

-- Find total sales for every: Region, Category
select region, category, sum(sales) as total_sales from orders group by region, category order by region;

-- Find total sales for every: Segment, Ship Mode
select segment, ship_mode, sum(sales) as total_sales from orders group by segment, ship_mode order by segment;

-- Find total sales for every: State, Sub-Category
select state, sub_category, sum(sales) as total_sales from orders group by state, sub_category order by state;

-- For every category, show: Total Sales, Average Sales, Highest Sale, Lowest Sale
select category, sum(sales) as total_sales, avg(sales) as avg_sales, max(sales) as max_sale, min(sales) as min_sale from orders group by category;

-- Find the highest-selling category.
select category, count(*) as count from orders group by category order by count desc limit 1;