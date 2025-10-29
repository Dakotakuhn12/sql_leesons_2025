select nameFirst, nameLast from people p 
inner join halloffame h on p.playerID = h.playerID
where h.yearID = 2017 and h.inducted = 'Y';

---------------------------------------------

select nameFirst, nameLast from people p
inner join fielding f on p.playerID = f.playerID
where f.POS = '1B' and f.teamID = 'PIT' and f.yearID = 2012;

---------------------------------------------

select b.*, a.gameID, a.startingPos from allstarfull a
left join batting b on a.playerID = b.playerID
where b.yearID = 2015 and b.G >= '100' and b.teamID = 'PIT';

----------------------------------------------

select a.gameID, a.GP, p.* from allstarfull a
right join pitching p on a.playerID = p.playerID
where p.teamID = 'PIT' and p.yearID = 2015 and p.W >= 7;

-----------------------------------------------

select p.playerID, schoolID from pitching p
left join  collegeplaying c  on p.playerID = c.playerID
where p.teamID = 'BOS' and p.yearID = 2018 and p.playerID like '%01';

-----------------------------------------------

select p.playerID, nameFirst, nameLast, b.yearID as LastBattingYear ,
m.yearID as LastManagingYear from people p
inner join batting b on p.playerID = b.playerID
inner join managers m on b.playerID = m.playerID
where m.yearID >= 2010 and b.yearID >= 2010;

