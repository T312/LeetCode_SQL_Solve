select round(avg(t1.order_date=t1.customer_pref_delivery_date) * 100, 2)  as immediate_percentage 
from (
    select * , rank() over(partition by customer_id order by order_date ) as temp 
    from delivery
  ) t1 
where t1.temp = 1
