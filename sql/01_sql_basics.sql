USE superstore;

-- Display the first 10 rows.
select * from orders limit 10;

-- Display only: Order ID, Customer Name, Sales
select order_id, customer_name, sales from orders;

-- Show unique Categories.
select distinct category from orders;

-- Show unique Regions.
select distinct region from orders;

-- Display all orders sorted by Sales (highest first).
select * from orders order by sales desc;

-- Display the 5 lowest sales.
select * from orders order by sales limit 5;

-- Display only Technology products.
select * from orders where category = 'Technology';

-- Display all orders where Sales > 1000.
select * from orders where sales > 1000;

-- Display Technology products with Sales > 1000.
select * from orders where category = 'Technology' and sales > 1000;

-- Display California orders.
select * from orders where state = 'California';

