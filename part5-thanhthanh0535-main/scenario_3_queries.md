# Scenario 3 Queries

## 1

Display both of the team cities, team names, start time and location of all
matches for the season that starts on "3/4/2025".

```
[WRITE YOUR SQL HERE]

SELECT f.cities, f.home_team_name, f.away_team_name, m.location, m.starttime
FROM Footballteam AS f
JOIN Match as m
    ON f.home_team_name = m.home_team_name
WHERE m.starttime LIKE "3/4/2025";

## 2

Display the start time, location, and the city and name of both teams for all
matches involving "Manchester City" (whether they are home or away)

```
[WRITE YOUR SQL HERE]
```
SELECT f.cities, f.home_team_name, f.away_team_name, m.location, m.starttime
FROM Footballteam AS f
JOIN Match as m
    ON f.home_team_name = m.home_team_name
WHERE f.home_team_name LIKE "Manchester City"
    OR f.away_team_name LIKE "Manchester City";
