-----------------------------------
-- Area: Windurst Woods
--   NPC: Abby Jalunshi
-- Type: Moghouse Renter
-- @zone 241
-- !pos -101.895 -5 36.172
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(798);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

