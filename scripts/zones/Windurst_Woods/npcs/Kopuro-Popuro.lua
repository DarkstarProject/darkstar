-----------------------------------
-- Area: Windurst Woods
--  NPC: Kopuro-Popuro
-- Type: Standard NPC
-- !pos -0.037 -4.749 -22.589 241
-- Starts Quests: The All-New C-2000, Legendary Plan B, The All-New C-3000
-- Involved in quests: Lost Chick
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");


function onTrade(player,npc,trade)

    local allnew = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_2000);
    local LPB = player:getQuestStatus(WINDURST,LEGENDARY_PLAN_B);
    local ANC3K = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_3000);

    -- The All New C-2000
    if (allnew == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        if (trade:hasItemQty(856,1) and trade:hasItemQty(4368,1) and trade:hasItemQty(846,1) and count == 3) then
            player:startEvent(292,GIL_RATE*200); -- Correct items given, complete quest.
        else
            player:startEvent(288,0,856,846,4368); -- Incorrect or not enough items.
        end

    -- Legendary Plan B
    elseif (LPB == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        if (trade:hasItemQty(529,1) and trade:hasItemQty(940,1) and trade:hasItemQty(858,1) and count == 3) then
            player:startEvent(314,0,529,940,858); -- Correct items given, complete quest in onEventUpdate
        else
            player:startEvent(309,0,529,940,858); -- Incorrect or not enough items
        end

    -- The All New C-3000
    elseif (ANC3K == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        if (trade:hasItemQty(889,1) and trade:hasItemQty(939,1) and count == 2) then
            player:startEvent(657,0,889,939); -- Correct items given, complete quest in onEventUpdate
        else
            player:startEvent(656,0,889,939); -- Incorrect or not enough items
        end

    -- Repeat The All New C-3000
    elseif (ANC3K == QUEST_COMPLETED) then
        count = trade:getItemCount();
        if (trade:hasItemQty(889,1) and trade:hasItemQty(939,1) and count == 2) then
            player:startEvent(657,0,889,939); -- Correct items given, complete quest in onEventUpdate
        else
            player:startEvent(656,0,889,939); -- Incorrect or not enough items
        end

    end

end;

function onTrigger(player,npc)

    local allnew = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_2000);
    local AGreetingCardian = player:getQuestStatus(WINDURST,A_GREETING_CARDIAN); -- previous quest in line
    local AGCcs = player:getVar("AGreetingCardian_Event"); -- for supplemental dialog before start of Legendary Plan B
    local LPB = player:getQuestStatus(WINDURST,LEGENDARY_PLAN_B);
    local ANC3K = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_3000);

    -- The All New C-3000
    if (LPB == QUEST_COMPLETED and ANC3K == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 4) then
        if (player:needToZone()) then
            player:startEvent(316); -- Post quest text from LPB
        else
        player:startEvent(655,0,889,939); -- ANC3K start
        end

    -- Repeating The All New C-3000
    elseif (ANC3K == QUEST_COMPLETED) then
        player:startEvent(659,0,889,939);

    -- A Greeting Cardian supplemental text
    elseif (AGreetingCardian == QUEST_ACCEPTED and AGCcs == 5) then
        player:startEvent(301); -- Supplemental text when AGreetingCardian in progress, right before completion

    -- Legendary Plan B
    elseif (AGreetingCardian == QUEST_COMPLETED and LPB == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 3) then
        if (player:needToZone()) then
            player:startEvent(306); -- Supplemental text for AGreetingCardian before start of LPB
        else
        player:startEvent(308,0,529,940,858); -- LPB start
        end

    elseif (LPB == QUEST_ACCEPTED) then
        player:startEvent(309,0,529,940,858); -- LPB reminder

    -- standard dialog after Legendary Plan B
    elseif (LPB == QUEST_COMPLETED) then
        player:startEvent(316);

    -- The All New C-2000
    elseif (allnew == QUEST_AVAILABLE) then
        player:startEvent(285,0,856,846,4368); -- Start Quest
    elseif (allnew == QUEST_ACCEPTED) then
        player:startEvent(288,0,856,846,4368); -- Reminder Dialogue
    elseif (allnew == QUEST_COMPLETED) then
        player:startEvent(293); -- Post Quest Finish Text

    -- No Quest Available
    else
        player:startEvent(276);

    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    -- The All New C-2000
    if (csid == 285 and option ~= 2) then  -- option 2 is declining the quest for the second question
        player:addQuest(WINDURST,THE_ALL_NEW_C_2000);
    elseif (csid == 292) then
        player:tradeComplete();
        player:addFame(WINDURST,80);
        player:addTitle(CARDIAN_TUTOR);
        player:addGil(GIL_RATE*200);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
        player:completeQuest(WINDURST,THE_ALL_NEW_C_2000);

    -- Start LPB
    elseif (csid == 308) then
        player:addQuest(WINDURST,LEGENDARY_PLAN_B);

    -- Finish LPB
    elseif (csid == 314) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12749); -- Scentless Armlets
        else
        player:tradeComplete();
        player:addFame(WINDURST,30);
        player:addGil(GIL_RATE*700);
        player:addItem(12749);
        player:messageSpecial(ITEM_OBTAINED,12749); -- Scentless Armlets
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*700);
        player:completeQuest(WINDURST,LEGENDARY_PLAN_B);
        player:needToZone(true); -- zone before starting The All New C-3000
        end

    -- start The All New C-3000
    elseif (csid == 655) then
        player:addQuest(WINDURST,THE_ALL_NEW_C_3000);

    -- finish The All New C-3000
    elseif (csid == 657) then
        player:tradeComplete();
        player:addFame(WINDURST,10);
        player:addGil(GIL_RATE*600);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*600);
        player:completeQuest(WINDURST,THE_ALL_NEW_C_3000);
    end
end;
