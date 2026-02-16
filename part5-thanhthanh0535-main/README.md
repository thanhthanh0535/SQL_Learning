[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/n0EBx_QZ)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=16836791)
# Design Exercise 2

For this exercise, you will get a bit more experience with database design. This
time, things are getting a bit more complex. The instructions for this are
largely the same as the first one, so if you're 100% comfortable with them, you
can skip below to the two scenarios.

## The Language

As with earlier assignments, you'll be using DBML. The [language
specifications](https://dbml.dbdiagram.io/docs/) available. However, most of
what you need is at the very top in an example. There is also a supplementary
video for these design exercises, so make sure you have watched that before
moving on.

Note that there is an extension added to VSCode (Codespaces) that allows you to
visualize the datamodel as it is intended to be viewed--as a ERD using crow's
feet. One of the buttons in the top right of a DBML file will open the file in
preview mode. The actual GOAL of the exercise is this visual model, so YOU
SHOULD OPEN, VIEW, and ARRANGE your data model.

  > Tip:
    The DBML syntax allow for 2 methods of specifying foreign key relationships. The first is showin in the example with separate `ref:` entries added after the tables. I personally find it more intuitive to spefify the foreign key references alongside the keys themselves. This might look as follows:

    Table users {
      uid number [pk]
      ...
    }

    Table posts {
      pid number [pk]
      uid number [ref: > users.uid]
      ...
    }

## Your Tasks

In general, for two scenarios, you are designing a data model to match the
specified requirements and then demonstrating a couple of simple queries to
"exercise" that data model.

You will be creating a separate diagram for each of the scenarios. Specifically, you'll:

  * Add the tables to the diagram
    - Add the tables and fields specified in the Table Facts
    - Identify or add required primary key field(s)
    - Add two additional fields to each table (made up but make sure they are logical)
    - Assign appropriate data types to each field
  * Define the relationships
    - Based on the Relationship Facts, determine the degree and cardinality for all necessary relationships
    - Add a foreign key field(s) (w/ data type) for each relationship
      * Add an associative entity if required
    - Define the relationships between primary and foreign keys to "draw" them on the diagram

For now, keep the data types really simple. Don't bother with VARCHAR or INT or CHAR or such. Just the basics. Use:

  * string
  * number
  * datetime
  * boolean

Lastly you will just write queries to "test" your design. These WILL NOT RUN. They
are to show that you understand the data your tables contain and how you will
query them to answer basic questions. Include the SELECT, FROM, JOIN/ON, and
WHERE clauses.

Your database design will go in scenario_X.dbml.

Your queries will go in scenario_X_queries.md.

## Scenario 3: FootballTeams & Matches & Seasons

The English Premier League wants a database of all football (soccer for us
Yanks) teams. They also want to track all matches across all seasons.

 > __NOTE__: This one is intentionally tricky. The concept here is super simple
 > and common. Teams and matches. No big deal. But the relationships here are
 > not obvious, and the queries are thusly also not straightforward. You have
 > the knowledge to do these, so try your best.

Table Facts:

  * Each FootballTeam has a Name and a City
    - Neither is unique as a city can have multiple teams and a team name can be
      shared by multiple cities (especially if that name is "United" or "City"
      or "FC" 🙄)
  * Each Match has a StartTime and a Location
  * Each Season has a StartDate and an EndDate (don't have to add fields to this
    one)

Relationship Facts:

  * Each Season has numerous Matches (at least one), but a given Match occurs in
    only one Season
  * A Match is between exactly two teams (a home team and an away team)
    - The same two teams can have matches more than one time in a given season.
    - Hint: you may need TWO foreign keys to the SAME table, one for Home and
      one for Away

Queries:

  * Display both of the team cities, team names, start time and location of all matches
    for the season that starts on "3/4/2025"
  * Display the start time, location, and the city and name of both teams for
    all matches involving "Manchester City" (whether they are home or away)



## Scenario 4: TeamMembers & Tasks & Assignments

You have a team project. You've been burned in the past by members not doing work or claiming that they couldn't remember what they were supposed to do or when they were supposed to finish. So you want to create a simple database to capture tasks, assign them to each team member, and mark when they are completed.

Table Facts:

  * Sorry, you're on your own for this one

Relationship Facts:

  * Yep, still on your own

Queries:

  * Show the name and due date for all tasks due before a specified date (e.g., by next Friday)
  * Show the name and due date for all tasks assigned to a specified team member—filter by that team member's name
  * Show the team member name, task name, and due date for all tasks that have not been marked as completed

## Submission

As before, when finished:

  * Switch to the source control tab on the left
  * Add a commit message
  * Click the Commit button
  * Sync the changes
  * __CHECK THE GITHUB REPOSITORY TO ENSURE THAT YOUR CHANGES WERE SYNCHRONIZED PROPERLY__
  * Copy and paste the commit ID from the GitHub repository into the submission comment in D2L and submit.
