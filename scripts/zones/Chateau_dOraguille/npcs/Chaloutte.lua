-----------------------------------
-- Area: Chateau d'Oraguille
--   NPC: Chaloutte
-- Type: Event Scene Replayer
-- !pos 10.450 -1 -11.985 233
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(557);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

