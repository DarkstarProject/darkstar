-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Ranpi-Monpi
-- Type: Standard NPC
-- !pos -115.452 -3 43.389 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(117);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

