-- YoY calculations for diff and percentage diff

with yoy_quantity as (
select
	lag(total_quantity, 1) over(
		partition by null 
		order by year) as py_quantity
	, total_quantity as yearly_quantity
	, year
from (
	select
		date_format(order_date, '%Y') as year
		, sum(quantity) as total_quantity
	from orders
	group by
		year ) as year_table
)

select
	year
	, py_quantity
	, yearly_quantity
	, py_quantity - yearly_quantity as yoy_quantity_diff
	, round(1 - (py_quantity / yearly_quantity),2) as yoy_quantity_perc_diff
from yoy_quantity
order by
	year desc