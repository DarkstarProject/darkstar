-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Logging Point
-----------------------------------
package.loaded["scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/logging");
require("scripts/zones/Yhoator_Jungle/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,10);
end;

function onTrigger(player,npc)
    player:messageSpecial(LOGGING_IS_POSSIBLE_HERE,1021);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;