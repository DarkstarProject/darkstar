-----------------------------------
-- Area: Port Bastok
--  NPC: Wurteh
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(95);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

