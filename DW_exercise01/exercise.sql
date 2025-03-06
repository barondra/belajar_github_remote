-- create dimensional model
create table ftde_batch4.bharin_dim_products as
select * from ftde_batch4.bharin_raw_products;

create table ftde_batch4.bharin_dim_stores as
select * from ftde_batch4.bharin_raw_stores;

create table ftde_batch4.bharin_dim_customer as
select * from ftde_batch4.bharin_raw_customer;

create table ftde_batch4.bharin_dim_dates as
select * from ftde_batch4.bharin_raw_dates;

create table ftde_batch4.bharin_fact_sales as
select
	sales.transaction_id ,
	dates.date_id,
	customer.customer_id,
	products.product_id as product_id,
	stores.store_id,
	stores.business_key as store_business_key,
	sales_amount
from ftde_batch4.bharin_raw_sales as sales
inner join ftde_batch4.bharin_raw_dates as dates
on to_date(sales.transaction_date, 'M/d/yy') = to_date(dates.date, 'M/d/yyyy')
inner join (select * from ftde_batch4.bharin_raw_customer) as customer
on sales.customer_id = customer.customer_id
inner join (select * from ftde_batch4.bharin_raw_products) as products
on sales.product = products.sku
inner join (select * from ftde_batch4.bharin_raw_stores) as stores
on sales.store = stores.business_key;

select * from bharin_fact_sales bfs ;
select * from bharin_raw_sales brs ;
select * from bharin_dim_customer bdc ;
select * from bharin_dim_dates bdd where calendar_quarter like '%4';
select * from bharin_dim_products bdp ;
select * from bharin_dim_stores bds ;

-- 1. how much total amount of sales per quarter per year
select date_part('year', to_date(dates.date, 'M/d/yyyy')) as date_year, dates.calendar_quarter, SUM(sales.sales_amount)
from bharin_fact_sales as sales
inner join ftde_batch4.bharin_dim_dates as dates
on sales.date_id = dates.date_id 
group by date_year, dates.calendar_quarter
order by date_year desc, dates.calendar_quarter desc;

-- 2. Give me top 3 royal customers
select SUM(sales.sales_amount), customer."name" 
from bharin_fact_sales as sales
inner join bharin_dim_customer as customer
on sales.customer_id = customer.customer_id
group by customer."name" 
order by SUM(sales.sales_amount) desc 
limit 3;

-- 3. Top 3 best selling products based on total number of sales
select COUNT(sales.product_id), products."name", SUM(sales.sales_amount)
from bharin_fact_sales as sales
inner join bharin_dim_products as products
on sales.product_id = products.product_id
group by products."name"  
order by COUNT(sales.product_id) desc
limit 3;

-- 4. Top 3 most wanted categories based on total number of sales
select COUNT(sales.product_id), products.categories, SUM(sales.sales_amount)
from bharin_fact_sales as sales
inner join bharin_dim_products as products
on sales.product_id = products.product_id
group by products.categories  
order by COUNT(sales.product_id) desc
limit 3;

-- 5. Top 3 most productive stores based on total number of sales
select COUNT(sales.product_id), stores."name" , SUM(sales.sales_amount)
from bharin_fact_sales as sales
inner join bharin_dim_stores as stores
on sales.store_id = stores.store_id 
group by stores."name" 
order by COUNT(sales.product_id) desc
limit 3;