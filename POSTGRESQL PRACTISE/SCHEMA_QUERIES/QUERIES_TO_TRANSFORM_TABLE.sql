Select * from traindata ;
Select * from testdata ;

-- Retrieve Column Names and Data Types of traindata
Select column_name,data_type
from information_schema.columns where table_name='traindata';

-- Checking  different column_name in different table  . 
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'traindata'
EXCEPT
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'testdata';

alter table traindata rename transaction_data to transaction_date ;

Select column_name,data_type from information_schema.columns where table_name ='testdata';

Select column_name,data_type from information_schema.columns where table_name = 'traindata' order by column;

-- Changing the data type of transaction_date column inside the traindata  
alter table traindata alter column transaction_date type date using TO_DATE(transaction_date,'YYYY-MM-DD');

Select * from traindata limit 10 ;

Select * from trainview ; 
drop table trainview ;


create view trainview as (select * from traindata order by transaction_id limit 10000 );
Select * from trainview ; 



Select column_name,data_type from information_schema.columns 
where table_name = 'trainview';





