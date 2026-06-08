-- Inner join 
Select  column_name,data_type from information_schema.columns where table_name='university'
Select column_name,data_type from information_schema.columns where table_name ='colleges'


Select * from university;
Select * from colleges;

Select u.university_id ,u.name as university_name,u.established_year,c.name
from university as u
inner join
colleges c on u.university_id = c.university_id
order by university_name ;

-- Number of colleges inside the particular university 
Select distinct u.name as university_name,count(c.name) as Totalcolleges from university u
inner join
colleges c on c.university_id = u.university_id group by university_name order by totalcolleges desc ;

Select * from university;

Select distinct u.name as university_name,count(c.name) as total_colleges from university u
right join 
colleges c 
on u.university_id = c.university_id group by university_name order by total_colleges desc ;