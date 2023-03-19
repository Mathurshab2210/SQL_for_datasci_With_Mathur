SELECT * FROM food_db.items;
use food_db;
select * ,
concat(name,variant_name) as combination_name,
(price+variant_price) as final_price
 from items 
 cross join variants;
 
 use moviesdb;
 select m.movie_id,a.name,m.title
 from movies m
 join movie_actor ma
 on m.movie_id=ma.movie_id
 join actors a 
 on a.actor_id=ma.actor_id;
 
 select title,m.movie_id,group_concat(a.name)
 from movies m
 join  movie_actor  ma
 on m.movie_id=ma.movie_id
 join actors a
 on a.actor_id=ma.actor_id
 group by m.movie_id;
 
 select a.name ,group_concat(m.title separator " | ") as movies,
 count(m.title) as no_of_movies
 from actors a 
 join movie_actor ma
 on a.actor_id=ma.actor_id
 join movies m
 on m.movie_id=ma.movie_id
 group by a.name
 order by no_of_movies desc;
 
 select 
 m.title,revenue,currency,unit,
 case
 when unit="thousand" then revenue/1000
 when unit="billions" then revenue*1000
 else revenue
 end as revenue_mil
 from movies m
 join financials f
 on m.movie_id=f.movie_id
 join languages l
 on m.language_id=l.language_id
 where l.name="Hindi"
 order by revenue_mil;