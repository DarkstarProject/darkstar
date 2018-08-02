-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
package.loaded["scripts/globals/harvesting"] = nil;
-------------------------------------
require("scripts/globals/harvesting");
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");
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