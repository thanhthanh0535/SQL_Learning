# Scenario 2 Queries

## 1

Show the name and position of all players that are currently assigned to the
Atlanta Dream

```

SELECT bs.TeamName, pers.playerName, pers.position 
FROM Players as pers
JOIN BasketballTeams as bs
    ON bs.TeamName = pers.TeamName
WHERE bs.TeamName LIKE "Atlanta Dream";
```


## 2

Show the name and start and end dates for all teams that Brittney Griner has played for

```
SELECT bs.TeamName, pers.playerName, pers.start_date, pers.end_date
FROM Players as pers
JOIN BasketballTeams as bs
    ON bs.TeamName = pers.TeamName
WHERE Players.playerName LIKE "Brittney Griner";

```

