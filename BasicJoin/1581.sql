select distinct 
  c.customer_id, 
  count(c.customer_id) over (partition by c.customer_id) as count_no_trans 
from 
  Visits as c left join Transactions as t on c.visit_id = t.visit_id 
where 
  transaction_id is null 
