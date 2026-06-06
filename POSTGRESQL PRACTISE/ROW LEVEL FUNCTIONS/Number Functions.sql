-- ROW LEVEL FUNCTIONS . 

 
Select * from traindata ;
create table trainview as (Select * from traindata limit 500);
Select * from trainview ; 
Select dob from trainview ;

-- Retrieve the list of customer first name after removing the first character 
Select first,substring(trim(first),2) as subname from trainview ; 
Select trim(first),substring(trim(first),2,length(first)) from trainview ;

-- NUMBER FUNCTIONS 
Select * from trainview ;
Select amt,abs(amt) from trainview;
Select amt,ceil(amt) from trainview ;
Select amt,floor(amt) from trainview;
Select amt,round(amt) from trainview;
Select trunc(amt) from trainview;
Select amt,power(amt,3) from trainview;
Select amt,sqrt(amt) from trainview;
Select amt,cbrt(amt) from trainview;
Select random(1,11);
Select amt*floor(random()*100)+1 from trainview;

-- Exponential Functions 

Select exp(2) ;
Select ln(amt) from trainview ; 
Select amt,sign(amt) from trainview ;


-- Modulus Functions 

Select mod(45,34) ;
Select greatest(amt) from trainview ;
Select least(amt) from trainview;














