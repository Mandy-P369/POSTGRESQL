Select * from university ;
Select * from colleges ;
Select * from department;

Select university_id,u.name,city from university u ;

Select distinct u.city as cityname,count(u.name) as total_university from university u where
u.city like 'W%' group by cityname order by total_university desc;


-- inner join  
Select distinct u.city as cityname, count(u.name) as Total_university,count(c.name) as Total_Colleges from university u
left join
colleges c on 
u.university_id = c.university_id
group by cityname;

-- How many heads are there inside the specific city ..
Select distinct city as cityname ,count(d.head) as total_head from university u 
left join
colleges c on c.university_id = u.university_id
left join 
department d on d.college_id = c.college_id 
group by cityname order by total_head desc;

-- Query of Right joins 
-----------------------------------------------
Select column_name,data_type from information_schema.columns where table_name = 'enrollment';
alter table enrollment alter column enrollment_id type varchar(30);
Select * from enrollment;
-----------------------------------------------
-- Tell me the student name whose grade is D......
Select e.student_id,e.grade,e.enrollment_id,concat(s.first_name,' ',s.last_name) from enrollment e
right join
student s on s.student_id = e.student_id 
where grade = 'D';

-- Check 
Select count(*) from enrollment where grade ='D' ; 
    




