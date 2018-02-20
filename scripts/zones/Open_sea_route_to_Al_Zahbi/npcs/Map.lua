-----------------------------------
-- Area: Open_sea_route_to_Al_Zahbi
--  NPC: Map
-- !pos 0.340 -12.232 -4.120 46
-----------------------------------
package.loaded["scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Open_sea_route_to_Al_Zahbi/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(1024);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

