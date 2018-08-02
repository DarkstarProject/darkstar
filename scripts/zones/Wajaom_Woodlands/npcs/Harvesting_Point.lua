-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Harvesting Point
-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");
require("scripts/globals/harvesting");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,507);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.HARVESTING_IS_POSSIBLE_HERE,1020);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;