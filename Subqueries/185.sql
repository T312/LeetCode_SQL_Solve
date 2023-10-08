select a.Department, a.Employee, a.Salary 
from (
    select b.name as Department  ,a.name as Employee , a.salary as Salary, DENSE_rank() over(partition by b.name order by a.salary desc) as ranker 
    from Employee as a left join Department as b on a.departmentId = b.id
    group by a.name
    ) a
where a.ranker <= 3
