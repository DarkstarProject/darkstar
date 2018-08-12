-----------------------------------
-- Area: Metalworks
--   NPC: Chantain
-- Type: Consulate Representative
-- !pos 21.729 -17 -30.888 237
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
    player:startEvent(203);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

