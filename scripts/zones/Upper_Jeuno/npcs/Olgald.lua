-----------------------------------
--  Area: Upper Jeuno
--   NPC: Olgald
--  Type: Standard NPC
-- @zone: 244
--  @pos -53.072 -1 103.380
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getVar("dancerTailorCS") == 1) then
        player:startEvent(0x27B7);
    elseif (player:getVar("comebackQueenCS") == 1) then
        player:startEvent(0x27A2);
    elseif (player:getVar("comebackQueenCS") == 3) then
        player:startEvent(0x27A6);
    elseif (player:getVar("comebackQueenCS") == 5) then --player cleared Laila's story
        player:startEvent(0x27AC);
    else
        player:startEvent(0x278A);
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x27B7) then
        player:setVar("dancerTailorCS", 2);
    end;
end;

