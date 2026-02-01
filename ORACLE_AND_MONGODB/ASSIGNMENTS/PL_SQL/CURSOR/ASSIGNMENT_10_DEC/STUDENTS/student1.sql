declare
 	cursor c1 is select * from student;
	studdata student%rowtype;
	gr char(1);
begin
	open c1; 
	loop
		fetch c1 into studdata;
		exit when c1%notfound;
			if studdata.marks>=0 and studdata.marks<=40
				then gr := 'F';
			elsif studdata.marks>40 and studdata.marks<59 
				then gr := 'C';
			elsif studdata.marks>60 and studdata.marks<=79
				then gr := 'B';
			elsif studdata.marks>=80
				then gr := 'A';
		end if;
		dbms_output.put_line('The name of the student is : ' || studdata.name);
		dbms_output.put_line('The marks obtained by ' || studdata.name || ' is  ' ||   studdata.marks);
		dbms_output.put_line('The grade provide for' || studdata.name || ' is  ' || gr);
		dbms_output.put_line('===========================================');

		update student set grade = gr where name = studdata.name;
	end loop;
	close c1 ;
end;
/
