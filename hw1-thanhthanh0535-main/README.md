[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/wGvctqhl)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15785170)
# AIST 3410 Homework 1

Welcome to Homework 1. Back to GitHub Codespaces and, more importantly, MariaDB!!

It's time to Git serious!!! (last "Git" pun, I promise)

## A) Start & Configure Your Codespace

You are likely already done with this step, but:

  1. Click on the GitHub Classroom invitation link provided.
  2. Accept the assignment.
  3. Open the repository in GitHub.
  4. "Code" the repository in a (probably new) Codespace.

## B) Load up your database

Okay, now that you're here, you need to start out in your Terminal window.
Recall that this is a standard Ubuntu Linux terminal running the Bash shell.
Which is to say, you're running commands on a real server in a very real-life
kind of scenario.

Well, except that your server is configured to be SUPER insecure. We'll address
that in a future assignment. For now, we just want to use this server to run
some queries.

Unfortunately, the database we want isn't yet loaded onto your server.

Fortunately, your workspace folder already contains the SQL code required to add
the database, tables, and data. There's 7930 lines of SQL, so all you have to do
is type in each of those lines. Let's get started.

Okay, I'm joking, but let's still make that happen.

In your bash shell, ensure that you are in the `/workspaces/hw1` directory (you
can see this directly from the prompt). Use the `ls` command (lowercase-L, not
numeral 1) to get a listing of the files in the current directory:

    @iamgroot ➜/workspaces/hw1 (main) $ ls

Uncoincidentally should see exactly
the same list of files in your explorer view.

  > ### NOTE ###
  > There are actually a lot more files and directories that are "hidden". Files
  > starting with a period on Mac and Linux-based operating systems are hidden
  > by default. If you DO want to see hidden files, add the -a argument to the
  > ls command (`ls -a`). In addition to .devcontainer, this also shows other
  > special, hidden directories: . , .. , .git, and .github. And if you want to
  > be cooler than your friends, you add the -l argument (`ls -al`) to see all
  > files including metadata like the permissions and the last modified date.
  > And to be even cooler, in THIS environment, just type `ll`, which is an
  > "alias" for `ls -alF`.

Assuming you see the files, you are in the right place. If not, then you
can simply type:

    cd /workspaces/hw1

to change directory to the right location.

Now, you want to start the MySQL client as you did the first time we visited
GitHub Codespaces. Connect as the super-user "root" using no password.

    @iamgroot ➜/workspaces/hw1 (main) $ mysql -u root

You should now be running the MySQL client, meaning that your commands should
now be SQL commands, not Bash shell commands. And again, you know this because
your command prompt has changed. Let's learn a useful MySQL command.

    MariaDB [(none)]> show databases;

Don't forget the semi-colon. If you leave it off, you'll be met with a continue
command prompt (`->`) asking you to finish your statement. But, you can just
type the ; here if you mess up.

As the command implies, this shows you the databases that are available. And
sadly, not a one of them is classicmodels. Let's remedy that.

Instead of typing in all of the SQL commands from the that classicmodels.sql
file, we can just tell the MySQL client to read and execute the contents using
the `source` command.

    MariaDB [(none)]> source classicmodels.sql;

Be ready for the screen to scroll a LOT. That's because it's running all 7930
lines of that SQL file. You should see a lot of "Query OK" messages. When it's
done, let's make sure things really worked.

The first clue that things are good is that the prompt likely changed to
indicate a new "active" database—from [`(none)`] to [`classicmodels`]. If not,
all might not be lost. Let's also run that `show databases` command again. You
SHOULD now see classicmodels. Good? Good.

Now let's make sure that it has data inside of it. Remember that the MySQL
prompt shows the active database. If it doesn't say classicmodels you'll need to
set it as the active database:

    MariaDB [(none)]> use classicmodels;

Once you've got the right database active, now let's make sure all of the tables
are there:

    MariaDB [classicmodels]> show tables;

You should see 8 familiar tables. Finally let's make sure the tables got loaded
with data:

    MariaDB [classicmodels]> SELECT COUNT(*) FROM orderdetails;

If you see 2996, then we're ready to move on. Go ahead and exit the MySQL client:

    MariaDB [classicmodels]> exit

That's not something that you'd normally need to do on a regular basis. Data is
USUALLY already in a database which is already loaded on database server. But
those four new MySQL commands:

  * `show databases;`
  * `show tables;`
  * `source [sqlfilename];`
  * `use [databasename];`

will be useful to know. Add them to your quiver. They may just show up in test
form.

We are also done with the Terminal for now, so feel free to hit the "X" on that
"pane" or toggle it closed with [Ctrl+~] or [Cmd+~] if you'd like so that you
have more room to write and test your queries. DO NOT close out of the browser
or tab as this will close your Codespace entirely…just the pane on the lower
right.


## C) Configure the MySQL VS Code Extension

This step is short, sweet, and important.

There is a MySQL extension for Visual Studio Code already installed in your
Codespace. You don't need to worry about how to install extensions for this
course (though it's dead simple), but I mention this because in a "vanilla"
install of VS Code, this will NOT be there. And while you can always edit SQL
(it's just text), you can't test it from within VS Code without an extension.

You DO, however, have to configure a connection for the extension to use. On the
far left of your window is the toolbar used to select panels (Explorer, Source
Control, etc.). You want to select the Database panel. This looks like a couple
of stacked cylinders (fun fact: this is a universal symbol for bulk storage
because it resembles the platters of a hard disk).

  1. Open the Database panel
  2. Click the "Create Connection" button
  3. Select the MariaDB tab (really MySQL works, too)
  4. Feel free to examine the default values, but currently for our environment you can leave them all as default
  5. Click Connect (which should add a "127.0.0.1@3306" entry in the Database panel on the left)
  6. Click Close
  7. Rejoice!!

## D) Write your Queries

![Classic Models Data Diagram](.res/classicmodels.png)

Each query for this assignment is in a separate file. Open the Explorer panel in
on the left and click sequentially through each of the queries.

You will need to set the "Active Connection" for the first query you write /
test for a given session. After that, you can test each query using the MySQL
extension. At the top of the editor window for any of the SQL files, you should
see the "Active Connection" link. Click it and choose the "127.0.0.1@3306"
connection you just created. Select "classicmodels".

## E) Test your Queries

When you are finished (or if you want to check your progress along the way),
open the terminal window and type the following command at the prompt.

    ./checkit

This will run a basic sanity check to insure that your queries match a basic set
of expectations. It won't guarantee correctness, but it'll help you insure you
don't make any major blunders.

## F) Submit Your Assignment

As you've done once already:

  1. Click on the Source Control tab.
  2. __*ENTER A COMMIT MESSAGE*__
  3. Press the __✓ Commit__ button
  4. Sync the changes
  5. __*CONFIRM YOU SUBMISSION*__ by checking returning to the assignment link viewing the repository

IMPORTANT FINAL STEP: In the repository take note of the commit ID on the GitHub
repository web page in the top right of the list of files. It will probably be
just 7 random letters and numbers (really a 7-digit hexadecimal number). Type or
copy/paste this number into the comment box for this assignment in D2L and
submit that to let me know that you are done.