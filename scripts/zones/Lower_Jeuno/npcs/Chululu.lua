-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Chululu
-- Starts and Finishes Quests: Collect Tarut Cards, Rubbish Day
-- Optional Cutscene at end of Quest: Searching for the Right Words
-- @pos -13 -6 -42 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,COLLECT_TARUT_CARDS) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(558,1) == true and trade:hasItemQty(559,1) == true and trade:hasItemQty(561,1) == true and trade:hasItemQty(562,1) == true and trade:getItemCount() == 4) then
            player:startEvent(0x00c8); -- Finish quest "Collect Tarut Cards"
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local CollectTarutCards = player:getQuestStatus(JEUNO,COLLECT_TARUT_CARDS);
    local RubbishDay = player:getQuestStatus(JEUNO,RUBBISH_DAY);
    local SearchingForTheRightWords = player:getQuestStatus(JEUNO,SEARCHING_FOR_THE_RIGHT_WORDS);

    if (player:getFameLevel(JEUNO) >= 3 and CollectTarutCards == QUEST_AVAILABLE) then
        player:startEvent(0x001C); -- Start quest "Collect Tarut Cards" with option
    elseif (CollectTarutCards == QUEST_ACCEPTED) then
        player:startEvent(0x001B); -- During quest "Collect Tarut Cards"
    elseif (CollectTarutCards == QUEST_COMPLETED and RubbishDay == QUEST_AVAILABLE and player:getVar("RubbishDay_day") ~= VanadielDayOfTheYear()) then
--      prog = player:getVar("RubbishDay_prog");
--      if (prog <= 2) then
--          player:startEvent(0x00c7); -- Required to get compatibility 3x on 3 diff game days before quest is kicked off
--      elseif (prog == 3) then
            player:startEvent(0x00c6); -- Start quest "Rubbish Day" with option
--      end
    elseif (CollectTarutCards == QUEST_COMPLETED and RubbishDay == QUEST_AVAILABLE) then
        player:startEvent(0x0039); -- Standard dialog between 2 quests
    elseif (RubbishDay == QUEST_ACCEPTED and player:getVar("RubbishDayVar") == 0) then
        player:startEvent(0x0031); -- During quest "Rubbish Day"
    elseif (RubbishDay == QUEST_ACCEPTED and player:getVar("RubbishDayVar") == 1) then
        player:startEvent(0x00c5); -- Finish quest "Rubbish Day"

    elseif (SearchingForTheRightWords == QUEST_COMPLETED) then
        if (player:getVar("SearchingForRightWords_postcs") < -1) then
            player:startEvent(0x0038);
        else
            player:startEvent(0x0057); -- final state, after all quests complete
        end

    elseif (RubbishDay == QUEST_COMPLETED) then
        player:startEvent(0x0057); -- New standard dialog

    else
        player:startEvent(0x001A); -- Standard dialog
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

    if (csid == 0x001C and option == 0) then
        local rand = math.random(1,4);
        local card = 0;

        if (rand == 1) then
            card = 559; -- Tarut: Death
        elseif (rand == 2) then
            card = 562; -- Tarut: Hermit
        elseif (rand == 3) then
            card = 561; -- Tarut: King
        else
            card = 558; -- Tarut: Fool
        end

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,card);
        else
            player:addQuest(JEUNO,COLLECT_TARUT_CARDS);
            player:addItem(card,5);
            player:messageSpecial(ITEM_OBTAINED,card);
        end
    elseif (csid == 0x00c8) then
        player:addTitle(CARD_COLLECTOR);
        player:addFame(JEUNO, JEUNO_FAME*30);
        player:tradeComplete();
        player:completeQuest(JEUNO,COLLECT_TARUT_CARDS);
    elseif (csid == 0x00c7 and option == 0) then
        player:setVar("RubbishDay_prog", player:getVar("RubbishDay_prog") + 1);
        player:setVar("RubbishDay_day", VanadielDayOfTheYear()); -- new vanadiel day
    elseif (csid == 0x00c6 and option == 0) then
        player:addQuest(JEUNO,RUBBISH_DAY);
        player:addKeyItem(MAGIC_TRASH);
        player:messageSpecial(KEYITEM_OBTAINED,MAGIC_TRASH);
        player:setVar("RubbishDay_prog",0);
        player:setVar("RubbishDay_day",0);
    elseif (csid == 0x00c5) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13083);
        else
            player:addGil(GIL_RATE*6000);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*6000);
            player:addItem(13083);
            player:messageSpecial(ITEM_OBTAINED,13083);
            player:setVar("RubbishDayVar",0);
            player:addFame(JEUNO, JEUNO_FAME*30);
            player:completeQuest(JEUNO,RUBBISH_DAY);
        end
    end
end;