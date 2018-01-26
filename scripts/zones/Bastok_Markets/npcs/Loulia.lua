-----------------------------------
-- Area: Bastok Markets
--   NPC: Loulia
-- Type: Room Renters
-- !pos -176.212 -9 -25.049 235
--
-- Auto-Script: Requires Verification. Validated standard dialog - thrydwolf 12/8/2011
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(487);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

