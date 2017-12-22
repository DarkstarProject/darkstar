-----------------------------------
-- Area: Upper Jeuno
-- NPC: Ilumida
-- Starts and Finishes Quest: A Candlelight Vigil
-- !pos -75 -1 58 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local aCandlelightVigil = player:getQuestStatus(JEUNO,A_CANDLELIGHT_VIGIL);
    local SearchingForWords = player:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);

    --this variable implicitly stores: JFame >= 7 and ACandlelightVigil == QUEST_COMPLETED and RubbishDay == QUEST_COMPLETED and
    --NeverToReturn == QUEST_COMPLETED and SearchingForTheRightWords == QUEST_AVAILABLE and prereq CS complete
    local SearchingForWords_prereq = player:getVar("QuestSearchRightWords_prereq");


    if (player:getFameLevel(JEUNO) >= 4 and aCandlelightVigil == QUEST_AVAILABLE) then
        player:startEvent(192); --Start quest : Ilumida asks you to obtain a candle ...
    elseif (aCandlelightVigil == QUEST_ACCEPTED) then
        if (player:hasKeyItem(HOLY_CANDLE) == true) then
            player:startEvent(194); --Finish quest : CS NOT FOUND.
        else
            player:startEvent(191); --quest accepted dialog
        end

    elseif (player:getVar("QuestACandlelightVigil_denied") == 1) then
        player:startEvent(193); --quest denied dialog, asks again for A Candlelight Vigil

    elseif (SearchingForWords_prereq == 1) then --has player completed prerequisite cutscene with Kurou-Morou?
        player:startEvent(197); --SearchingForTheRightWords intro CS

    elseif (player:getVar("QuestSearchRightWords_denied") == 1) then
        player:startEvent(201); --asks player again, SearchingForTheRightWords accept/deny

    elseif (SearchingForWords == QUEST_ACCEPTED) then
        if (player:hasKeyItem(MOONDROP) == true) then
            player:startEvent(198);
        else
            player:startEvent(199); -- SearchingForTheRightWords quest accepted dialog
        end

    elseif (player:getVar("SearchingForRightWords_postcs") == -1) then
        player:startEvent(196);

    elseif (SearchingForWords == QUEST_COMPLETED) then
        player:startEvent(200);

    else
        player:startEvent(189); --Standard dialog
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
    if ((csid == 192 and option == 1) or (csid == 193 and option == 1)) then --just start quest
        player:addQuest(JEUNO,A_CANDLELIGHT_VIGIL);
        player:setVar("QuestACandlelightVigil_denied", 0);

    elseif (csid == 192 and option == 0) then --quest denied, special eventIDs available
        player:setVar("QuestACandlelightVigil_denied", 1);

    elseif (csid == 194) then --finish quest
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13094);
        else
            player:addTitle(ACTIVIST_FOR_KINDNESS);
            player:delKeyItem(HOLY_CANDLE);
            player:addItem(13094);
            player:messageSpecial(ITEM_OBTAINED,13094);
            player:needToZone(true);
            player:addFame(JEUNO, 30);
            player:completeQuest(JEUNO,A_CANDLELIGHT_VIGIL);
        end

    elseif (csid == 197 and option == 0) then --quest denied, special eventIDs available
        player:setVar("QuestSearchRightWords_prereq", 0); --remove charVar from memory
        player:setVar("QuestSearchRightWords_denied", 1);

    elseif ((csid == 197 and option == 1) or (csid == 201 and option == 1)) then
        player:setVar("QuestSearchRightWords_prereq", 0); --remove charVar from memory
        player:setVar("QuestSearchRightWords_denied", 0);
        player:addQuest(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);

    elseif (csid == 198) then --finish quest, note: no title granted
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4882);
        else
            player:delKeyItem(MOONDROP);
            player:messageSpecial(GIL_OBTAINED, GIL_RATE*3000)
            player:addItem(4882);
            player:messageSpecial(ITEM_OBTAINED,4882);
            player:addFame(JEUNO, 30);
            player:completeQuest(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);
            player:setVar("SearchingForRightWords_postcs", -2);
        end
    elseif (csid == 196) then
        player:setVar("SearchingForRightWords_postcs", 0);
    end
end;