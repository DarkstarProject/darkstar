-----------------------------------
-- Area: Port Jeuno
--   NPC: Moulloie
-- Type: Standard NPC
-- !pos -77.724 7.003 59.044 246
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(46);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

