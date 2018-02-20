-----------------------------------
-- Area: Windurst Woods
--   NPC: Catalia
-- Type: Standard NPC
-- @zone 241
-- !pos -46.160 -0.501 -32.698
--
-- Auto-Script: Requires Verification (Verfied by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(442);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

