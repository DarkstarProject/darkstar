-----------------------------------
-- Area: Selbina
--  NPC: Ramona
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(170);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

