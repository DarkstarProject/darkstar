-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Pahpe Rauulih
-- Type: Standard NPC
-- !pos -39.740 -4.499 53.223 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(427);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

