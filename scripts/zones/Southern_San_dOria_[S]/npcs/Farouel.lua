-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Farouel
-- @zone 80
-- !pos 93 4 52
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(90);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;