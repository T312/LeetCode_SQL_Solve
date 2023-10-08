select query_name, round (avg (rating/position),2) as quality,
round (100*avg (rating < 3),2) as poor_query_percentage
from Queries
group by query_name
