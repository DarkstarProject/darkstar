-----------------------------------
-- Area: Bastok Mines
-- NPC: Deadly Spider
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
     stamp = player:getVar("Stamp_DeadlySpider");

     if (StampHunt == 1 and stamp == 0) then
         player:startEvent(0x0056);
         player:setVar("Stamp_DeadlySpider",1);
     else
        player:startEvent(0x0011);
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
