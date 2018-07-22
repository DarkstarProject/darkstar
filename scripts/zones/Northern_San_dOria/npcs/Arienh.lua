-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Arienh
-- Type: Standard Dialogue NPC
-- !pos -37.292 -2.000 -6.817 231
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,ARIENH_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

