@ECHO OFF
ECHO Before using this you must first edit this file to use the database name,
ECHO MySQL user and MySQL password to match what your server actually uses.
ECHO Please try NOT to accidently commit that information to your repository.
ECHO ---------------------------------
ECHO This file will ONLY reimport:
ECHO item tables, mob tables, npc tables, and custom tables.
ECHO ALL OTHER TABLES MUST BE MANUALLY HANDLED.
PAUSE
ECHO Renaming custom tables to prevent early execution...
ren *_custom.sql *_custom.txt
ECHO ---------------------------------
ECHO importing item tables
REM FOR %%X IN (item*.sql) DO mysql dspdb -h localhost -u root -proot < %%X
FOR %%X IN (item*.sql) DO ECHO Importing %%X & mysql dspdb -h localhost -u root -proot < %%X
ECHO ---------------------------------
ECHO importing mob tables
REM FOR %%X IN (mob*.sql) DO mysql dspdb -h localhost -u root -proot < %%X
FOR %%X IN (mob*.sql) DO ECHO Importing %%X & mysql dspdb -h localhost -u root -proot < %%X
ECHO ---------------------------------
REM FOR %%X IN (npc*.sql) DO mysql dspdb -h localhost -u root -proot < %%X
FOR %%X IN (npc*.sql) DO ECHO Importing %%X & mysql dspdb -h localhost -u root -proot < %%X
ECHO ---------------------------------
ECHO Un-renaming custom tables to allow execution...
ren *_custom.txt *_custom.sql
REM FOR %%X IN (*_custom.sql) DO mysql dspdb -h localhost -u root -proot < %%X
FOR %%X IN (*_custom.sql) DO ECHO Importing %%X & mysql dspdb -h localhost -u root -proot < %%X
ECHO ---------------------------------
ECHO Finished!
PAUSE
PAUSE