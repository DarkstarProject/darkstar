-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Harvesting Point
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs")
require("scripts/globals/harvesting");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,503);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.HARVESTING_IS_POSSIBLE_HERE,1020);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;