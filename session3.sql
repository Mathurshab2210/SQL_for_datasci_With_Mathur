use moviesdb;
SELECT * FROM moviesdb.financials;
select *, (revenue-budget) as profit from financials;
select currency,count(*) as cnt
from financials
group by currency
order by cnt;

-- currency conversion 
select *,
if(currency="usd",revenue*80,revenue) as revenue_inr
from financials;

select distinct unit from financials;

-- case statement
select *,
case
 when unit='thousands' then revenue/100
 when unit='billions' then revenue*100
--  when unit='millions' then revenue
 else revenue
 end as rev_mil
 from financials;
 
  select 
        *, 
    (revenue-budget) as profit, 
    (revenue-budget)/budget *100 as profit_pct 
   from financials;


select 
m.movie_id,title,unit,budget,revenue
from movies m
join financials f
on m.movie_id=f.movie_id
where title like "%thor%";
 
select 
m.movie_id,title,unit,budget,revenue
from movies m
 left join financials f
on m.movie_id=f.movie_id
where unit is Null;
 
select 
f.movie_id,title,unit,budget,revenue -- we are using right table movie+id here coz right table in use
from movies m
right join financials f
on m.movie_id=f.movie_id
where title is null;


select 
m.movie_id,title,unit,budget,revenue
from movies m
 left join financials f
on m.movie_id=f.movie_id

UNION

select 
f.movie_id,title,unit,budget,revenue -- we are using right table movie+id here coz right table in use
from movies m
 right join financials f
on m.movie_id=f.movie_id;


select 
movie_id,title,unit,budget,revenue
from movies
left join financials
using(movie_id);

select 
movie_id,title,language_id,name as language_used
from movies 
join languages
using(language_id);

select 
movie_id,title,language_id,name as language_used
from movies 
join languages
using(language_id)
where name="telugu";

select 
name,
count(movies.title) as cnt
from movies 
join languages
using(language_id)
group by name
order by cnt desc;


select imdb_rating,
count(title) as cnt 
from movies
group by imdb_rating
order by cnt desc;



 
 