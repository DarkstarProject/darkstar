-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Aivedoir
-- Type: Standard Dialogue NPC
-- !pos -123.119 7.999 134.490 231
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,AIVEDOIR_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

