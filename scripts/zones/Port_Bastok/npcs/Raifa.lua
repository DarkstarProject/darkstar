-----------------------------------
-- Area: Port Bastok
--   NPC: Raifa
-- Type: Quest Giver
-- !pos -166.416 -8.48 7.153 236
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(278);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

