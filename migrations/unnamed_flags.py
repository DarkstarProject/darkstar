def log_messages(curs):
    for msg in curs.messages:
            print(msg[1])

def migration_name():
    return "Display Head and New Player"

def check_preconditions(cur):
    return

def needs_to_run(cur):
    # ensure nnameflags does not exist
    cur.execute("SHOW COLUMNS FROM `chars` LIKE 'nnameflags';")
    return cur.fetchone()

def migrate(cur, db):
    cur.execute("ALTER TABLE `chars` ADD COLUMN `nnameflags` int(10) unsigned NOT NULL DEFAULT '0';")
    cur.execute("UPDATE `chars` o, `chars` n SET o.`nnameflags` = (CASE WHEN n.isnewplayer THEN 0x0 ELSE 0x04 END) WHERE o.charid = n.charid;")
    print("Committing changes")
    db.commit()
    log_messages(cur)
