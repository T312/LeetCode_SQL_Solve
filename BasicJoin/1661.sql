select distinct 
  a.machine_id, round(avg(t1.timeMinus),3) as processing_time 
from (
    select distinct 
        (a.timestamp - b.timestamp) as timeMinus, a.machine_id  
    from  Activity as a join  Activity as b on a.process_id = b.process_id 
    where a.machine_id = b.machine_id and  (a.timestamp - b.timestamp) > 0
    ) t1
join Activity as a on a.machine_id = t1.machine_id
group by a.machine_id
order by a.machine_id
