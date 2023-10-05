select 
  s.student_id, s.student_name, su.subject_name, count(ex.subject_name) as attended_exams 
from 
  Students as s cross join Subjects as su left join Examinations as ex on s.student_id = ex.student_id and su.subject_name = ex.subject_name
group by 
  su.subject_name,s.student_id
order by 
  s.student_id,su.subject_name
