-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Upital-Lupital
-- Type: Standard NPC
-- @zone 94
-- !pos -57.809 -13.339 122.753
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(439);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

