-----------------------------------
-- Area: Grauberg [S]
--  NPC: Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Grauberg_[S]/TextIDs");
require("scripts/globals/harvesting");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(), npc, trade, 901);
end;

function onTrigger(player,npc)
    player:messageSpecial(HARVESTING_IS_POSSIBLE_HERE, 1020);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
