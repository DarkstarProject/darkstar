-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Corbrere
-- Type: Standard NPC
-- !pos -46.925 -4.5 49.006 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(414);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

