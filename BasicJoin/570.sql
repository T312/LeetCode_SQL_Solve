select name 
from Employee 
where id in (
    select managerId from  Employee where id in 
        (select if( count(managerId) >= 5, id, null) from Employee 
        group by managerId
        )
  )
  
-- cach 2
select name from Employee where id in (select managerId from Employee
group by managerId 
having count(managerId) >= 5)
  
-- cach 3
select a.name 
from Employee as a join Employee as b on a.id = b.managerId 
group by b.managerId 
having count(b.managerId) >= 5
