-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Kopol-Rapol
-- Type: Standard NPC
-- !pos 131.179 -6.75 172.758 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(422);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

