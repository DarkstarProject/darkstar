@echo off
:onCrash
echo [%date% %time%] Restarting Lobby/Connection Server...
DSConnect-server.exe
echo Server was stopped or crashed!
echo %date% %time%> .\log\Last_Lobby_Stop.log
@echo ...
GOTO onCrash