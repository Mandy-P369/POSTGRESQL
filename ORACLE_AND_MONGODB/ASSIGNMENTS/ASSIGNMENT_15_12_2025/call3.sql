declare 
	empid number;
	emp_salary number;
	empname varchar(30);
begin
	empid := &empid; 
	p3(empid,emp_salary);
	select emp_name into empname from employee where salary = emp_salary ;
	dbms_output.put_line(empname);
	dbms_output.put_line(emp_salary);
	
end;
/