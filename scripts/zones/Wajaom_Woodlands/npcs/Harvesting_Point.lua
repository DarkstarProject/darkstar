-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Harvesting Point
package.loaded["scripts/globals/harvesting"] = nil;
-------------------------------------

require("scripts/globals/harvesting");
local text = require("scripts/zones/Wajaom_Woodlands/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,0x01FB);
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