select * from pizza_sales
select cast(sum(total_price) as Decimal(10,2)) as Total_Revenue 
from pizza_sales

select cast(sum(total_price) / count(distinct order_id) as decimal(10,2)) as AOV 
from pizza_sales

select sum(quantity) as Total_Pizza_Sold 
from pizza_sales

select count(distinct order_id) as Total_Orders_Placed
from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))  as Average_Pizza_Per_Order 
from pizza_sales

select DATENAME(dw,order_date) as order_day, count(distinct order_id) as #_of_orders 
from pizza_sales
group by DATENAME(dw,order_date)

select DATENAME(month,order_date) as order_month, count(distinct order_id) as #_of_orders 
from pizza_sales
group by DATENAME(month,order_date)
order by #_of_orders  desc

select  pizza_category,cast(sum(total_price) as decimal(10,2)) as revenue, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category
order by PCT desc

select  pizza_size,cast(sum(total_price) as decimal(10,2)) as revenue, cast(sum(total_price) * 100 / (select sum(quantity) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc

select  pizza_size,cast(sum(total_price) as decimal(10,2)) as revenue, sum(quantity) as quantity_sold
from pizza_sales
group by pizza_size
order by quantity_sold desc

select top 5 pizza_name,cast(sum(total_price) as decimal(10,2))as revenue
from pizza_sales
group by pizza_name
order by revenue desc

select top 5 pizza_name,cast(sum(total_price) as decimal(10,2))as revenue
from pizza_sales
group by pizza_name
order by revenue asc

select top 5 pizza_name,cast(sum(quantity) as decimal(10,2))as quantity
from pizza_sales
group by pizza_name
order by quantity desc

select top 5 pizza_name,cast(sum(quantity) as decimal(10,2))as quantity
from pizza_sales
group by pizza_name
order by quantity asc

select top 5 pizza_name,cast(count(distinct order_id) as decimal(10,2))as orders
from pizza_sales
group by pizza_name
order by orders desc

select top 5 pizza_name,cast(count(distinct order_id) as decimal(10,2))as orders
from pizza_sales
group by pizza_name
order by orders asc
