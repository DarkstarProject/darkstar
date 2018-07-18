-----------------------------------
-- Area: Windurst Waters
--   NPC: Dagoza-Beruza
-- Type: Mission NPC
-- !pos -54.523 -6 229.271 238
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(104);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

