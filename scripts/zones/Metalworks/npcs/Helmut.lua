-----------------------------------
-- Area: Metalworks
--  NPC: Helmut
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(410);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

