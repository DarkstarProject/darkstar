-----------------------------------
-- Area: Metalworks
--   NPC: Riault
-- Type: Standard NPC
-- !pos 26.988 -17.39 -41.931 237
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(201);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

