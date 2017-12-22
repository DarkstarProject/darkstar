-----------------------------------
-- Area: Lower Jeuno
-- NPC: Mertaire
-- Starts and Finishes Quest: The Old Monument (start only), A Minstrel in Despair, Painful Memory (BARD AF1)
-- !pos -17 0 -61 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local theOldMonument = player:getQuestStatus(JEUNO,THE_OLD_MONUMENT);
    local aMinstrelInDespair = player:getQuestStatus(JEUNO,A_MINSTREL_IN_DESPAIR);

    -- A MINSTREL IN DESPAIR (poetic parchment)
    if (trade:hasItemQty(634,1) and trade:getItemCount() == 1 and theOldMonument == QUEST_COMPLETED and aMinstrelInDespair == QUEST_AVAILABLE) then
        player:startEvent(101);
    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local theOldMonument = player:getQuestStatus(JEUNO,THE_OLD_MONUMENT);
    local painfulMemory = player:getQuestStatus(JEUNO,PAINFUL_MEMORY);
    local theRequiem = player:getQuestStatus(JEUNO,THE_REQUIEM);
    local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);
    local job = player:getMainJob();
    local level = player:getMainLvl();

    -- THE OLD MONUMENT
    if (theOldMonument == QUEST_AVAILABLE and level >= ADVANCED_JOB_LEVEL) then
        player:startEvent(102);

    -- PAINFUL MEMORY (Bard AF1)
    elseif (painfulMemory == QUEST_AVAILABLE and job == JOBS.BRD and level >= AF1_QUEST_LEVEL) then
        if (player:getVar("PainfulMemoryCS") == 0) then
            player:startEvent(138); -- Long dialog for "Painful Memory"
        else
            player:startEvent(137); -- Short dialog for "Painful Memory"
        end;
    elseif (painfulMemory == QUEST_ACCEPTED) then
        player:startEvent(136); -- During Quest "Painful Memory"

    -- CIRCLE OF TIME (Bard AF3)
    elseif (theRequiem == QUEST_COMPLETED and circleOfTime == QUEST_AVAILABLE and job == JOBS.BRD and level >= AF3_QUEST_LEVEL) then
        player:startEvent(139); -- Start "The Circle of Time"
    elseif (circleOfTime == QUEST_ACCEPTED) then
        player:messageSpecial(MERTAIRE_RING);

    -- DEFAULT DIALOG
    elseif (painfulMemory == QUEST_COMPLETED) then
        player:startEvent(135); -- Standard dialog after completed "Painful Memory"
    else
        player:messageSpecial(MERTAIRE_DEFAULT);

    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- THE OLD MONUMENT
    if (csid == 102) then
        player:setVar("TheOldMonument_Event",1);

    -- A MINSTREL IN DESPAIR
    elseif (csid == 101) then
        player:addGil(GIL_RATE*2100);
        player:messageSpecial(GIL_OBTAINED, GIL_RATE*2100);
        player:tradeComplete();
        player:completeQuest(JEUNO,A_MINSTREL_IN_DESPAIR);
        player:addFame(JEUNO, 30);

    -- PAINFUL MEMORY (Bard AF1)
    elseif (csid == 138 and option == 0) then
        player:setVar("PainfulMemoryCS",1); -- player declined quest
    elseif ((csid == 137 or csid == 138) and option == 1) then
        player:addQuest(JEUNO,PAINFUL_MEMORY);
        player:setVar("PainfulMemoryCS",0);
        player:addKeyItem(MERTAIRES_BRACELET);
        player:messageSpecial(KEYITEM_OBTAINED,MERTAIRES_BRACELET);

    -- CIRCLE OF TIME (Bard AF3)
    elseif (csid == 139) then
        player:addQuest(JEUNO,THE_CIRCLE_OF_TIME);
        player:setVar("circleTime",1);
    end;
end;
