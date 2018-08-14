-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Narito-Pettito
-- Type: Standard NPC
-- !pos -52.674 -5.999 90.403 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(425);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

