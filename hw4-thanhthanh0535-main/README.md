[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XfbxdDGw)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=17242965)
# AIST 3410 Homework 4

 > _NOTE_: to avoid issues overcluttering the instrucions, I did not always
 > specify the exact format of concatenated names. If I say something like
 > "concatenate first + last" I mean "First Last" (i.e., first + space + last).
 > If i say "concatenate last and first separated by a comma" I mean "last,
 > first" (i.e., last + comma + space + first).

## A) Start & Configure Your Codespace

You are likely already done with this step, but:

  1. Click on the GitHub Classroom invitation link provided.
  2. Accept the assignment.
  3. Open the repository in GitHub.
  4. "Code" the repository in a (probably new) Codespace.

## B) Connect the Extension

Find the Database panel, click the MySQL tab (currently the MariaDB tab doesn't
work reliably), accept the defaults, click Connect, and click Close. Verify that
the “127.0.0.1@3306” appears to the left in the Database panel. If not, refer
back to part C of the Homework 1 instructions or rewatch the video.

You can toggle closed your Terminal window. You won’t need it for this one
except to test the submission before committing it.

## C) Write your Queries

![Classic Models Data Diagram](.res/classicmodels.png)

Each query for this assignment is in a separate file. Open the Explorer panel in
on the left and click sequentially through each of the queries.

You will need to set the "Active Connection" for the first query you write /
test for a given session. After that, you can test each query using the MySQL
extension. At the top of the editor window for any of the SQL files, you should
see the "Active Connection" link. Click it and choose the "127.0.0.1@3306"
connection you just created. Select "classicmodels".

## D) Test your Queries

When you are finished (or if you want to check your progress along the way),
open the terminal window and type the following command at the prompt.

    ./checkit

This will run a basic sanity check to insure that your queries match a basic set
of expectations. It won't guarantee correctness, but it'll help you insure you
don't make any major blunders.

## E) Submit Your Assignment

As you've done once already:

  1. Click on the Source Control tab.
  2. __*ENTER A COMMIT MESSAGE*__
  3. Press the __✓ Commit__ button
  4. Sync the changes
  5. __*CONFIRM YOU SUBMISSION*__ by checking returning to the assignment link viewing the repository

__IMPORTANT FINAL STEP__: After ensuring that the repository contains the latest
copies of your *.sql files, take note of the commit ID on the GitHub repository
web page in the top right of the list of files. It will probably be just 7
random letters and numbers (really a 7-digit hexadecimal number). Type or
copy/paste this number into the comment box for this assignment in D2L and
submit that to let me know that you are done.
