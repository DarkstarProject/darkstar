@echo off
:onCrash
echo [%date% %time%] Restarting Game/Map Server...
DSGame-server.exe
echo Server was stopped or crashed!
echo %date% %time%> .\log\Last_Map_Stop.log
@echo ...
GOTO onCrash