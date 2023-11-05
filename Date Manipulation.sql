select
	order_date
	, date_format(order_date, '%Y-%m-01') as month -- Converts timestamp to month
	, date_format(order_date, '%Y') as year -- Converts timestamp to year
	, current_date() as today -- Current date
	, now() as today_datetime -- Current datetime
	, date_add(order_date, interval 7 day) as order_date -- Add/substract days from date field
	, date(now()) as today_2 -- Converts datetime to date
	, datediff(order_date, now()) as order_days_from_today -- Surfaces difference of days between two date fields
from orders

/*
To find about more about date and datetime functions visit:
https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_adddate
*/