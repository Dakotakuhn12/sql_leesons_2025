-- ============================================================
-- Lahman Baseball SQL Practice
-- Topic: GROUP BY, COUNT, HAVING, and Aggregate Functions
-- ============================================================
-- Instructions:
-- For each numbered prompt below, write your SQL query directly
-- underneath the comment block provided.
-- You may use MySQL Workbench or another MySQL client.
-- ------------------------------------------------------------

USE lahmansbaseballdb;

-- ============================================================
-- ⚾ BASIC AGGREGATES
-- ============================================================

-- 1. Count how many players are in the people table.
-- (Use COUNT())
-- Your Query:

select count(*) from people;

-- 2. Find the earliest and latest player debut years.
-- (Use MIN() and MAX() on debut_date)
-- Your Query:

select Min(debut_date),  Max(debut_date) from people;

-- 3. Determine how many teams exist in the teams table for each year.
-- (Use GROUP BY yearID)
-- Your Query:

select count(*), yearID from teams
group by yearID;

-- 4. Find the total number of home runs hit by all teams combined.
-- (Use SUM(HR))
-- Your Query:

select SUM(HR) from teams;

-- ============================================================
-- ⚾ GROUP BY PRACTICE
-- ============================================================

-- 5. Show each league’s total number of teams.
-- (Use GROUP BY lgID and COUNT())
-- Your Query:

select count(*), lgID from teams
group by lgID;

-- 6. Find the number of teams that participated each year in each league.
-- (Use GROUP BY yearID, lgID)
-- Your Query:

select count(teamID), yearID, lgID from teams
group by yearID, lgID;

-- 7. Calculate the average number of wins per league across all years.
-- (Use AVG(W) with GROUP BY lgID)
-- Your Query:

select AVG(W), lgID from teams
group by lgID;

-- 8. List the total attendance for each league and year combination.
-- (Use SUM(attendance) with GROUP BY yearID, lgID)
-- Your Query:

select SUM(attendance), yearID, lgID from teams
group by yearID, lgID;

-- ============================================================
-- ⚾ JOINING TABLES
-- ============================================================

-- 9. Show the total salary paid per team for a given year.
-- (Join salaries with teams; GROUP BY teamID, yearID)
-- Your Query:

select sum(s.salary), t.teamID, t.yearID from salaries s
inner join teams t on s.teamID = t.teamID
group by s.teamID, t.yearID;

-- 10. Find which player has the highest total salary over their career.
-- (Join salaries and people; SUM(salary) and GROUP BY playerID)
-- Your Query:

select SUM(s.salary), nameFirst, nameLast, p.playerID from salaries s
inner join people p on s.playerID = p.playerID
group by p.playerID order by sum(s.salary) desc limit 1 ; 

-- 11. Find the number of players per team who earned a salary that year.
-- Your Query:

select s.yearID,  count(s.playerID) , s.teamID from salaries s 
where s.salary > 0 
group by s.yearID,s.teamID
;

-- 12. List each team’s total home runs and total runs for a given season.
-- (Use GROUP BY teamID, yearID and aggregate both R and HR)
-- Your Query:



-- ============================================================
-- ⚾ USING HAVING
-- ============================================================

-- 13. Find all teams that scored more than 800 total runs in a season.
-- (Use HAVING SUM(R) > 800 after grouping)
-- Your Query:


-- 14. List franchises that have won more than 5000 total games across all years.
-- (Use SUM(W) and GROUP BY franchID, HAVING SUM(W) > 5000)
-- Your Query:


-- 15. Find players who have appeared in more than 150 games in a single season.
-- (Use appearances with GROUP BY playerID, yearID and HAVING SUM(G_all) > 150)
-- Your Query:


-- 16. Show all teams that had more than 90 wins and fewer than 60 losses in any season.
-- (Use HAVING SUM(W) > 90 AND SUM(L) < 60)
-- Your Query:


-- ============================================================
-- ⚾ MULTI-TABLE + AGGREGATION CHALLENGES
-- ============================================================

-- 17. Find the total postseason wins and losses for each franchise.
-- (Use seriespost, join to teams and teamsfranchises, group by franchName, sum wins and losses)
-- Your Query:


-- 18. Find the average ERA per franchise across all years.
-- (Join teams with teamsfranchises, group by franchName, and AVG(ERA))
-- Your Query:


-- 19. List all teams whose total attendance is above the league average for that year.
-- (Use a subquery to find league averages per year; compare using HAVING)
-- Your Query:


-- 20. Determine which franchises have the most Hall of Fame players.
-- (Join people and halloffame, GROUP BY franchID or birthCountry, COUNT(playerID))
-- Your Query:


-- ============================================================
-- END OF EXERCISE FILE
-- ============================================================
