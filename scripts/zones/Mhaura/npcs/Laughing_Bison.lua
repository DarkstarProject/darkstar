-----------------------------------
-- Area: Mhaura
--  NPC: Lacia
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mhaura/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(333);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
