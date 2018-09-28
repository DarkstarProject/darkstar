-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Areuhat
-- !pos 21 0 22 80
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, 13454); -- (Couldn't find default dialogue)  How very good to see you again!
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;