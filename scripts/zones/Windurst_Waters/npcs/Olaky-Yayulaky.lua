-----------------------------------
-- Area: Windurst Waters
--   NPC: Olaky-Yayulaky
-- Type: Item Depository
-- !pos -61.247 -4.5 72.551 238
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(910);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

