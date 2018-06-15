-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Emhi Tchaoryo
-- Type: Campaign Ops Overseer
-- @zone 94
-- !pos 10.577 -2.478 32.680
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(307);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

