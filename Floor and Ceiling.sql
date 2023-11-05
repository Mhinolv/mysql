select
	_random_decimal
	, ceiling(_random_decimal) as _ceiling -- smallest number >= to expression
	, floor(_random_decimal) as _floor -- smallest number <= to expression
from (
	select
		round(rand() * (rand() * 100) + rand(),2) as _random_decimal
		, @curRow := @curRow + 1
	from orders, (select @curRow := 0) r -- calling orders model for row_count (can be any table)
	where true
		and @curRow <= 10
	) as rand_dec;