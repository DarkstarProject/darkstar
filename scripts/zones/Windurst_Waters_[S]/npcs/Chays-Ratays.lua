-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Chays-Ratays
-- Type: Standard NPC
-- !pos -6.013 -4.999 -185.219 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(401);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

