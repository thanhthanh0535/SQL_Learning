# Scenario 1 Queries

## 1

Show University Name and College Name for all Colleges in all Universities.

```
SELECT uni.UniName, col.CollegeName
FROM University AS uni
JOIN College AS col
    ON uni.UniName = col.UniName;
```


## 2

Show the University Name and College Name for all Colleges that have a "B.S." in
"Cybersecurity"

```
SELECT uni.UniName, col.CollegeName, pro.Nameofprograms
FROM University AS uni
JOIN College AS col
    ON uni.UniName = col.UniName
JOIN Programs AS pro
    ON pro.Nameofprograms = col.Nameofprograms
WHERE pro.Nameofprograms LIKE "B.S." OR pro.Degree LIKE "B.S. in Cybersecurity";


```

