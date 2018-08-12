-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Khea Mhyyih
-- Type: Standard NPC
-- !pos -53.927 -4.499 56.215 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(428);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

