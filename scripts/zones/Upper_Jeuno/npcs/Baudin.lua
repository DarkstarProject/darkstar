-----------------------------------
-- Area: Upper Jeuno
--  NPC: Baudin
-- Starts and Finishes Quest: Crest of Davoi, Save My Sister
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- !pos -75 0 80
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(555,1) and trade:getItemCount() == 1) then
        a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
        if (a == 0 or (a ~= 32 and a ~= 96 and a ~= 160 and a ~= 288 and a ~= 544 and a ~= 224 and a ~= 800 and a ~= 352 and
           a ~= 672 and a ~= 416 and a ~= 608 and a ~= 480 and a ~= 736 and a ~= 864 and a ~= 928 and a ~= 992)) then
            player:startEvent(177,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
        end
    elseif (player:getQuestStatus(JEUNO,CREST_OF_DAVOI) == QUEST_ACCEPTED and trade:hasItemQty(4377,1) and trade:getItemCount() == 1) then
        player:startEvent(171); -- Finish Quest "Crest of Davoi" Start Quest "Save my Sister" with var, not addquest()
    end
end;

function onTrigger(player,npc)
    CrestOfDavoi = player:getQuestStatus(JEUNO,CREST_OF_DAVOI);
    SaveMySister = player:getQuestStatus(JEUNO,SAVE_MY_SISTER);

    -- You need to talk to Aldo before you can obtain the Crest of Davoi or Yagudo Torch
    if (player:hasKeyItem(SILVER_BELL) and CrestOfDavoi == QUEST_AVAILABLE) then
        player:startEvent(174); -- Start Quest "Crest of Davoi"
    elseif (CrestOfDavoi == QUEST_ACCEPTED) then
        player:startEvent(175); -- During Quest "Crest of Davoi"
    elseif (CrestOfDavoi == QUEST_COMPLETED and SaveMySister == QUEST_AVAILABLE and player:getVar("saveMySisterVar") == 1) then
        player:startEvent(172); -- During Quest "Save my Sister" (before speak with Mailloquetat)
    elseif (CrestOfDavoi == QUEST_COMPLETED and player:getVar("saveMySisterVar") == 2) then
        player:startEvent(105); -- During Quest "Save my Sister" (after speak with Mailloquetat)
    elseif (SaveMySister == QUEST_ACCEPTED and player:getVar("saveMySisterFireLantern") < 4) then
        player:startEvent(27); -- During Quest "Save my Sister" (after speak with Neraf-Najiruf)
    elseif (SaveMySister == QUEST_ACCEPTED and player:getVar("saveMySisterFireLantern") == 4) then
        player:startEvent(107); -- Ending Quest "Save my Sister"
    elseif (SaveMySister == QUEST_COMPLETED) then
        player:startEvent(176); -- New standard dialog after "Save my Sister"
    else
        player:startEvent(122); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 177) then --1
        player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
        player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 32);
    elseif (csid == 174 and option == 1) then
        player:addQuest(JEUNO,CREST_OF_DAVOI);
    elseif (csid == 171) then
        player:tradeComplete();
        player:setVar("saveMySisterVar",1);
        player:addKeyItem(CREST_OF_DAVOI_KI);
        player:messageSpecial(KEYITEM_OBTAINED,CREST_OF_DAVOI_KI);
        player:addFame(JEUNO, 30);
        player:completeQuest(JEUNO,CREST_OF_DAVOI);

    elseif (csid == 105) then
        player:setVar("saveMySisterVar",3);
    elseif (csid == 107) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17041);
        else
            player:addTitle(EXORCIST_IN_TRAINING);
            player:addGil(GIL_RATE*3000);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
            player:addItem(17041);
            player:messageSpecial(ITEM_OBTAINED,17041);
            player:tradeComplete();
            player:addFame(JEUNO, 30);
            player:completeQuest(JEUNO,SAVE_MY_SISTER);
        end
    end
end;