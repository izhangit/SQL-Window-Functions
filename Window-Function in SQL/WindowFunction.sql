--  create database windows; 
-- Window Function 

 create table test_data(
 	new_id int not null,
     new_cat varchar(255) not null
 );

--  Insert data into table 

 insert into test_data(new_id,new_cat)
 values (100,'Izhan'),
 	   (200,'Izhan'),
        (500,'Abdullah'),
        (700,'Abdullah'),
        (200,'Sam'),
        (300,'Sam'),
        (500,'Sam');
 -- Query
-- select * from test_data;  

select new_id, new_cat,
-- Aggregate Function

sum(new_id) over (partition by new_cat order by new_id) as "Total",
Avg(new_id) over (partition by new_cat order by new_id) as "Average",
Count(new_id) over (partition by new_cat order by new_id) as "Count",
Min(new_id) over (partition by new_cat order by new_id) as "Min",
Max(new_id) over (partition by new_cat order by new_id) as "Max"

from test_data;



 select new_id, new_cat,
 -- Aggregate Function

 sum(new_id) over (order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) as "Total",
 Avg(new_id) over (order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Average",
 Count(new_id) over (order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Count",
 Min(new_id) over (order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Min",
 Max(new_id) over (order by new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as "Max"

from test_data;

-- NOTE: Above we've used: "ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING" 
-- which will give a SINGLE output based on all INPUT Values/ Partition(if used)