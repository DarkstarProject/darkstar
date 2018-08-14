-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Rodaillece
-- Type: Standard Dialogue NPC
-- !pos -246.943 7.000 46.836 231
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,RODAILLECE_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

