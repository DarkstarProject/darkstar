-----------------------------------
-- Area: Lower Jeuno
--  NPC: Ruslan
-- Involved In Quest: Wondering Minstrel
-- !pos -19 -1 -58 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    wonderingstatus = player:getQuestStatus(WINDURST,WONDERING_MINSTREL);
    if (wonderingstatus == QUEST_ACCEPTED) then
        prog = player:getVar("QuestWonderingMin_var")
        if (prog == 0) then                 -- WONDERING_MINSTREL + Rosewood Lumber: During Quest / Progression
            player:startEvent(10009,0,718);
            player:setVar("QuestWonderingMin_var",1);
        elseif (prog == 1) then             -- WONDERING_MINSTREL + Rosewood Lumber: Quest Objective Reminder
            player:startEvent(10010,0,718);
        end
    elseif (wonderingstatus == QUEST_COMPLETED) then
        rand = math.random(3);
        if (rand == 1) then
            player:startEvent(10011);         -- WONDERING_MINSTREL: After Quest
        else
            player:startEvent(10008);         -- Standard Conversation
        end
    else
        player:startEvent(10008);             -- Standard Conversation
    end
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
end;
