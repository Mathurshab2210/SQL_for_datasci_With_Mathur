use moviesdb;
show tables;
select * from moviesdb.financials;
select budget,revenue from moviesdb.financials;
select * from movies;
select count(*) from movies where industry="Hollywood";
select distinct studio from movies;
select * from movies where title LIKE "%thor%";
select count(*) from movies where studio="Marvel";
select studio from movies;
select title from movies;
select * from movies where studio ="";
select * from movies where imdb_rating>=9 and studio like "%production%";
select * from movies where imdb_rating between 6 and 8;
select count(*)from  movies where release_year in(2022,2018,2016);--  also works on text column
select * from movies where imdb_rating is NULL;
select * from movies where imdb_rating is NOT NULL;
select * from movies where industry="bollywood" order by imdb_rating; -- by default assending order
select * from movies where industry="bollywood" order by imdb_rating DESC; 
select * from movies where industry="bollywood" order by imdb_rating DESC limit 5 offset 4 ;
 select title,release_year from movies where studio="marvel Studios";
select * from movies  where title like "%avenger%";
select release_year from movies where title="the godfather";
select distinct studio from movies where industry="bollywood";
select * from movies order by release_year desc;
select * from movies where release_year=2022;
select * from movies where release_year>2020 and imdb_rating>8 ;
select * from movies where studio in("Marvel studios","hombale films");
select title, release_year from movies 
   where title like '%thor%' order by release_year asc;
    select * from movies where studio!="marvel studios";
    
select min(imdb_rating) as min_rating,
max(imdb_rating) as max_rating,
round(avg(imdb_rating),2) as avg_rating from movies where studio="marvel studios";

select studio, count(*)  as cnt 
from movies group by studio
order by cnt desc;

select industry, count(*)  as cnt,
avg(imdb_rating) as avg_rating,
max(imdb_rating) as  max_rating,
min(imdb_rating) as min_rating
from movies group by industry
order by cnt desc;

select count(*)
 from movies where release_year between 2015 and 2022;
 select max(release_year) as max_year,
 min(release_year)  as min_yr from movies;
 
 select imdb_rating, count(*)  as cnt
 from movies
--  where title like "%thor%"
 group by imdb_rating
 having cnt=2
 order by cnt desc;
 
 SELECT count(distinct imdb_rating), STDDEV(imdb_rating) from movies;
 select title from movies where imdb_rating%2=0;
 select count(distinct title)as no_title from movies;














































