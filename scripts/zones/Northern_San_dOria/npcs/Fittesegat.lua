-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Fittesegat
-- Type: Standard Dialogue NPC
-- !pos 144.250 0.000 138.203 231
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,FITTESEGAT_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

