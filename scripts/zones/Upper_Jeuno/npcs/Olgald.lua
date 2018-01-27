-----------------------------------
-- Area: Upper Jeuno
--   NPC: Olgald
-- Type: Standard NPC
-- @zone 244
-- !pos -53.072 -1 103.380
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("dancerTailorCS") == 1) then
        player:startEvent(10167);
    elseif (player:getVar("comebackQueenCS") == 1) then
        player:startEvent(10146);
    elseif (player:getVar("comebackQueenCS") == 3) then
        player:startEvent(10150);
    elseif (player:getVar("comebackQueenCS") == 5) then --player cleared Laila's story
        player:startEvent(10156);
    else
        player:startEvent(10122);
    end;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10167) then
        player:setVar("dancerTailorCS", 2);
    end;
end;

