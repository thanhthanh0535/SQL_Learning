[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/6GzGRuse)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=16841468)
# Homework 3

You’ve USED a lot of data models. And you've designed a few small models. NOW, your job is to design a more robust, "real-to-life" data model for "JagLib", a system designed to support the operations of a small, "traditional" public library. __Read these instructions very carefully.__


## System Overview

The system is intended to support the operations of a fairly typical public lending library (at least typical for how they used to be before everything went digital). In addition to written books, the library loans audio books (CD), music albums (CD), movies (DVD or Blu-ray), and several other categories of items. It also hosts periodic events that are open to its patrons. The library also collects fees for items returned late and for some (but not all) of the events.


## Core Entities

There are _six_ core entities we need to be concerned with, as well as a number of other supporting entities.

  * __Patrons__ - Libraries don't have "users" or "members", they have
    "patrons". But essentially, they are the same thing -- people who use the
    services that you provide. Patrons are issued ID cards with a unique patron
    identifier, which is a 15 digit number. The library tracks the name,
    address, and date of birth for each patron. Patrons under 16 cannot pay
    fines, so are required to have a "sponsor" patron. The sponsor is simply
    another patron, so the library also tracks the patron identifier of the
    sponsor, if applicable. The library tracks the date when the patron first
    joined, the date when their most recent ID card was issued, and the date
    that their current ID card expires.

  * __Catalog Items__ - The library has a large catalog of items it can loan to
    the public. Whether a book or CD or other physical format, it refers to
    these items generically as "catalog items". Although each item will already
    have a unique identifier (i.e., ISBN for a book or SKU for other
    categories), the library may have many copies of any of these items. So, in
    addition to the ISBN or SKU, it maintains its own unique identifier for each
    physical copy of an item that it can lend to patrons. For _all_ items, the
    library records a name, item category, description, replacement cost,
    release date, date acquired by the library, and the item's publisher or
    manufacturer. It also records the current status, which will be available,
    borrowed, lost, or retired. It also records additional information about the
    items that may be specific to the item category such as page count for books
    or runtime for audio books, movies or music. This information is simply left
    blank when it is not applicable to a specific item type.

  * __Item Category__ - As noted, each catalog item will belong to a category,
    including written book, audio book, audio CD, etc. In addition to the name
    of the category, the library records information specific to each, including
    a description of the category, the number of days items in the category are
    loaned out for, and the late fee (per day) for items in the category.

  * __Creators__ - For books, audio books, and music CD's, the library will
    maintain a list of book authors, narrators, and/or music artists that
    "created" these items. The library likes to record the name, country, and
    date of birth (or formation for bands), and date of death (or breakup for
    bands) for each creator, though sometimes it can only get a name, so the
    rest of the data it considers to be optional.

  * __Events__ - As noted, the library hosts a number of events each month. For
    each event, they track the event name, both a brief and a long description,
    dates both for the initial announcement and for the event itself, the event
    location (one of the rooms in the library or outside), the minimum age, and
    the maximum capacity. It is also important to record the attendance cost for
    the event. There are three separate possible costs for children, adults, and
    seniors. However, the cost of attendance for any or all of them could be
    zero.

  * __Fees__ - Under certain circumstances including lost or late returned items
    or for certain events, the library must assess fees. For these fees, the
    library tracks the patron, the amount, a reason or description, if
    applicable the item or event associated with the fee, and the status (paid,
    outstanding, or dismissed). It also tracks the date assessed (required) as
    well as the date paid and date dismissed (both optional as one or both may
    not be applicable).


## Relationships

The relationships between the above entities are governed by the following rules.

  * Patrons _borrow_ Catalog Items - A patron can borrow an item many times and
    of course an item may be borrowed many times by any number of patrons. The
    library records each time a patron borrows an item, and it refers to these
    as __Loans__. The library tracks dates for when an item loan occurs, when it
    is due, and when it is returned. It also records a status for the loan that
    will be outstanding, returned, or lost.

  * Patrons _sponsor_ other Patrons - As noted, a child must be sponsored by an
    adult patron. While a child will have only one sponsor, it is possible for
    an adult to sponsor many children.

  * Item Categories _contain_ Catalog Items - a given item in the catalog must
    belong to one and only one item category. Though obviously a category will
    usually contain many catalog items.

  * Creators _create_ Catalog Items - A creator may be have created many of the
    items in the library's catalog. Likewise, some items in the catalog will
    have been created by multiple creators. Both are optional, however; some
    items may have no known creators, and the library may record information
    about some creators but not yet have any items from that creator in their
    catalog.

  * Patrons _attend_ Events - An event usually is attended by many patrons, and
    a patron can attend many events over time.

  * Patrons _are assessed_ Fees - Over time, patrons may be assessed many
    different fees. However, a fee _must_ be assigned to one and only one
    patron.
  
  * Fees _may be for_ Catalog Items - A fee may reference a specific catalog
    item, and many fees may be assessed for the same item over time. However, a
    fee may not reference a catalog item at all.

  * Fees _may be for_ Events - Similarly, a fee may optionally reference a
    specific event, and an event may have many associated fees.


## Requirements / Grading Criteria

You are to create an ERD using DBML that adequately models the above
requirements. See below for a reminder of the DBML syntax. _Also note that you
will have a different set of allowable data types this time_, so don't skip that
section below. Your model should be entered into the `jaglib.dbml` file provided
for you.

Your model should be complete, normalized to at least 3NF, and should include
the following:

  * All tables (including all associative entities)
    - Name your entities consistently.
      * You can use either singular or plural for entities, but do not mix them
        (i.e., don’t use Patron and Fees).
      * You can use either camel case or underscores (`_`) for entity names, but
        don't mix them and don’t use dashes (`-`) or spaces.
    - If a "natural" name doesn't exist, name your associative entities using
      appropriate relationship names that include the core entity names such as
      "ItemCreator" or “patron_event".
  
  * All primary keys
    - Choose one if a suitable candidate key exists OR add a surrogate key.
    - For surrogate keys, use the integer data type marked as both pk and auto
      incrementing (e.g., `RecipeID INT [pk, increment]` ).
  
  * All foreign keys	
    - Remember these will have the same data type as the primary key.
    - Will NEVER be automatically incremented, even if the referenced primary
      key is.
  
  * All relationships
    - Must have proper cardinality
    - Should account for "mandatory" relationships (see below)
  
  * Additional fields/attributes that you feel are appropriate
    - You MUST add at least 10 additional fields to the core or associative
      entities
    - In some cases, you will be given obvious openings for these (e.g., "they
      may record additional information such as ...")
    -	In others, you may think of additional data that would make sense to you
      if you were a stakeholder in this system

  * Appropriate data types for all fields/keys/attributes

  * By default, a field is optional. If the field should be required, mark it as
    `[not null]`
    - Primary keys are required by default, so do not add `[not null]`.
    - A mandatory relationship (i.e., exactly-one-to-many instead of
      zero-or-one-to-many) means that the foreign key field should be `[not
      null]`.
  
  * Diagram arranged cleanly and clearly


## Valid Data Types

  * VARCHAR(length) or CHAR(length)

    For a string value. "length" is the maximum size. CHAR is a "fixed size"
    string that is suitable for primary/foreign keys or strings of known,
    consistent size (like codes). Otherwise, use VARCHAR. Provide a maximum size
    for BOTH.

  * INT

    For integer values.

  * FLOAT or DECIMAL(size, precision)

    For numbers with decimal places. Use FLOAT if you don’t know for sure how
    many decimal places you need (e.g., a very precise measurement or
    calculation). Use DECIMAL if you do (e.g., money or a race time). "size" is
    the total number of digits stored. "precision" is the number of those digits
    that should be to the right of the decimal point.

  * DATE or DATETIME

    DATE for just dates (year/month/day). DATETIME for values that have dates
    and times combined. MySQL also has a TIMESTAMP type which is similar to the
    DATETIME type, but auto adjusts for timezones. Note, if you JUST want a
    year, use an INT instead.

  * BOOL

    For true/false. __ASIDE__, this isn't really a data type. It's stored as a TINYINT(1), so you’ll see that instead of BOOL if you do a DESC on a table.


## The Language

As with earlier assignments, you'll be using DBML. The [language
specifications](https://dbml.dbdiagram.io/docs/) available. However, most of
what you need is at the very top in an example. There is also a supplementary
video for these design exercises, so make sure you have watched that before
moving on.

Note that there is an extension added to VSCode (Codespaces) that allows you to
visualize the data model as it is intended to be viewed--as a ERD using crow's
feet. One of the buttons in the top right of a DBML file will open the file in
preview mode. The actual GOAL of the exercise is this visual model, so YOU
SHOULD OPEN, VIEW, and ARRANGE your data model.

  > Tip: The DBML syntax allows for 2 methods of specifying foreign key
    relationships. The first is shown in the example with separate `ref:`
    entries added after the tables. I personally find it more intuitive to
    spefify the foreign key references alongside the keys themselves. This might
    look as follows:

    Table users {
      uid int [pk]
      ...
    }

    Table posts {
      pid int [pk]
      uid int [ref: > users.uid]
      ...
    }


## Submission

As before, when finished:

  * Switch to the source control tab on the left
  * Add a commit message
  * Click the Commit button
  * Sync the changes
  * __CHECK THE GITHUB REPOSITORY TO ENSURE THAT YOUR CHANGES WERE SYNCHRONIZED
    PROPERLY__
  * Copy and paste the commit ID from the GitHub repository into the submission
    comment in D2L and submit.