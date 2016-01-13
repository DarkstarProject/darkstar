-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Harvesting Point
-------------------------------------

require("scripts/globals/harvesting");
local text = require("scripts/zones/Yhoator_Jungle/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,0x000B);
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.HARVESTING_IS_POSSIBLE_HERE,1020);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;