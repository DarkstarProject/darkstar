-----------------------------------
--  Area: Jugner Forest
--  NPC:  Signpost
--  Involved in Quest: Grimy Signposts
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");

----------------------------------- 
-- onTrade Action
----------------------------------- 

function onTrade(player,npc,trade) 

end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc)

    local X = player:getXPos();
    local Z = player:getZPos();

    if ((X > -79.3 and X < -67.3) and (Z > 94.5 and Z < 106.5)) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),0)) then
            player:startEvent(0x0006,1);
        else
            player:startEvent(0x0001);
        end
    elseif ((X > -266.2 and X < -254.2) and (Z > -29.2 and Z < -17.2)) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),1)) then
            player:startEvent(0x0007,1);
        else
            player:startEvent(0x0002);
        end
    elseif ((X > -463.7 and X < -451.7) and (Z > -422.1 and Z < -410.1)) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),2)) then
            player:startEvent(0x0008,1);
        else
            player:startEvent(0x0003);
        end
    elseif ((X > 295.4 and X < 307.3) and (Z > 412.8 and Z < 424.8)) then
        if (player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and not player:getMaskBit(player:getVar("CleanSignPost"),3)) then
            player:startEvent(0x0009,1);
        else
            player:startEvent(0x0004);
        end
    else
        print("Unknown Signpost");
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    
    if (csid == 6 and option == 1) then
        player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",0,true);
    elseif (csid == 7 and option == 1) then
        player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",1,true);
    elseif (csid == 8 and option == 1) then
        player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",2,true);
    elseif (csid == 9 and option == 1) then
        player:setMaskBit(player:getVar("CleanSignPost"),"CleanSignPost",3,true);
    end
end;