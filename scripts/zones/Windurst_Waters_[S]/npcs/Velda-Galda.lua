-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Velda-Galda
-- Type: Mission NPC
-- !pos 138.631 -3.112 61.658 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(177);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

