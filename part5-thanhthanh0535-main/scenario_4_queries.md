# Scenario 4 Queries

## 1
Show the name and due date for all tasks due before a specified date (e.g., by
next Friday)

```

[WRITE YOUR SQL HERE]

```
SELECT s.enddate, s.name_of_tasks
FROM schedule AS s
WHERE s.enddate <= '2024-6-11';

## 2

Show the name and due date for all tasks assigned to a specified team
member—filter by that team member's name

```
[WRITE YOUR SQL HERE]
```
SELECT s.enddate, s.name_of_tasks, t.member_name
FROM schedule as s
JOIN tasks as t
    ON s.name_of_tasks = t.name_of_tasks;

## 3

Show the team member name, task name, and due date for all tasks that have not
been marked as completed

```

[WRITE YOUR SQL HERE]

```
SELECT s.enddate, s.name_of_tasks, t.member_name
FROM schedule as s
JOIN tasks as t
    ON s.name_of_tasks = t.name_of_tasks
WHERE t.completed LIKE "FALSE" [note: meaning not finish yet];