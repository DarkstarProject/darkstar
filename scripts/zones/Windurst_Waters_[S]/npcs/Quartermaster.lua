-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Quartermaster
-- Type: Standard NPC
-- !pos -60.200 -4.7 32.500 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(201);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

