Select * from university;
Select * from advisor;
Select * from colleges;
SElect * from department;
Select * from enrollment;
Select * from instructor;
Select * from prerequisite;
Select * from section;
Select  * from student;
Select * from colleges;

-- Check the constraints inside the each columns of the table ....
Select ifc.column_name,ifc.data_type,itc.constraint_type from information_schema.columns as ifc
join
information_schema.key_column_usage as kcu 
on ifc.table_name = kcu.table_name and ifc.column_name = kcu.column_name
join
information_schema.table_constraints as itc 
on kcu.constraint_name = itc.constraint_name 
where itc.table_name='university' and itc.table_schema='public'


SELECT
    kcu.column_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_name = 'university';

Select kcu.column_name,
		tc.constraint_name,
		tc.constraint_type
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu 
on tc.constraint_name = kcu.constraint_name
where tc.table_name = 'colleges';

Select kcu.column_name,
		tc.constraint_name,
		tc.constraint_type
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu 
on tc.constraint_name = kcu.constraint_name
where tc.table_name = 'student';


Select kcu.column_name,
		tc.constraint_name,
		tc.constraint_type
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu 
on tc.constraint_name = kcu.constraint_name
where tc.table_name = 'course';

Select kcu.column_name,
		tc.constraint_name,
		tc.constraint_type
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu 
on tc.constraint_name = kcu.constraint_name
where tc.table_name = 'department';

Select kcu.column_name,
		tc.constraint_name,
		tc.constraint_type
from information_schema.table_constraints tc
join information_schema.key_column_usage kcu 
on tc.constraint_name = kcu.constraint_name
where tc.table_name = 'enrollment';