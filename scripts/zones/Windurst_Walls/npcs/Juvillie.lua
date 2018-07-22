-----------------------------------
-- Area: Windurst Walls
--   NPC: Juvillie
-- Type: Event Replayer
-- !pos -180.731 -3.451 143.138 239
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(406);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

