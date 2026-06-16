# Write your MySQL query statement below
with temp as (select id, recordDate, temperature as curr, lag(temperature) over (order by recordDate) as previous , lag(recordDate) over (order by recordDate) as prev_date from Weather)

select id from temp where curr>previous 
and datediff(recordDate, prev_date)=1