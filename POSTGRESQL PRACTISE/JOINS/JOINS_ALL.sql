
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

Select * from student; 
Select * from instructor;
Select * from student 


create table Employee as(
Select a.advisor_id as emp_id,concat(s.first_name,' ',s.last_name) as empname,concat(i.ins)
		from student s 
		left join 
		advisor a on a.student_id = s.student_id
		left join 
		instructor i on i.instructor_id = a.instructor_id 
		order by advisor_id asc
);

Select * from Employee ;
drop table Employee;
alter table Employee rename student_id to manager_id ;
Select * from Employee where manager_id = 4028 ; 

Select * from university ;
Select * from colleges ;
Select * from department;

Select distinct u.name  as university_name ,count(d.head) as total_head from university u 
left join
colleges c on c.university_id = u.university_id
left join 
department d on d.college_id = c.college_id 
group by university_name order by total_head desc;



Select distinct  u.name as university_name,
count(d.name) as total_department from university u 
left join 
colleges c on c.university_id = u.university_id
left join 
department d  on d.college_id = c.college_id where d.name = 'Mathematics Dept'
group by university_name
order by total_department ;

Select * from Employee;


-- Subquery Examples 
Select * from employee ;
select * from course ;
Select * from course where credits >=  (Select max(credits) from course);


-- Number of courses in department
Select distinct d.name as department_name,count(c.name) as totalcourses from department d
left join
course c on c.dept_id = d.dept_id
group by department_name ;


Select * from university;
-- Number of students having the name started with the letter 'p' inside the specific department in a specific colleges 
Select  distinct c.name as college_name,count(s.student_id) as total_students
from university u    
left join 
colleges c on c.university_id = u.university_id 
left join 
student s on s.college_id = c.college_id
where u.name like 'M%' group by  college_name having count(student_id)<>0 order by total_students desc;



Select distinct u.name as university_name from university u 
where exists
(
Select  distinct c.name as college_name,count(s.student_id) as total_students
from university u    
left join  
colleges c on c.university_id = u.university_id 
left join 
student s on s.college_id = c.college_id
where u.name like 'M%' group by  college_name having count(student_id)<>0 order by total_students desc
)



