WITH SIZE_PERCENT_RANK AS (
    SELECT ID,
           PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PERCENT
    FROM ECOLI_DATA
)

SELECT ID,
       CASE 
           WHEN PERCENT <= 0.25 THEN 'CRITICAL'
           WHEN PERCENT <= 0.5 THEN 'HIGH'
           WHEN PERCENT <= 0.75 THEN 'MEDIUM'
           ELSE 'LOW'
       END AS COLONY_NAME
FROM SIZE_PERCENT_RANK
ORDER BY ID