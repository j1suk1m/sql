SELECT 
    CAR_TYPE,
    SUM(
        CASE WHEN
            OPTIONS LIKE '%통풍시트%' OR 
            OPTIONS LIKE '%열선시트%' OR 
            OPTIONS LIKE '%가죽시트%'
        THEN 1
        ELSE 0
        END
    ) AS CARS
FROM
    CAR_RENTAL_COMPANY_CAR 
GROUP BY
    CAR_TYPE
ORDER BY
    CAR_TYPE
    