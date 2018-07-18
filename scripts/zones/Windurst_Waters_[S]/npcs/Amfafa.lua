-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Amfafa
-- Type: Standard NPC
-- !pos -24.938 -2 -185.729 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(433);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

