use moviesdb;
select title,release_year from movies where studio="Marvel Studios";
select title from movies where title like "%avengers%";
select release_year from movies where title="The Godfather";
select distinct studio from movies ;
select title, release_year from movies order by release_year desc;
select title from movies where release_year=2022;
select title from movies where release_year>2020 and imdb_rating>8;
select title from movies where studio in("marvel studios","homable films");
select release_year from movies where title like "%thor%";
select * from movies where studio!="Marvel Studios";
select count(*) from movies where release_year between 2015 and 2022;
select 
max(release_year) as max_year, min(release_year) as min_value
from movies;
select count(movie_id) from movies where release_year=2018;
select *,
(revenue-budget/budget)*100 as profit_per from financials;

select currency,
count(*) as cnt
from financials
group by currency
order by cnt;

select release_year,
count(*) as cnt
from movies
group by release_year
order by cnt desc;

select movie_id, title,language_id,name as lang_type
from movies 
join languages
using(language_id);

select language_id,
count(movies.title) as cnt
from movies 
join languages
using(language_id)
group by language_id
order by cnt desc;
use moviesdb;

select *,
case
 when unit='thousands' then round((revenue-budget/1000),2)
 when unit='billions' then round((revenue-budget*1000),2)
--  when unit='millions' then revenue
 else round(revenue-budget,2)
 end as profit_mil
from movies 
join financials
using(movie_id)
where industry="bollywood" and release_year between 2015 and 2021
order by profit_mil desc;
