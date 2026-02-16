# Query Property Constants
ALL_DATABASES = 'databases'
ALL_QUERIES = 'queries'
DATABASE_NAME = 'dbname'
SQL_VERB = 'verb'
ROW_COUNT = 'rowCount'
COLUMN_COUNT = 'colCount'
COLUMN_NAMES = 'colNames'
SOLUTION = 'solution'
FIRST_ROW = 'firstRow'
LAST_ROW = 'lastRow'
ROWS_AFFECTED = 'rowsAffected'
TABLE_NAME = 'tableName'

# Query Property Collections
SANITY_PROPS = (
    SQL_VERB,
    DATABASE_NAME,
    ROW_COUNT,
    COLUMN_COUNT,
    ROWS_AFFECTED,
    TABLE_NAME
)

FULL_PROPS = (
    SQL_VERB,
    DATABASE_NAME,
    SOLUTION,
    # DQL
    ROW_COUNT,
    COLUMN_COUNT,
    COLUMN_NAMES,
    FIRST_ROW,
    LAST_ROW,
    # DML
    ROWS_AFFECTED,
    TABLE_NAME,
)

__propToFriendlyDict__ = {
    ROW_COUNT: 'number of rows',
    COLUMN_COUNT: 'number of columns',
    ROWS_AFFECTED: 'rows affected',
    TABLE_NAME: 'table name',
    FIRST_ROW: 'first row',
    LAST_ROW: 'last row'
}

def friendly(propName):
    return __propToFriendlyDict__.setdefault(propName, propName)


# Filenames
SANITY_CHECK_FILENAME = 'sanitycheck.json'
FULL_CHECK_FILENAME = 'fullcheck.json'
FEEDBACK_FILENAME = 'FEEDBACK.md'
SOLUTIONS_DIRECTORY = '_solutions_'
