with t1 as (select t2.player_id,t2.event_date, t2.r from (select *, rank() over(partition by player_id order by event_date ) as r from Activity ) t2 where t2.r = 1),

 t3 as (select t2.player_id,t2.event_date, t2.r from (select *, rank() over(partition by player_id order by event_date ) as r from Activity ) t2 where t2.r >= 2)

select round(count(t1.player_id)/(select COUNT(DISTINCT player_id) from Activity),2) as fraction  
from t1 left join t3 on t1.player_id = t3.player_id 
where (DATEDIFF( t3.event_date, t1.event_date))  = 1

 -- cach 2
with t1 as (select t2.player_id,t2.event_date, t2.r from (select *, rank() over(partition by player_id order by event_date ) as r from Activity ) t2 where t2.r = 1)
select round(ifnull (sum(t1.r)/(select COUNT(DISTINCT player_id) from Activity),0),2) as fraction 
from Activity as t left join t1 on t1.player_id = t.player_id 
where (DATEDIFF( t.event_date, t1.event_date))  = 1
