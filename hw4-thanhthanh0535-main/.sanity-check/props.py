# Query Property Constants

# collection
ALL_DATABASES = 'databases'
ALL_QUERIES = 'queries'

# per query
DATABASE_NAME = 'dbname'
SOLUTION = 'solution'

# parsed
SQL_VERB = 'verb'
SELECT_EXPRESSIONS = 'expressions'
MODIFIED_TABLE = 'tableName'

# execution results

# DQL
ROW_COUNT = 'rowCount'
COLUMN_COUNT = 'colCount'
COLUMN_NAMES = 'colNames'
FIRST_ROW = 'firstRow'
LAST_ROW = 'lastRow'

# DML
ROWS_AFFECTED = 'rowsAffected'

# Query Property Collections
SANITY_PROPS = (
    SQL_VERB,
    DATABASE_NAME,
    ROW_COUNT,
    COLUMN_COUNT,
    ROWS_AFFECTED,
    MODIFIED_TABLE
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
    MODIFIED_TABLE,
)

__propToFriendlyDict__ = {
    ROW_COUNT: 'number of rows',
    COLUMN_COUNT: 'number of columns',
    ROWS_AFFECTED: 'rows affected',
    MODIFIED_TABLE: 'table name',
    FIRST_ROW: 'first row',
    LAST_ROW: 'last row'
}

def friendly(propName):
    return __propToFriendlyDict__.setdefault(propName, propName)


# Filenames
SANITY_CHECK_FILENAME = 'sanitycheck.json'
FULL_CHECK_FILENAME = 'fullcheck.json'
FEEDBACK_FILENAME = 'FEEDBACK.md'

TEMPLATE_DIRECTORY = '_template_'
SOLUTION_DIRECTORY = '_solution_'
