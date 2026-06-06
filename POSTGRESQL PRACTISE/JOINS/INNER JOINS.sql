								-- JOINS--
Select * from traindata ;
Select * from testdata ;

Select train.transaction_id,test.transaction_id,
concat(train.first,' ',train.last) as customer_name 
from traindata as train 
inner join 
testdata as test 
on train.transaction_id = test.transaction_id ;

create table innerjoin as (Select train.transaction_id,
concat(train.first,' ',train.last) as customer_name,train.amt
from traindata as train 
inner join 
testdata as test 
on train.transaction_id = test.transaction_id 
) ; 

Select * from innerjoin ;
drop table innerjoin ;

Select sum(amt) from innerjoin ; 


-- Total Amount of the remaining data on the both table except the data follow innner join 
Select 