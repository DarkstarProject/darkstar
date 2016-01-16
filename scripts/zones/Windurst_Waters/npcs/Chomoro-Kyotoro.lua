-----------------------------------
--    Area: Windurst Waters
--    NPC: Chomoro-Kyotoro
--  Involved in Quest: Making the Grade
--  @zone = 238
--  @pos = 133 -5 167
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- needs check for TATTERED_TEST_SHEET then sets to var 3
    if (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
        local prog = player:getVar("QuestMakingTheGrade_prog");
        if (prog == 0) then
            player:startEvent(0x01c6);
        elseif (prog == 1) then
            player:startEvent(0x01c9);
        elseif (prog == 2) then
            player:startEvent(0x01cc);
        else
            player:startEvent(0x01cd);
        end
    else 
        player:startEvent(0x01b0);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x01cc) then
        player:setVar("QuestMakingTheGrade_prog",3);
        player:delKeyItem(TATTERED_TEST_SHEET);
    end
end;