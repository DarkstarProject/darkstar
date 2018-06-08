-----------------------------------
-- Area: Port Windurst
--   NPC: Ten of Clubs
-- Type: Standard NPC
-- @zone 240
-- !pos -229.393 -9.2 182.696
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(75);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

