-----------------------------------
-- Area: Port Windurst
--   NPC: Nine of Clubs
-- Type: Standard NPC
-- @zone 240
-- !pos -229.699 -9 185.686
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(74);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

