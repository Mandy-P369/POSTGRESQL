Select * from traindata ;
Select count(*) from traindata where gender ='F';
Select count(*) from traindata where gender = 'M' ;
Select * from testdata ;

SELECT column_name, data_type
FROM information_schema.columns 
join information_schema.constraints
WHERE table_name = 'traindata';

Select count(distinct cc_num) from traindata ;

Select count(distinct cc_num) from testdata ;

Select count(distinct trans_num) from traindata ;

ALTER TABLE traindata
ADD CONSTRAINT pk_trans_num
PRIMARY KEY (trans_num);


SELECT
    c.column_name,
    c.data_type,
    tc.constraint_type
FROM information_schema.columns c
LEFT JOIN information_schema.key_column_usage kcu
    ON c.table_name = kcu.table_name
   AND c.column_name = kcu.column_name
LEFT JOIN information_schema.table_constraints tc
    ON kcu.constraint_name = tc.constraint_name
   AND kcu.table_name = tc.table_name
WHERE c.table_name = 'traindata'
  AND c.table_schema = 'public';



ALTER TABLE testdata
ADD CONSTRAINT fk_trans_num
FOREIGN KEY (transaction_id)
REFERENCES traindata(trans_num);

