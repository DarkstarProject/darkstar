-----------------------------------
-- Area: Bastok Mines
-- NPC: Tall Mountain
-- Involved in Quest: Stamp Hunt
-----------------------------------


require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

     StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);
     questStatus = player:getVar("StampHunt_Event");
     stamp = player:getVar("Stamp_TallMountain");

     if (StampHunt == 1 and stamp == 0) then
         player:startEvent(0x0055);
         player:setVar("Stamp_TallMountain",1);
     else
        player:startEvent(0x0037);
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
end;
