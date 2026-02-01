declare
	cursor c1(order_no number) is select * from orders where order_id = order_no;
	total number;
	x number;
begin
	x :=&x;
	open c1(x);
	if c1%isopen then 
		dbms_output.put_line('cursor is open');
	else
		dbms_output.put_line('cursor is close');
	end if;
	fetch c1 into total;
	dbms_output.put_line('Value of x is : ' || x);
	close c1;
end;
/