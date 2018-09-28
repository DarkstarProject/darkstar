-----------------------------------
-- Area: Ghelsba Outpost
--  NPC: Logging Point
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/logging");
require("scripts/zones/Ghelsba_Outpost/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,100);
end;

function onTrigger(player,npc)
    player:messageSpecial(LOGGING_IS_POSSIBLE_HERE,1021);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;