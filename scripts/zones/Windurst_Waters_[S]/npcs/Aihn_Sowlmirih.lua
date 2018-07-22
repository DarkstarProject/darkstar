-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Aihn Sowlmirih
-- Type: Standard NPC
-- !pos -61.102 -4.5 71.743 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(412);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

