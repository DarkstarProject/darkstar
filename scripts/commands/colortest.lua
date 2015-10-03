---------------------------------------------------------------------------------------------------
-- func: @colortest
-- auth: Tagban
-- desc: Test Command to check colors are working for debugging. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = ""
};


function onTrigger(player)
    player:PrintToPlayer("Say MESSAGE_SAY 0", 0);
    player:PrintToPlayer("Shout MESSAGE_SHOUT 1", 1);
    player:PrintToPlayer("Emote MESSAGE_EMOTE 8", 8);
    player:PrintToPlayer("Yell MESSAGE_YELL 0x1A", 0x1A);
    player:PrintToPlayer("Tell MESSAGE_TELL 3", 3);
    player:PrintToPlayer("Party/Alliance MESSAGE_PARTY 4", 4);
    player:PrintToPlayer("Linkshell 1 MESSAGE_LINKSHELL 5", 5);
    player:PrintToPlayer("Linkshell 2 msgTypeLS2 0x1B", 0x1B);
    player:PrintToPlayer("Linkshell 3 msgTypeLS3 0x1E", 0x1E);
    player:PrintToPlayer("Unity Msg msgTypeUnity 0x21", 0x21);
    player:PrintToPlayer("SystemMessage MESSAGE_SYSTEM_1 6", 6);
    player:PrintToPlayer("Msg Only (Yellow) msgTypeYellow 0x15", 0x15);
    player:PrintToPlayer("Msg Only (White like Say) msgTypeWhite 0xD", 0xD);
    player:PrintToPlayer("Msg Only (Pinkish like Shout) msgTypePink 0xE", 0xE);
    player:PrintToPlayer("Msg Only (Lime like Linkshell) msgTypeLime 0x10", 0x10);
    player:PrintToPlayer("Msg Only (Green) msgTypeGreen 0x1C", 0x1C);
    player:PrintToPlayer("Msg Only Generic Yellow 0x1F", 0x1F);
    player:PrintToPlayer("Msg Only (Blue) msgTypeBlue 0xF", 0xF);
    player:PrintToPlayer("---- Test Complete ----", 8);
end;