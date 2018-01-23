-----------------------------------
-- Area: Lower Jeuno
--  NPC: Yin Pocanakhu
-- Involved in Quest: Borghertz's Hands (1st quest only)
-- @zone 245
-- !pos 35 4 -43
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("BorghertzHandsFirstTime") == 2) then
        player:startEvent(220);
    else
        player:startEvent(209);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 220 and option == 0 and player:delGil(1000)) then
        player:startEvent(221);
        player:setVar("BorghertzHandsFirstTime",0);
        player:setVar("BorghertzCS",1);
    end

end;