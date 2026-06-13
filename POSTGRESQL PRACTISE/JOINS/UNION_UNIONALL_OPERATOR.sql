-- UNION OPERATOR
Select * from Employee ;

create table alternateemployee as (
select * FROM Employee
WHERE emp_id IN (
    SELECT emp_id
    FROM (
        SELECT emp_id,
               ROW_NUMBER() OVER (ORDER BY emp_id) AS rn
        FROM Employee
    ) t
    WHERE rn % 2 = 0
)) ;

Select * from Employee ;
Select * from alternateemployee ;

CREATE TABLE alternateemployee2 AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY emp_id) AS rn
    FROM alternateemployee
) t
WHERE rn % 2 =1 ;


Select * from alternateemployee2 ; 
Select * from employee;
alter table alternateemployee2 rename advisor_nme to advisor_name ; 
alter table employee rename advisor_nme to advisor_name; 


create table uniontable as(
Select empname,advisor_name from employee e
union
Select empname,advisor_name from alternateemployee2  ae );

select * from uniontable ;