-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Touttaures
-- !pos 94 4 50 80
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(603);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;