-----------------------------------
-- Area: Quicksand Caves
--  NPC: Goblin Geologist
-- Type: Mission
-- !pos -737.000 -11.125 -550.000 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(100);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

