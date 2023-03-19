select *, year(curdate())- birth_year as age
 from actors;
select age from actors;