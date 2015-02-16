@echo off
:onCrash
echo [%date% %time%] Starting Search/AH Server...
DSSearch-server.exe
echo Server was stopped or crashed!
echo %date% %time%> .\log\Last_AH_Stop.log
@echo ...
GOTO onCrash