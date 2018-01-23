-----------------------------------
-- Area: Bastok Mines
--   NPC: Ranpi-Pappi
-- Type: Standard NPC
-- @zone 234
-- !pos -4.535 -1.044 49.881
--
-- Auto-Script: Requires Verification (Verified by Brando)
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(77);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

