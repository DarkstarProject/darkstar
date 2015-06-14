#!/bin/bash
cd sql
for f in *.sql
  do
     echo -n "Importing $f into the database..."
     mysql myapp_test -u root < $f && echo "Success"
     if [ $? -ne 0 ]; then exit $?; fi
  done
cd ..
