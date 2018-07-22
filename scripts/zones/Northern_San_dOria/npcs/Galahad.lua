-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Galahad
-- Type: Consulate Representative NPC
-- !pos -51.984 -2.000 -15.373 231
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,GALAHAD_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

