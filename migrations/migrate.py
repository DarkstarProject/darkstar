import MySQLdb
import re
import spell_blobs_to_spell_table

credentials = {}
db = None
cur = None

def connect():
    print("Loading conf/map_darkstar.conf")

    # Grab mysql credentials
    filename = "../conf/map_darkstar.conf"

    global credentials
    global db
    global cur

    with open(filename) as f:
        while True:
            line = f.readline()

            if not line: break

            match = re.match(r"(mysql_\w+):\s+(\S+)", line)

            if match:
                credentials[match.group(1)] = match.group(2)

    database = credentials["mysql_database"]
    host = credentials["mysql_host"]
    port = int(credentials["mysql_port"])
    login = credentials["mysql_login"]
    password = credentials["mysql_password"]

    print(database, host, port, login, password)

    db = MySQLdb.connect(host=host,
            user=login,
            passwd=password,
            db=database,
            port=port)

    cur = db.cursor()

    print("Connected to database " + database)

def close():
    print("Closing connection...")
    cur.close()
    db.close()

def run_all_migrations():
    connect()

    run_migration(spell_blobs_to_spell_table)

    print("Finished running all migrations")

    close()

def run_migration(migration):
    # Ensure things like new table exists
    migration.check_preconditions(cur)

    # Don't run migration twice
    if not migration.needs_to_run(cur):
        print("Already ran " + migration.migration_name() + " skipping...")
        return

    print("Running migrations for " + migration.migration_name())

    migration.migrate(cur, db)

    print("[Success] Done running " + migration.migration_name())


if __name__ == "__main__":
    run_all_migrations()
