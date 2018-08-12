-----------------------------------
-- Area: Bastok Mines
--   NPC: Wobke
-- Type: Quest NPC
-- !pos 29.028 -0.126 -111.626 234
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(244);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

