-- MyQL does not support PIVOT() functionality on tables. To mimic pivot function case statements are one of many options.

select
	date_format(order_date, '%Y') as year
	, ifnull(sum(case when month(order_date) = 1 then quantity end),0) as Jan
	, ifnull(sum(case when month(order_date) = 2 then quantity end),0) as Feb
	, ifnull(sum(case when month(order_date) = 3 then quantity end),0) as Mar
	, ifnull(sum(case when month(order_date) = 4 then quantity end),0) as Apr
	, ifnull(sum(case when month(order_date) = 5 then quantity end),0) as May
	, ifnull(sum(case when month(order_date) = 6 then quantity end),0) as Jun
	, ifnull(sum(case when month(order_date) = 7 then quantity end),0) as Jul
	, ifnull(sum(case when month(order_date) = 8 then quantity end),0) as Aug
	, ifnull(sum(case when month(order_date) = 9 then quantity end),0) as Sep
	, ifnull(sum(case when month(order_date) = 10 then quantity end),0) as "Oct" -- This was treated as a method when trying to run
	, ifnull(sum(case when month(order_date) = 11 then quantity end),0) as Nov
	, ifnull(sum(case when month(order_date) = 12 then quantity end),0) as "Dec" -- This was treated as a method when trying to run
from orders
group by
	year
order by
	year desc