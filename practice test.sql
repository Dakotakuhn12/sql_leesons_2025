/*
39	Query a database table (Simple SELECT)
40	Query a database table with a restricted result set (WHERE)
41	Query multiple database tables to retrieve specific records (JOIN)
42	Query a database and group the results
43	Create a database table
44	Update a row (or rows) in a database table based on a condition
45	Insert a row in a database table
*/

use igdb;
-- 39	Query a database table (Simple SELECT)

select * from games;

-- 40   Query a database table with a restricted result set (WHERE)
select * from games where name like '%island' and catergory = 2; -- like operator for wildcard

-- 41	Query multiple database tables to retrieve specific records (JOIN)
select * from games g
inner join websites w on w.game_id = g.game_id
where g.name like '%island';

-- 42	Query a database and group the results
select name, count(*) from games g
inner join websites w on w.game_id = g.game_id
where g.name like '%island'
group by game_id;

-- 43	Create a database table
drop table if exists monkey_business;
create table monkey_business (
	id int primary key,
    name varchar(40),
    releaseDate date,
    rating decimal (2,1)
);

-- 45	Insert a row in a database table
insert into monkey_business values (4, "some thing", "2025-10-12", 9.5);
insert into monkey_busniess (name, releaseDate, rating, id) values("some other thing", "2025-01-01", 8.4, 2);

-- 44	Update a row (or rows) in a database table based on a condition
update monkey_business set rating = 5.3 where release_date < "2025-10-10";

-- need to know unions (2 quaries with matching column types):
select game_id, url
from screenshots s
union
select game_id, url
from websites w;