select cast(year(SALES_DATE) as unsigned) as YEAR, 
       cast(month(SALES_DATE) as unsigned) as MONTH, 
       GENDER, 
       count(distinct USER_INFO.USER_ID) as USERS
from USER_INFO 
join ONLINE_SALE 
on USER_INFO.USER_ID = ONLINE_SALE.USER_ID
where GENDER is not null
group by year(SALES_DATE), month(SALES_DATE), GENDER
order by YEAR, MONTH, GENDER