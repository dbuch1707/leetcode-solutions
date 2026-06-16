with cons as 
(select num,
lead(num,1) over (order by id) as next,
lead(num,2) over (order by id) as next_by_1 from Logs)

select distinct num as ConsecutiveNums from cons
where num=next and num=next_by_1
;