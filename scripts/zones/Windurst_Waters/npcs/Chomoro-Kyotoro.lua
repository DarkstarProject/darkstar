-----------------------------------
-- Area: Windurst Waters
--  NPC: Chomoro-Kyotoro
-- Involved in Quest: Making the Grade
-- !pos 133 -5 167 238
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    -- needs check for TATTERED_TEST_SHEET then sets to var 3
    if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        local prog = player:getVar("QuestMakingTheGrade_prog");
        if (prog == 0) then
            player:startEvent(454);
        elseif (prog == 1) then
            player:startEvent(457);
        elseif (prog == 2) then
            player:startEvent(460);
        else
            player:startEvent(461);
        end
    else
        player:startEvent(432);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 460) then
        player:setVar("QuestMakingTheGrade_prog",3);
        player:delKeyItem(TATTERED_TEST_SHEET);
    end
end;