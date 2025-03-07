select CATEGORY, PRICE as MAX_PRICE, PRODUCT_NAME
from FOOD_PRODUCT
where (CATEGORY, PRICE) in (
    select CATEGORY, max(PRICE)
    from FOOD_PRODUCT
    where CATEGORY = '과자'
    or CATEGORY = '국'
    or CATEGORY = '김치'
    or CATEGORY = '식용유'
    group by CATEGORY
)
order by MAX_PRICE desc