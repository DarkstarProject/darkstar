-----------------------------------
-- Area: Port Jeuno
--  NPC: Sanosuke
-- Involved in Quest: A Thief in Norg!?
-- !pos -63 7 0 246
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(OUTLANDS,A_THIEF_IN_NORG) == QUEST_ACCEPTED) then
        aThiefinNorgCS = player:getVar("aThiefinNorgCS");
        if (aThiefinNorgCS == 1) then
            player:startEvent(304);
        elseif (aThiefinNorgCS == 2) then
            player:startEvent(305);
        elseif (aThiefinNorgCS >= 3) then
            player:startEvent(306);
        end
    else
        player:startEvent(303);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 304) then
        player:setVar("aThiefinNorgCS",2);
    end

end;