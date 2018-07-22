-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Rakih Lyhall
-- Type: Standard NPC
-- !pos -48.111 -4.5 69.712 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(429);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

