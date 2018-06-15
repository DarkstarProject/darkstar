-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Parukoko
-- Type: Standard NPC
-- @zone 94
-- !pos -32.400 -3.5 -103.666
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(436);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

