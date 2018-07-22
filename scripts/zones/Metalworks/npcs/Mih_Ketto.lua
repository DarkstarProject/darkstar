-----------------------------------
-- Area: Metalworks
--   NPC: Mih Ketto
-- Type: Standard NPC
-- !pos 24.046 -17 32.751 237
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
    player:startEvent(253);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

