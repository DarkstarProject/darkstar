-----------------------------------
-- Area: Port Windurst
--   NPC: Dehn Harzhapan
-- Type: Standard NPC
-- !pos -7.974 -7 152.633 240
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10018);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

