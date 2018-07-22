-----------------------------------
-- Area: Metalworks
--   NPC: Moyoyo
-- Type: Standard NPC
-- !pos 19.508 -17 26.870 237
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
    player:startEvent(252);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

