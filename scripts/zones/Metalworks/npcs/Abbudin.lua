-----------------------------------
-- Area: Metalworks
--  NPC: Abbudin
-- Type: Standard Info NPC
-- !pos -56.338 2.777 -31.446 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(558);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

