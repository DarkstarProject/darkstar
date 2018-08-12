-----------------------------------
-- Area: Port Windurst
--   NPC: Puo Rhen
-- Type: Mission Starter
-- !pos -227.964 -9 187.087 240
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(72);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

