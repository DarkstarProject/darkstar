-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Renten-Tonten
-- Type: Standard NPC
-- !pos 133.840 -6.75 173.305 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(421);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

