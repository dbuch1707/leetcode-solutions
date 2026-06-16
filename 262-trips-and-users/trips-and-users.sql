select request_at as 'Day',
round(sum(case when status='cancelled_by_driver' or status='cancelled_by_client' then 1 else 0 end)/count(request_at),2) as 'Cancellation Rate'
from Trips t
join Users u on t.client_id=u.users_id
and u.banned='No'
join Users c on t.driver_id=c.users_id
and c.banned='No'
where request_at between '2013-10-01' and '2013-10-03'
group by request_at;