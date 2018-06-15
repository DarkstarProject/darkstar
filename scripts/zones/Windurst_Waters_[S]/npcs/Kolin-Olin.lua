-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Kolin-Olin
-- Type: Standard NPC
-- @zone 94
-- !pos 9.981 -2.478 33.786
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(306);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

