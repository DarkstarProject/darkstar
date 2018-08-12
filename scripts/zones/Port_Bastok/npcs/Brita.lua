-----------------------------------
-- Area: Port Bastok
--   NPC: Brita
-- Type: Standard NPC
-- !pos 58.161 -3.101 -6.695 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(346, 0, 1);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

