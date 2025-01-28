SELECT THIRD_GEN.ID
FROM ECOLI_DATA AS THIRD_GEN
JOIN ECOLI_DATA AS SECOND_GEN ON THIRD_GEN.PARENT_ID = SECOND_GEN.ID
JOIN ECOLI_DATA AS FIRST_GEN ON SECOND_GEN.PARENT_ID = FIRST_GEN.ID
WHERE FIRST_GEN.PARENT_ID IS NULL
ORDER BY THIRD_GEN.ID