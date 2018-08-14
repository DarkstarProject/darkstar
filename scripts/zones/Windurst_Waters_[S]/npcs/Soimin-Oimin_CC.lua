-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Soimin-Oimin, C.C.
-- Type: Retrace
-- !pos -51.010 -6.276 213.678 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(452);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

