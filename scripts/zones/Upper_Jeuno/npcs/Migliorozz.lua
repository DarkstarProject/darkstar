-----------------------------------
-- Area: Upper Jeuno
--   NPC: Migliorozz
-- Type: Standard NPC
-- @zone 244
-- !pos -37.760 -2.499 12.924
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(10026);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

