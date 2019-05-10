-----------------------------------
-- Area: Heaven's Tower
--  NPC: Chumimi
-- Starts and Finishes Quest: The Three Magi, Recollections
-- !pos 0.1 30 21 242
-----------------------------------
local ID = require("scripts/zones/Heavens_Tower/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_THREE_MAGI) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1104,1) and trade:getItemCount() == 1) then -- Trade Glowstone
            player:startEvent(269); -- Finish Quest "The Three Magi"
        end
    elseif (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.RECOLLECTIONS) == QUEST_ACCEPTED and player:getVar("recollectionsQuest") < 2) then
        if (trade:hasItemQty(1105,1) and trade:getItemCount() == 1) then
            player:startEvent(271);
        end
    elseif (player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM) == QUEST_ACCEPTED and player:getVar("rootProblem") == 1) then
        if (trade:hasItemQty(829,1) and trade:getItemCount() == 1) then
            player:startEvent(278);
        end
    end

end;

function onTrigger(player,npc)

    local theThreeMagi = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_THREE_MAGI);
    local recollections = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.RECOLLECTIONS);
    local rootProblem = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM);

    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();

    if (theThreeMagi == QUEST_AVAILABLE and mJob == dsp.job.BLM and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(260,0,613,0,0,0,1104); -- Start Quest "The Three Magi" --- NOTE: 5th parameter is "Meteorites" but he doesn't exist ---
    elseif (theThreeMagi == QUEST_ACCEPTED) then
        player:startEvent(261,0,0,0,0,0,1104); -- During Quest "The Three Magi"
    elseif (theThreeMagi == QUEST_COMPLETED and recollections == QUEST_AVAILABLE and (mJob == dsp.job.BLM and mLvl < AF2_QUEST_LEVEL or mJob ~= dsp.job.BLM)) then
        player:startEvent(268); -- New standard dialog after "The Three Magi"
    elseif (theThreeMagi == QUEST_COMPLETED and mJob == dsp.job.BLM and mLvl >= AF2_QUEST_LEVEL and player:needToZone() == false and recollections == QUEST_AVAILABLE) then
        player:startEvent(270,0,1105); -- Start Quest "Recollections"
    elseif (recollections == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.FOE_FINDER_MK_I)) then
        player:startEvent(275); -- Finish Quest "Recollections"
    elseif (recollections == QUEST_COMPLETED and rootProblem == QUEST_AVAILABLE and mJob == dsp.job.BLM and mLvl >= 50 and player:needToZone() == false) then
            player:startEvent(276,0,829); -- Start Quest "The Root of The problem"
    elseif (rootProblem == QUEST_ACCEPTED) then
        if (player:getVar("rootProblem") == 1) then
            player:startEvent(277,0,829);
        elseif (player:getVar("rootProblem") == 2) then
            player:startEvent(279);
        elseif ( player:getVar("rootProblem") == 3) then
            player:startEvent(281);
        end
    else
        player:startEvent(259); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 260) then
        -- option 3: Koru-Moru -- option 2: Shantotto -- option 1: Yoran-Oran
        player:addQuest(WINDURST,dsp.quest.id.windurst.THE_THREE_MAGI);
        player:setVar("theThreeMagiSupport",option);
    elseif (csid == 269) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,17423); -- Casting Wand
        else
            choosetitle = player:getVar("theThreeMagiSupport");

            if (choosetitle == 3) then
                player:addTitle(dsp.title.PROFESSOR_KORUMORU_SUPPORTER);
            elseif (choosetitle == 2) then
                player:addTitle(dsp.title.DOCTOR_SHANTOTTO_SUPPORTER);
            else
                player:addTitle(dsp.title.DOCTOR_YORANORAN_SUPPORTER);
            end

            player:tradeComplete();
            player:addItem(17423);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17423); -- Casting Wand
            player:needToZone(true);
            player:setVar("theThreeMagiSupport",0);
            player:addFame(WINDURST,AF1_FAME);
            player:completeQuest(WINDURST,dsp.quest.id.windurst.THE_THREE_MAGI);
        end
    elseif (csid == 270) then
        player:addQuest(WINDURST,dsp.quest.id.windurst.RECOLLECTIONS);
    elseif (csid == 271) then
        player:tradeComplete();
        player:setVar("recollectionsQuest",2);
    elseif (csid == 275) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14092); -- wizards sabots
        else
            player:setVar("recollectionsQuest",0);
            player:delKeyItem(dsp.ki.FOE_FINDER_MK_I);
            player:addItem(14092);
            player:messageSpecial(ID.text.ITEM_OBTAINED,14092); -- wizards sabots
            player:addFame(WINDURST,AF2_FAME);
            player:completeQuest(WINDURST,dsp.quest.id.windurst.RECOLLECTIONS);
        end
    elseif (csid == 276) then
        player:addQuest(WINDURST,dsp.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM);
        player:setVar("rootProblem",1);
    elseif (csid == 279) then
        player:addKeyItem(dsp.ki.SLUICE_SURVEYOR_MK_I);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SLUICE_SURVEYOR_MK_I);
    elseif (csid == 281) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
        else
            player:completeQuest(WINDURST,dsp.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM);
            player:addItem(13856);
            player:messageSpecial(ID.text.ITEM_OBTAINED,13856);
            player:addTitle(dsp.title.PARAGON_OF_BLACK_MAGE_EXCELLENCE);
            player:delKeyItem(dsp.ki.SLUICE_SURVEYOR_MK_I);
        end
    end

end;