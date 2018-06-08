-----------------------------------
-- Area: Nashmau
--  NPC: Pupuroon
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Nashmau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:sendMenu(3);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
