-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/harvesting");
require("scripts/zones/Yhoator_Jungle/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,11);
end;

function onTrigger(player,npc)
    player:messageSpecial(HARVESTING_IS_POSSIBLE_HERE,1020);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;