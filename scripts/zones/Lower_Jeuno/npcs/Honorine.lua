-----------------------------------
-- Area: Lower Jeuno
--  NPC: Honorine
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10015);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

