-----------------------------------
-- Area: Metalworks
--  NPC: Striking Snake
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(153);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

