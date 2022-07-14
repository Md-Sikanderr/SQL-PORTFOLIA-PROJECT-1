
-- --------------------------------------Analyzing Census 2011 data-----------------------------------------------------

-- Total number of record in a dataset
select count(*) from census;

-- Distinct State that is present in our data
select distinct state_name from census;

-- Count the number of district present in each state
select State_name,count(District_name) as "Total number of District"
from census group by State_name;

-- Total population in 2011
select sum(population) as Total_Popululation2011 from census;

-- Average population in each state
select state_name,avg(population) as Avg_Population 
from census 
group by state_name;

-- Top 3 states with most number of population
select state_name,population from census as c
where 3 >= (select count(distinct(Population)) from census d 
where c.population<=d.population) 
order by population desc;

-- Alternate way of finding top 3 highest populated state 
SELECT STATE_NAME,POPULATION 
FROM CENSUS 
ORDER BY POPULATION DESC 
LIMIT 3;

-- literate percentage of each states
select distinct state_name,round((Literate/sum(Population)*100),2) as Literate_percentage 
from census 
group by state_name;

-- Top and bottom 3 state in literacy rate
select * from (select state_name,avg(literate) as Avg_Literate
from census
group by state_name
order by avg_literate desc limit 3) as a
union
select * from (select state_name,avg(literate) as Avg_Literate
from census
group by state_name
order by avg_literate asc limit 3) as b;

-- percentage of male literate in each state
select  distinct state_name,Male,(literate/sum(male)*100) as Literacy_per 
from census 
group by State_name;

select * from census;

-- percentage of female of literate in each state
select  distinct state_name,Female,(literate/sum(Female)*100) as Literacy_per 
from census 
group by State_name;

-- Top 5 state that have highest male_workers
select state_name,male_workers
from census a
where 5>=(select count(distinct(Male_workers)) from census b 
where a.Male_workers<=b.Male_workers) 
group by State_name
order by Male_workers desc;

-- top 5 states where female worker are maximum
select distinct state_name,Female_workers from census order by Female_workers desc limit 5;

-- Top 3 hindus dominant states according to census 2011
select state_name,sum(hindus) as TotalHinduspresent 
from census 
group by state_name 
order by TotalHinduspresent desc 
limit 3;

-- Top 3 muslims dominant states 
select state_name,sum(muslims) as TotalMuslimspresent 
from census 
group by state_name 
order by Totalmuslimspresent desc 
limit 3;

-- Check percentage of people available in each state according to age group 
select state_name,(age_group_0_29/sum(age_group_0_29)*100) as 'Age between 0 to 29',
(age_group_30_49/sum(age_group_30_49)*100) as 'Age between 30 to 49',
(age_group_50/sum(age_group_50)*100) as 'Age 50'
 from census group by state_name;
 
-- regional diversity percentage of each state 
select state_name,round((hindus/sum(Population)*100),2) as 'Hindus percentage',
round((muslims/sum(Population)*100),2) as 'Muslims percentage',
round((sikhs/sum(Population)*100),2) as 'Sikhs percentage',
round((christians/sum(Population)*100),2) as 'Christians percentage',
round((Buddhists/sum(Population)*100),2) as 'Buddhists percentage',
round((jains/sum(Population)*100),2) as 'jains percentage'
 from census group by state_name;


