select 
    t1.user_id, 
    if (round (t2.confi/t1.totalAction,2) is not null,round (t2.confi/t1.totalAction,2) ,round  (0,2)) as confirmation_rate 
from 
  (select a.user_id, count(action) as totalAction from Signups as a left join Confirmations as b on a.user_id = b.user_id
  group by a.user_id ) t1 
left join 
  (select user_id , count(action) as confi from Confirmations where action = "confirmed" group by user_id) t2 
on t1.user_id = t2.user_id
  
-- cach 2

SELECT a.user_id, round(ifnull(avg(action = 'confirmed'), 0),2) as confirmation_rate
FROM Signups a
LEFT JOIN Confirmations b
ON a.user_id = b.user_id
GROUP BY a.user_id
