-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Ulla
-- @zone 80
-- !pos -65 2 -50
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(508);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;