-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Ranna-Brunna
-- Type: Standard NPC
-- !pos 123.085 -8.874 223.734 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(424);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

