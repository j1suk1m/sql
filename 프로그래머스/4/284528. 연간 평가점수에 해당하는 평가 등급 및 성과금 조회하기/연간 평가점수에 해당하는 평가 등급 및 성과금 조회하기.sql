SELECT EMP.EMP_NO, EMP_NAME,
       (CASE
           WHEN AVG(SCORE) >= 96 THEN 'S'
           WHEN AVG(SCORE) >= 90 THEN 'A'
           WHEN AVG(SCORE) >= 80 THEN 'B'
           ELSE 'C'
       END) AS GRADE,
       SAL * (CASE
                 WHEN AVG(SCORE) >= 96 THEN 0.2
                 WHEN AVG(SCORE) >= 90 THEN 0.15
                 WHEN AVG(SCORE) >= 80 THEN 0.1
                 ELSE 0
             END) AS BONUS
FROM HR_EMPLOYEES AS EMP
JOIN HR_GRADE AS GRADE
ON EMP.EMP_NO = GRADE.EMP_NO
GROUP BY EMP.EMP_NO
ORDER BY EMP.EMP_NO