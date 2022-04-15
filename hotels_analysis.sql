
create view hotels as (

select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'] 
)

select * from hotels


select arrival_date_year , hotel
,round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2)
from hotels
group by arrival_date_year , hotel


select * from hotels
left join  dbo.market_segment$ as mar
on hotels.market_segment = mar.market_segment
left join dbo.meal_cost$ as co
on co.meal = hotels.meal