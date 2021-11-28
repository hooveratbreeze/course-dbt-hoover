### Week 1

#### 1) How many users do we have? 

``` select count(distinct id) from stg_users ```

= 130 users

#### 2) On average, how many orders do we receive per hour?

```
with orders_by_hour as 
  (select count(*), date_trunc('hour', created_at) as hour 
   from stg_orders group 
   by date_trunc('hour', created_at)) 
   select round(avg(count)) 
   from orders_by_hour
```

=8 orders per hour

#### 3) On average, how long does an order take from being placed to being delivered?

```
select 
avg((delivered_at - created_at))
from stg_orders
where status = 'delivered'
```

=3.92 days to deliver

#### 4) How many users have only made one purchase? 

```
select user_id from stg_orders 
group by user_id having count(*) = 1
```

=25 users

#### Two purchases? 

```
select user_id from stg_orders 
group by user_id having count(*) = 2
```

=22 users

#### Three+ purchases?

```
select user_id from stg_orders 
group by user_id having count(*) >= 3
```

=81 users


#### 5) On average, how many unique sessions do we have per hour?

```
with sessions_agg as 
(select count
(distinct session_id) distinct_session_id,
 date_trunc('hour', created_at) session_hr 
 from stg_events 
 group by date_trunc('hour', created_at) 
)
select round(avg(distinct_session_id),2) unique_sessions from sessions_agg
```

=7.39 average sessions per hour 


### Week 2

#### 1) What is our user repeat rate?
80.5%

#### 2) What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?

Good indicators of users who will likely purchase again are multiple sessions of page visits spanning timeframes past their intitial order date period. On the flip side a user that registers no new sessions past their first order received date is likely not going to repeat purchase. If we had more data I'd look into creating a repeate purchase score that aggregates various user activity events into a preidictive/standardized metric.

#### 3) Explain the marts models you added. Why did you organize the models in the way you did?
I added in daily facts models into the marts for reporting that will allow business end users to quickly see their daily summaries.
