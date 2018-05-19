-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Pelsey-Holsey
-- Type: Standard NPC
-- @zone 94
-- !pos 119.755 -4.5 209.754
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(419);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

