select a.product_id, ifnull(round(sum(a.price * b.units)/sum(units),2),0) as average_price  
from Prices as a left join UnitsSold as b on a.product_id = b.product_id 
where a.start_date <= b.purchase_date and b.purchase_date <= a.end_date or b.units is null
group by a.product_id
