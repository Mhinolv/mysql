-- Create CTe for monthly sales

with monthly_sales as (
select
	date_format(order_date, '%Y-%m-01') as month
	, count(order_id) as orders
from customer_orders
group by
	date_format(order_date, '%Y-%m-01')
)


-- Calculate 25th percentile
select
	round(avg(orders),2) as first_quartile
from (
	select
		orders
		, percent_rank() over(partition by null order by orders) as percentile
	from monthly_sales
	order by
		orders asc
	) percent_r
where true
	and percentile <= .25