-- DATE AND TIME FUNCTIONS 
Select * from  trainview ;


-- Current Time and Date 
Select current_date ; 
Select current_time ;
Select current_timestamp ; 
Select now() ;


-- Extract Date Part 
Select * from trainview;
alter table trainview add column new_dob date;
update trainview set new_dob = to_date(dob,'YYYY-MM-DD') ;
Select extract(year from to_date(dob,'YYYY-MM-DD')) from trainview ;

Select extract(month from new_dob) from trainview ;

Select extract(day from new_dob) from trainview;

Select extract(hour from new_dob) from trainview ;

Select extract(minute from new_dob) from trainview;


-- DATE PART 
Select Date_part('year',current_date);
Select Date_part('month',current_date);
Select Date_part('day',current_date) ; 


-- AGE 
Select new_dob-current_date  from trainview; 


-- INTERVAL
Select now() + interval '7 days'
Select now() - interval '2 months' ; 
Select now() + interval '5 days' +interval '5 months' ; 


-- DATE TRUNC 
Select Date_trunc('day',now()) ; 
Select Date_trunc('month',now())
select Date_trunc('year',now()); 

