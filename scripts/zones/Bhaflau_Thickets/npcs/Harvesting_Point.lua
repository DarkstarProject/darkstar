-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/harvesting");
require("scripts/zones/Bhaflau_Thickets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,503);
end;

function onTrigger(player,npc)
    player:messageSpecial(HARVESTING_IS_POSSIBLE_HERE,1020);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;