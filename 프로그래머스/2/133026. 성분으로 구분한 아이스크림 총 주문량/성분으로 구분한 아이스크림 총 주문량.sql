SELECT INGREDIENT_TYPE, SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF, ICECREAM_INFO
WHERE FIRST_HALF.FLAVOR = ICECREAM_INFO.FLAVOR
GROUP BY INGREDIENT_TYPE
ORDER BY SUM(TOTAL_ORDER)