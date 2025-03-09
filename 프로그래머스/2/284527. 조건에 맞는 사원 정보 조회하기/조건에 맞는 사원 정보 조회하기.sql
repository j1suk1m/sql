select sum(SCORE) as SCORE, 
       HR_EMPLOYEES.EMP_NO, 
       EMP_NAME, 
       POSITION, 
       EMAIL
from HR_EMPLOYEES 
join HR_GRADE 
on HR_EMPLOYEES.EMP_NO = HR_GRADE.EMP_NO
group by HR_EMPLOYEES.EMP_NO
order by SCORE desc
limit 1