-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Riautte
-- !pos -164 -2 61 80
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(41);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;