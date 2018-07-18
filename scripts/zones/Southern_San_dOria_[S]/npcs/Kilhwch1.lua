-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Kilhwch
-- !pos -63 2 -50 80
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, 11143) -- I advise you distance yourself from Lady Ulla. I know not your intentions, but am inclined to believe they are crooked
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;