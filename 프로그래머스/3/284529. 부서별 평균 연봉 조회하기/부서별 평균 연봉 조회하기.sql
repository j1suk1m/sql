SELECT HR_DEPARTMENT.DEPT_ID, DEPT_NAME_EN, ROUND(AVG(SAL)) AS AVG_SAL
FROM HR_DEPARTMENT JOIN HR_EMPLOYEES ON HR_DEPARTMENT.DEPT_ID = HR_EMPLOYEES.DEPT_ID
GROUP BY HR_DEPARTMENT.DEPT_ID
ORDER BY AVG(SAL) DESC

