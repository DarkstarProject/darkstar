-----------------------------------
-- Area: Port Jeuno
--   NPC: Rachocho
-- Type: Standard NPC
-- !pos 3.789 7 -59.411 246
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(47);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

