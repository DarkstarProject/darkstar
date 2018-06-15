-----------------------------------
-- Area: Windurst Waters
--   NPC: Panna-Donna
-- Type: Mission NPC
-- @zone 238
-- !pos -57.502 -6 229.571
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(105);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

