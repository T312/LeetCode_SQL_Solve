select 
    a.id as Id
from 
    Weather as a join Weather as b on a.id <> b.id
where 
    a.temperature > b.temperature and dateDiff(a.recordDate ,b.recordDate ) = 1
