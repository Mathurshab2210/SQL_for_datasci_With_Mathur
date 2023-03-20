use moviesdb;
 select title,imdb_rating from movies where imdb_rating=
 (select max(imdb_rating) from movies);
 
 -- subquries can return
--  1.single value
--  2. list of values
--  3.tables
 select * from movies
 where imdb_rating in ((select min(imdb_rating) from movies), (select max(imdb_rating) from movies));
 
 select name ,year(curdate())- birth_year as age
 from actors
 having age between 70 and 85  ;
 
  -- using subquries to return table
  
  select * from
  (select name ,year(curdate())- birth_year as age
 from actors) as age_table
 where age between 70 and 85;
 
 select name,ma.movie_id 
 from actors a
 join movie_actor ma
 on ma.actor_id=a.actor_id
 join movies m
 on m.movie_id=ma.movie_id
 where m.movie_id in(101,110,121);
 
 select * from actors
 where actor_id in(select actor_id from movie_actor where movie_id in(101,110,121));
 
 select * from actors
 where actor_id=any(select actor_id from movie_actor where movie_id in(101,110,121));
 
 select * from
 movies where imdb_rating> any(select imdb_rating from movies where studio="Marvel Studios");