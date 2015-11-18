import utils

def log_messages(curs):
    for msg in curs.messages:
            print(msg[1])

def migration_name():
    return "Spell blobs to spell table"

def check_preconditions(cur):
    cur.execute("SHOW TABLES LIKE 'char_spells';")

    if not cur.fetchone():
        raise Exception("char_spells table does not exist. Please run sql/char_spells.sql")

def needs_to_run(cur):
    # ensure char_spells table is empty
    cur.execute("SELECT count(*) FROM char_spells")

    row = cur.fetchone()
    if row[0] != 0:
        return False

    # ensure spells column exists
    cur.execute("SHOW COLUMNS FROM chars LIKE 'spells';")

    if not cur.fetchone():
        return False

    return True

def migrate(cur, db):
    spellLimit = 1024

    cur.execute("SELECT charid, HEX(spells) as spells FROM chars")

    rows = cur.fetchall()

    for row in rows:
        charId = row[0]
        spells = row[1]

        if spells != None and spells != "":
            print("Migrating charid: %d" % charId)

            spellId = 0

            binary_spells = utils.blob_to_binary(spells)

            for bit in binary_spells:
                if bit == "1":
                    if spellId >= spellLimit:
                        print("Going over spell limit of %d, not adding %d" % (spellLimit, spellId))
                    else:
                        cur.execute("INSERT IGNORE INTO char_spells VALUES (%s, %s);", (charId, spellId))
                        # print("Added spell %d" % spellId)

                spellId = spellId + 1

            print(" [OK]")

        else:
            print("Charid %d has no spells, skipping" % charId)

    print("Committing changes")
    db.commit()
    log_messages(cur)
