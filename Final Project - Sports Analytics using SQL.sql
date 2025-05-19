--Final Project - Sports Analytics using SQL--
--In this project, you have to perform the job of a sports analyst--
--1)Create a table named ‘matches’ with appropriate data types for columns--
Create table Matches(
id int unique,
city varchar,
date date,
player_of_match varchar,
venue varchar,
neutral_venue int,
team1 varchar,
team2 varchar,
toss_winner varchar,
toss_decision varchar,
winner varchar,
result varchar,
result_margin int,
eliminator varchar,
method varchar,
umpire1 varchar,
umpire2 varchar);
select * from Matches;

--2)Create a table named ‘deliveries’ with appropriate data types for columns--
create table Deliveries(
id int not null,
innings int,
over int,
ball int,
batsman varchar,
non_striker varchar,
bowler varchar,
batsman_runs int,
extra_runs int,
total_runs int,
is_wicket int,
dismissal_kind varchar,
player_dismissed varchar,
fielder varchar,
extra_type varchar,
batting_team varchar,
bowling_team varchar);
select * from deliveries;

--3)Import data from csv file ’IPL_matches.csv’ attached in resources to the table ‘matches’ which was created in Q1--
--4)Import data from csv file ’IPL_Ball.csv’ attached in resources to the table ‘deliveries’ which was created in Q2--
--5)Select the top 20 rows of the deliveries table after ordering them by id, inning, over, ball in ascending order--
select id,innings,over,ball from Deliveries order by id limit 20;

--6)Select the top 20 rows of the matches table--
select * from matches limit 20;

--7)Fetch data of all the matches played on 2nd May 2013 from the matches table--
select * from Matches where date='02-05-2013';

--8)Fetch data of all the matches where the result mode is ‘runs’ and margin of victory is more than 100 runs--
select * from Matches where result='runs'and result_margin>100;

--9)Fetch data of all the matches where the final scores of both teams tied and order it in descending order of the date.--
select * from Matches where result='tie' order by date desc;

--10)Get the count of cities that have hosted an IPL match--
select count(distinct city) as Hosted_cities from Matches;

/*11)Create table deliveries_v02 with all the columns of the table ‘deliveries’ 
and an additional column ball_result containing values boundary, 
dot or other depending on the total_run (boundary for >= 4, dot for 0 and other for any other number)
(Hint 1 : CASE WHEN statement is used to get condition based results)
(Hint 2: To convert the output data of select statement into a table, you can use a subquery. 
Create table table_name as [entire select statement]*/
create table deliveries_v02 as 
select *,
case
when total_runs>=4 then 'boundry'
when total_runs=0 then 'dot'
else 'other'
end as ball_result 
from Deliveries;

select * from deliveries_v02;

--12)Write a query to fetch the total number of boundaries and dot balls from the deliveries_v02 table--
select count(ball_result) as result1 from deliveries_v02 where ball_result='boundry';
select count(ball_result) as result2 from deliveries_v02 where ball_result='dot';

/*13)Write a query to fetch the total number of boundaries scored by each team from the deliveries_v02 table
and order it in descending order of the number of boundaries scored*/
select batting_team,count(ball_result)
from deliveries_v02 
where ball_result='boundry' 
group by batting_team 
order by count(ball_result) desc;

/*14)Write a query to fetch the total number of dot balls bowled by each team
and order it in descending order of the total number of dot balls bowled*/
select batting_team,count(ball_result)
from deliveries_v02
where ball_result='dot'
group by batting_team
order by count(ball_result) desc;


--15)Write a query to fetch the total number of dismissals by dismissal kinds where dismissal kind is not NA--
select count(dismissal_kind) from deliveries_v02 where dismissal_kind not like 'NA'; 
select dismissal_kind,count(dismissal_kind) from deliveries_v02 
where dismissal_kind not like 'NA' group by dismissal_kind; 

--16)Write a query to get the top 5 bowlers who conceded maximum extra runs from the deliveries table--
select bowler,max(extra_runs) from deliveries_v02 group by bowler order by max(extra_runs) desc limit 5;

/*17)Write a query to create a table named deliveries_v03 with all the columns of deliveries_v02 table
and two additional column (named venue and match_date) of venue and date from table matches*/
create table deliveries_v03 as
select deliveries_v02.*,Matches.venue,Matches.date
from deliveries_v02
join Matches
on Matches.id=deliveries_v02.id;
select * from Matches;

select * from deliveries_v03;

/*18)Write a query to fetch the total runs scored for each venue and 
order it in the descending order of total runs scored*/
select venue,total_runs from deliveries_v03 group by venue,total_runs order by total_runs desc;

/*19)Write a query to fetch the year-wise total runs scored at Eden Gardens 
and order it in the descending order of total runs scored*/
select extract(year from date) as year_total_runs,total_runs
from deliveries_v03 
where venue='Eden Gardens'
group by total_runs,year_total_runs
order by total_runs desc;

/*20)Get unique team1 names from the matches table, 
you will notice that there are two entries for Rising Pune Supergiant one with Rising Pune Supergiant 
and another one with Rising Pune Supergiants. 
Your task is to create a matches_corrected table with two additional columns team1_corr and team2_corr 
containing team names with replacing Rising Pune Supergiants with Rising Pune Supergiant. 
Now analyse these newly created columns*/
select * from Matches;
select distinct(team1) from Matches;
create table matches_corrected as
select *,
    case 
       when team1 = 'Rising Pune Supergiants' then 'Rising Pune Supergiant'
        else team1
    and as team1_corr,
    case
        when team2 = 'Rising Pune Supergiants' then 'Rising Pune Supergiant'
        else team2
    end as team2_corr,
from
    Matches;
select * from matches_corrected;

/*21)Create a new table deliveries_v04 with the first column as ball_id containing information of
match_id, inning, over and ball separated by ‘-’ (For ex. 335982-1-0-1 match_id-inning-over-ball)
and rest of the columns same as deliveries_v03)*/
select * from deliveries_v03;
create table deliveries_v04 as
select 
concat(id,'-',innings,'-',over,'-',ball) as ball_id,*
from deliveries_v03;

select * from deliveries_v04;

--22)Compare the total count of rows and total count of distinct ball_id in deliveries_v04--
select count(*) as total_rows,
count(distinct ball_id) as distinct_ball_id
from deliveries_v04;

/*23)SQL Row_Number() function is used to sort and assign row numbers to data rows in the presence of multiple groups.
For example, to identify the top 10 rows which have the highest order amount in each region,
we can use row_number to assign row numbers in each group (region) with any particular order 
(decreasing order of order amount) and then we can use this new column to apply filters.
Using this knowledge, solve the following exercise. You can use hints to create an additional column of row number.
Create table deliveries_v05 with all columns of deliveries_v04 and 
an additional column for row number partition over ball_id. 
(HINT : Syntax to add along with other columns,  row_number() over (partition by ball_id) as r_num)*/
CREATE TABLE deliveries_v05 AS
SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY ball_id ORDER BY ball_id) AS r_num -- Assign row numbers partitioned by ball_id
FROM 
    deliveries_v04;

select * from deliveries_v05;

SELECT ball_id, r_num
FROM deliveries_v05
ORDER BY ball_id
LIMIT 10;

/*24)Use the r_num created in deliveries_v05 to identify instances where ball_id is repeating.
(HINT : select * from deliveries_v05 WHERE r_num=2;)*/
select ball_id,count(ball_id) as repeat_Count
from deliveries_v05
group by ball_id
having count(ball_id)>1;

/*25)Use subqueries to fetch data of all the ball_id which are repeating. 
(HINT: SELECT * FROM deliveries_v05 WHERE ball_id in (select BALL_ID from deliveries_v05 WHERE r_num=2)*/
SELECT *
FROM deliveries_v05
WHERE ball_id IN (
    SELECT ball_id
    FROM deliveries_v05
    GROUP BY ball_id
    HAVING COUNT(*) > 1
);			   
