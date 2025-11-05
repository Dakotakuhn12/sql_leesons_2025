/* Group by, Count, having, Aggregate Functions (Sub, min or Max) */

/* Simple Count Function */
-- find out how many records are in our games table of igdb
use igdb;
-- Count Function
select count(*) from games; -- 27054

-- how many of those are remakes (category 8)
select count(*) from games where category = 8; -- 186

-- Group by:
select count(*), category from games 
group by category;

-- What if I wanted to know what those categories were?

-- select * from games g inner join categories c on c.category_id = g.category;
select count(*), category, c.description from games g
inner join categories c on c.category_id = g.category
group by category;

-- the MAX function
use lahmansbaseballdb;
-- find the max salary in the salaries table
select Max(salary) from salaries; -- 33000000

-- who is it
-- let's use ORDER BY!
-- Use limit to get the first X records
select salary, p.nameFirst, p.nameLast from salaries s
inner join people p on p.playerID = s.playerID
order by salary desc -- says to order by salary in descending order
limit 1; -- says just give me the first record

-- SUM
-- See if we can find out how many wins and losses Cleveland (CLE) 
-- has in any series (World, Conference, Divisional)

select "CLE", sum(wins) as toatl_wins, sum(losses) as total_losses 
from seriespost where teamIDwinner = "CLE" or teamIDloser = "CLE";

-- Find out who has the most wins and losses all time
-- USe UNIONs?
-- ..and nested subqueries?!
select t.teamId, tf.franchName, sum(total_wins) as total_wins, sum(total_losses) From (
	select teamIDwinner as teamID, sum(wins) as total_wins, sum(losses) as total_losses
	from seriespost 
	group by teamIDwinner
	UNION
	select teamIDloser, sum(wins) as total_wins, sum(losses) as total_losses
	from seriespost 
	group by teamIDloser
)j
inner join(
select distinct teamId, franchId from teams
)t on t.teamId = j.teamID
inner join teamsfranchises tf on tf.franchId = t.franchId
group by franchName
order by total_wins desc;

-- seperate subquery here:
-- find all playerswhere they are in the hall fo fame:
select * from people where playerId in (select playerId from halloffame)

-- Having (it's like a second WHERE - executes after all original data is retrieved):
 select franchName, sum(total_wins) as total_wins, sum(total_losses) From (
	select teamIDwinner as teamID, sum(wins) as total_wins, sum(losses) as total_losses
	from seriespost 
	group by teamIDwinner
	UNION
	select teamIDloser, sum(wins) as total_wins, sum(losses) as total_losses
	from seriespost 
	group by teamIDloser
)j
inner join(
select distinct teamId, franchId from teams
)t on t.teamId = j.teamID
inner join teamsfranchises tf on tf.franchId = t.franchId
group by franchName
having total_wins > 100
order by total_wins desc;