-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Eih Lhogotan
-- Type: Standard NPC
-- !pos -29.887 -5.999 91.042 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(407);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

