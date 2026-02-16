import mariadb as db
import props
from os import system

# Reset a database using a SQL script
def resetDatabase(dbname, filename):
    system(f'mysql -u root -e "DROP DATABASE IF EXISTS {dbname}"')
    system(f'mysql -u root -e "SOURCE {filename}"')


# Remove comments and blank lines from SQL
def cleanSQL(sql):
    sql_lines = []
    for line in sql.split('\n'):
        line = line.rstrip()
        strip_line = line.lstrip()
        if len(strip_line) > 0 and not strip_line.startswith('--') and not strip_line.startswith('#'):
            sql_lines.append(line)
    return '\n'.join(sql_lines)


# Return the first SELECT/INSERT/UPDATE/DELETE query.
# As appropriate, also fills the database name, verb, and table properties.
def parseSQL(sql, properties = {}):
    query_sql = ''
    properties[props.SQL_VERB] = ''

    full_sql = cleanSQL(sql)
    sql_queries = full_sql.split(';')
    for query_text in sql_queries:
        query_sql = cleanSQL(query_text)
        if not len(query_sql):
            continue

        words = query_sql.split()
        first_word = words[0].strip().lower()

        properties[props.SQL_VERB] = first_word

        match first_word:
            case 'use':
                properties[props.DATABASE_NAME] = words[1].strip().lower()
                continue
            case 'insert':
                # because some don't add space after parens...
                word3 = words[2]
                more_words = word3.split('(')
                properties[props.MODIFIED_TABLE] = more_words[0]
            case 'update':
                properties[props.MODIFIED_TABLE] = words[1]
            case 'delete':
                properties[props.MODIFIED_TABLE] = words[2]
        
        break
    return query_sql

# Retrieve a connection to the named database.
connections = {}
def getConnection(dbname=None):
    global connections

    if not dbname:
        return db.connect(
                host="127.0.0.1",
                port=3306,
                user='root',
                connect_timeout=1
            )

    if not dbname in connections.keys():
        connections[dbname] = db.connect(
                    host="127.0.0.1",
                    port=3306,
                    user='root',
                    database=dbname,
                    connect_timeout=1
        )
    return connections[dbname]

# Convert each item in a tuple (row) to a string so that the silly
# json.dumps() function works.
def stringifyRow(row):
    result = list(row)
    for i in range(len(result)):
        result[i] = str(result[i])
    return result

# Retrieve the properties of a given query.
def getProperties(sql, properties):
    dbname = properties[props.DATABASE_NAME]
    conn = getConnection(dbname)

    with conn.cursor() as cursor:
        result = cursor.execute(sql)
        try:
            data = cursor.fetchall() # throws if query doesn't have results (isn't DQL)

            # sanity props
            properties[props.ROW_COUNT] = len(data)
            properties[props.COLUMN_COUNT] = len(cursor.description)

            #full props
            properties[props.COLUMN_NAMES] = [item[0] for item in cursor.description]
            if len(data) > 0:
                properties[props.FIRST_ROW] = stringifyRow(data[0])
            if len(data) > 1:
                properties[props.LAST_ROW] = stringifyRow(data[-1])
        except:
            # assume query wasn't supposed to return rows and is thus DML
            properties['rowsAffected'] = cursor.rowcount
            conn.commit()
