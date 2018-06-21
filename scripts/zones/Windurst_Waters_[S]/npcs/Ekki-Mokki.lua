-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Ekki-Mokki
-- Type: Standard NPC
-- @zone 94
-- !pos -26.558 -4.5 62.930
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(409);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

