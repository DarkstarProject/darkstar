-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Romaa Mihgo
-- Type: Standard NPC
-- @zone 94
-- !pos -1.967 -3 -26.337
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(11);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

