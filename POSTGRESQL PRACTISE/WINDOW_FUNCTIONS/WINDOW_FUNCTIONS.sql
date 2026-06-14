
-- WINDOW FUNCTIONS
Select * from university ;
Select * from colleges ;
Select distinct c.name from colleges c ;

Select college_id,c.name,
sum(c.college_id) over(partition by c.name order by  college_id) as "Total"
from colleges c ;


create table test_data(new_id integer,new_cat varchar(20));
Select * from test_data ;
insert into test_data(new_id,new_cat)values
(100,'Agni'),(200,'Agni'),(500,'Dharti'),(700,'Dharti'),(200,'Vayu'),(300,'Vayu'),(500,'Vayu');

Select * from test_data ;
SELECT
    new_id,
    new_cat,
    SUM(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Total",
    COUNT(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Count",
    ROUND(
        AVG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id),
        2
    ) AS "Average",
	min(new_id) over(partition by new_cat order by new_id) as "Minimum"
FROM test_data;

Select new_id,new_cat,
min(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "Minimum",
max(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "Maximum"
from test_data ;



-- ROW NUMBER 
Select new_id,new_cat,
row_number() over(order by new_id) as "Total_Row_number",
row_number() over(partition by new_cat order by new_id) as "Row_Number"
from test_data ;

--Rank
Select new_id,new_cat,
rank() over(order by new_id) as "Rank"
from test_data ;

-- Dense Rank
Select new_id,new_cat,
dense_rank() over(order by new_id) as "Dense Rank"
from test_data ;

Select new_id,new_cat,
dense_rank() over(order by new_id) as "Dense Rank"
from test_data ;

Select new_id,new_cat,
row_number() over(order by new_id) as "Row_number",
rank() over(order by new_id) as "Rank"
from test_data ;

SELECT new_id,new_cat,
       ROW_NUMBER() OVER(ORDER BY new_id) AS "Row_number",
       RANK() OVER(ORDER BY new_id) AS "Rank",
       DENSE_RANK() OVER(ORDER BY new_id) AS "Dense Rank",
       ROUND(
           PERCENT_RANK() OVER(ORDER BY new_id)::numeric,
           2
       ) AS "Percent Rank"
FROM test_data;