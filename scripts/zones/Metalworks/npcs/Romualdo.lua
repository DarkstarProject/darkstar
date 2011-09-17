-----------------------------------
-- Area: Metalworks
-- NPC: Romualdo
-- Involved in Quest: Stamp Hunt
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");
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
     stamp = player:getVar("Stamp_Romualdo");

     if (StampHunt == 1 and stamp == 0) then
         player:startEvent(0x02d6);
         player:setVar("Stamp_Romualdo",1);
     else
        player:startEvent(0x02c1);
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
