select 
  name 
from 
  Employee 
where id in (
    select managerId from  Employee where id in 
        (select if( count(managerId) >= 5, id, null) from Employee 
        group by managerId
        )
  )
