-- Create CTe for monthly sales

with monthly_sales as (
select
	date_format(order_date, '%Y-%m-01') as month
	, count(order_id) as orders
from customer_orders
group by
	date_format(order_date, '%Y-%m-01')
)

-- Calculate median from values
select 
	avg(orders) as median -- 23
from (
select 
	orders 
	, @rownum:=@rownum+1 as 'row_number'
	, @total_rows:=@rownum
  from monthly_sales, (select @rownum:=0) r
  where true
  	and orders is not null
  order by orders
) as dd
where true
	and dd.row_number in ( floor((@total_rows+1)/2), floor((@total_rows+2)/2) )