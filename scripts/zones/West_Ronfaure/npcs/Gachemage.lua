-----------------------------------
-- Area: West Ronfaure
--  NPC: Gachemage
-- Type: Gate Guard
-- !pos -176.000 -61.999 382.425 100
-----------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/West_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, GACHEMAGE_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;



