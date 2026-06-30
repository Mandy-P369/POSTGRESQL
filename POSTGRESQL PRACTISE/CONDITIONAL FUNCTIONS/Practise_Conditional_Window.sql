Select * from traindata order by transaction_id asc;
Select count(*) from traindata where gender ='F';
Select count(*) from traindata where gender = 'M' ;
Select * from testdata ;

create extension POSTGIS;

Select count(distinct cc_num) from traindata ;
Select distinct state from testdata ;


SELECT
    CASE
        WHEN state IN ('CT','ME','MA','NH','NJ','NY','PA','RI','VT')
            THEN 'North East'
        WHEN state IN ('IA','IL','IN','KS','MI','MN','MO','ND','NE','OH','SD','WI')
            THEN 'Mid West'
        WHEN state IN ('AL','AR','DC','FL','GA','KY','LA','MD','MS','NC','OK','SC','TN','TX','VA','WV')
            THEN 'South'
        WHEN state IN ('AK','AZ','CA','CO','HI','ID','MT','NM','NV','OR','UT','WA','WY')
            THEN 'West'
        ELSE 'Other'
    END AS Regions,
    ROUND(SUM(amt)::numeric, 2) AS Total_Amount,
	 DENSE_RANK() OVER (
        ORDER BY SUM(amt) DESC
    ) AS "Rank of Regions"
FROM traindata
GROUP BY Regions
ORDER BY Total_Amount desc ;

Select * from testdata  order by amt desc ;


-- Window Functions 

-- Flag each transaction as "High Risk", "Medium Risk", or "Low Risk" based on amount thresholds ,
-- you define (e.g., >10000 high, 1000-10000 medium, else low) using a CASE statement.

Select max(amt) from traindata ; 
Select * from testdata order by transaction_id desc limit 1 ;










