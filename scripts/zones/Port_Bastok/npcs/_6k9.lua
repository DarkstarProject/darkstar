-----------------------------------
-- Area: Port Bastok
--  NPC: Door: Arrivals Entrance
-- !pos -80 1 -26 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(140);
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

