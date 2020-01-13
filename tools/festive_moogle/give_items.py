#!/usr/bin/python3
import mysql.connector as mariadb

# Change with correct info ##
sqlusername = "darkstar"    #
sqlpassword = "password"    #
sqldatabase = "dspdb"       #
#############################


def all_characters(cursor, cursor2):
    print("Items Available:\
    \n1) Nomad Cap\
    \n2) Moogle Cap\
    \n3) Moogle Rod\
    \n4) Harpsichord\
    \n5) Stuffed Chocobo\
    \n6) Tidal Talisman\
    \n7) Destrier Beret\
    \n8) Chocobo Shirt\
    \n")
    prize = int(input("Enter prize to give (1-8): "))
    cursor.execute("SELECT charid FROM chars")
    for charid in cursor:
        nameid = int(charid[0])
        print(nameid)
        if prize == 1:
            variable = "festiveMoogleNomadCap"
        elif prize == 2:
            variable = "festiveMoogleMoogleCap"
        elif prize == 3:
            variable = "festiveMoogleMoogleRod"
        elif prize == 4:
            variable = "festiveMoogleHarpsichord"
        elif prize == 5:
            variable = "festiveMooglestuffedChocobo"
        elif prize == 6:
            variable = "festiveMoogleTidalTalisman"
        elif prize == 7:
            variable = "festiveMoogleDestrierBeret"
        elif prize == 8:
            variable = "festiveMoogleChocoboShirt"
        else:
            print(prize + " is not a valid choice")
        if 1 <= prize <= 8:
            try:
                cursor2.execute("INSERT INTO char_vars (charid, varname, value) VALUES (%s, %s, %s)", (nameid, variable, 1))
            except mariadb.Error as error:
                print("Error: {}".format(error))


def single_character(cursor):
    name = input("Enter name of character: ")
    print("Items Available:\
    \n1) Nomad Cap\
    \n2) Moogle Cap\
    \n3) Moogle Rod\
    \n4) Harpsichord\
    \n5) Stuffed Chocobo\
    \n6) Tidal Talisman\
    \n7) Destrier Beret\
    \n8) Chocobo Shirt\
    \n")
    prize = int(input("Enter prize to give (1-8): "))
    cursor.execute("SELECT charname, charid FROM chars WHERE charname=%s", (name,))
    for charname, charid in cursor:
        nameid = charid
    if prize == 1:
        variable = "festiveMoogleNomadCap"
    elif prize == 2:
        variable = "festiveMoogleMoogleCap"
    elif prize == 3:
        variable = "festiveMoogleMoogleRod"
    elif prize == 4:
        variable = "festiveMoogleHarpsichord"
    elif prize == 5:
        variable = "festiveMooglestuffedChocobo"
    elif prize == 6:
        variable = "festiveMoogleTidalTalisman"
    elif prize == 7:
        variable = "festiveMoogleDestrierBeret"
        print("im here")
    elif prize == 8:
        variable = "festiveMoogleChocoboShirt"
    else:
        print(prize + " is not a valid choice")
    if 1 <= prize <= 8:
        try:
            cursor.execute("INSERT INTO char_vars (charid, varname, value) VALUES (%s, %s, %s)", (nameid, variable, 1))
        except mariadb.Error as error:
            print("Error: {}".format(error))


def main():
    mariadb_connection = mariadb.connect(user=sqlusername, password=sqlpassword, database=sqldatabase)
    cursor = mariadb_connection.cursor(buffered=True)
    cursor2 = mariadb_connection.cursor(buffered=True)
    print("This Python script allows to give a mog item to the character of your choice\
    ")
    print("How do you want to assign items?\
    \n 1) Single Character\
    \n 2) All Characters")
    choice = int(input("Enter a selection (1-2): "))
    if choice == 1:
        single_character(cursor)
    elif choice == 2:
        all_characters(cursor, cursor2)


if __name__ == "__main__":
    main()

