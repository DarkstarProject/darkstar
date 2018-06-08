-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Piscariaux
-- @zone 80
-- !pos -161 -2 61
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(42);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;