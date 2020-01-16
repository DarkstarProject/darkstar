Migrating DSPDB Database
========================

This folder contains scripts to migrate your database data to a newer format. 
For example the spells column in the chars table has been separated into 
a new table, so a migration script has been created to do this for you.

These scripts are mostly python, though we may occasionaly include a pure sql script here.

First you'll need python and mysqldb installed on your computer.

## Setup

## Installing Python

The older scripts require Python 2.7+

Newer python scripts require 3.4+

For Windows user, download the installation file here https://www.python.org/downloads/

For most distros of GNU/Linux one or more likley both are already installed and you should check your package manager.

## Installing MySQLdb

A Mysql driver is required to execute mysql commands.

For Windows user, you can get an [exe of MySQLdb](http://sourceforge.net/project/showfiles.php?group_id=22307).

For Ubuntu, `sudo apt-get install python-mysqldb`.


## Running Migrations

Go into the `darkstar/migrations` directory and execute the `migrate.py` file.

From the command line: `python migrate.py`

This will run all out-standing migrations and skip migrations that have already ran. 
Keep in mind no data is deleted and any unused columns are expected to be cleaned up by yourself.
