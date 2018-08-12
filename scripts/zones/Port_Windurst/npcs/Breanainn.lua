-----------------------------------
-- Area: Port Windurst
--  NPC: Breanainn
-- !pos 212 -6 96 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(182);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

