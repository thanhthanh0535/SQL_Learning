[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/cCGPMAoD)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=16680838)
# Design Exercise 1

For this exercise, you will get acquainted with a new tool that enables you to
design databases using a very simple programming language. I know. ANOTHER
language! Don't worry. It is truly very simple.

## The Language

The language is called DBML, which as you might expect is short for Database
Markup Language. It's proposed as a standard by a small company. In reality,
it's NOT a standard. But it's a really nice and easy way to create a database
design without using a complex tool or having to learn the ins and outs of SQL's
DDL syntax.

The first thing to do is just to get familiar with the language. There are [full
language specifications](https://dbml.dbdiagram.io/docs/) available. However,
most of what you need is at the very top in an example. There is also a
supplementary video for these design exercises, so make sure you have watched
that before moving on.

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

## Scenario 1: Universities & Colleges & Programs

The University System of Georgia wants a database of all of the Universities in in the state of Georgia. For each University, they wish to be able to display a list of Colleges as well as a list of all possible degree Programs (i.e., majors).

Table Facts:

  * Each University has a Name and a City
  * Each College has a Name and a Phone Number
  * Each Program has a Name (e.g., "Information Technology" or "Cybersecurity") and a Degree (e.g., "B.S." or "B.A.")
  * The Name of a College may not be unique (e.g., "College of Business" at multiple Universities)
  * The Degree and Name of a Program may not be unique (e.g., "B.S. in Computer Science" at multiple Universities)

Relationship Facts:

  * A University can have many Colleges, and must have at least one
  * A College must belong to exactly one University
  * A College can have many Programs, though it is also possible for a College to have no Programs at all
  * A Program must belong to exactly one College

Queries:
  * Show University Name and College Name for all Colleges in all Universities
  * Show the University Name and College Name for all Colleges that have a "B.S." in "Cybersecurity"

## Scenario 2: BasketballTeam & Players

The WNBA needs a simple database to track which team any given player is assigned to. However, because of trades, they need to track history of where players have been in the past, as well as their current assignment, making this a bit trickier than it might at first seem…like perhaps there is a need to associate teams to players and capture information about that association using a table that just might not be listed in the heading above. Hmm...

Table Facts:
  * A BasketballTeam has a city and name
    - A city my have multiple teams, but there are no duplicate names
  * A Player has a name and a position
    - No guarantee that first, last or the combination thereof is unique
Relationship Facts:
  * A BasketballTeam has many Players (must have at least one…well five, but the database can only enforce one)
  * Over time, a Player can be assigned to many different BasketballTeams
  * It is possible for a Player to be assigned to the same BasketballTeam multiple times
  * You must record the date a player is assigned to a team and (if appropriate) when they left

Queries:

  * Show the name and position of all players that are currently assigned to the Atlanta Dream
  * Show the name and start and end dates for all teams that Brittney Griner has played for
