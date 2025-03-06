select count(FISH_TYPE) as FISH_COUNT, 
       max(LENGTH) as MAX_LENGTH, 
       FISH_TYPE
from FISH_INFO
group by FISH_TYPE
having avg(case
                when LENGTH <= 10 then 10
                else LENGTH
           end) >= 33
order by FISH_TYPE