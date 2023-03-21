use moviesdb;
select title, release_year from movies 
where release_year =(select min(release_year) from movies) 

union
select title, release_year from movies 
where release_year =(select max(release_year) from movies) ;

select *
from movies
where imdb_rating>(select round(avg(imdb_rating),2) from movies)
order by imdb_rating desc;