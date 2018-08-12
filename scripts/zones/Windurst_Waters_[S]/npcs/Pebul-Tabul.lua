-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Pebul-Tabul
-- Type: Standard NPC
-- !pos -68.500 -4.5 3.694 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(405);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

