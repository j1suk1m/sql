select count(ID) as FISH_COUNT, month(TIME) as MONTH
from FISH_INFO 
group by month(TIME)
having count(ID) > 0
order by MONTH