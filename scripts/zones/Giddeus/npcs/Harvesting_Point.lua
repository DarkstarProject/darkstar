-----------------------------------
-- Area: Giddeus
--  NPC: Harvesting Point
-------------------------------------

require("scripts/globals/harvesting");
local text = require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,0x0046);
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