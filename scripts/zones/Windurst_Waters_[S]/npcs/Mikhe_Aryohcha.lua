-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Mikhe Aryohcha
-- Type: Standard NPC
-- !pos -56.645 -4.5 13.014 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, MIKHE_ARYOHCHA_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

