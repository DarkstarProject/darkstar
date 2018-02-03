-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Balasiel
-- Starts and Finishes: A Squire's Test, A Squire's Test II, A Knight's Test
-- @zone 230
-- !pos -136 -11 64
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(940,1) and trade:getItemCount() == 1) then
            player:startEvent(617);
        end
    end

end;

function onTrigger(player,npc)

    local LvL = player:getMainLvl();
    local ASquiresTest = player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST);
    local ASquiresTestII = player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II);
    local AKnightsTest = player:getQuestStatus(SANDORIA, A_KNIGHT_S_TEST);

    if (player:getQuestStatus(SANDORIA,KNIGHT_STALKER) == QUEST_ACCEPTED and player:getVar("KnightStalker_Progress") == 2) then
        player:startEvent(63); -- DRG AF3 cutscene, doesn't appear to have a follow up.
    elseif (LvL < 7) then
        player:startEvent(668);
    elseif (LvL >= 7 and ASquiresTest ~= QUEST_COMPLETED) then
        if (ASquiresTest == 0) then
            if (player:getVar("SquiresTest") == 1) then
                player:startEvent(631);
            else
                player:startEvent(616);
            end
        elseif (ASquiresTest == QUEST_ACCEPTED) then
            player:startEvent(667);
        end
    elseif (LvL >= 7 and LvL < 15) then
        player:startEvent(671);
    elseif (LvL >= 15 and ASquiresTestII ~= QUEST_COMPLETED) then
        local StalactiteDew = player:hasKeyItem(STALACTITE_DEW)

        if (ASquiresTestII == QUEST_AVAILABLE) then
            player:startEvent(625);
        elseif (ASquiresTestII == QUEST_ACCEPTED and StalactiteDew == false) then
            player:startEvent(630);
        elseif (StalactiteDew) then
            player:startEvent(626);
        else
            player:startEvent(667);
        end
    elseif (LvL >= 15 and LvL < 30) then
        player:startEvent(670);
    elseif (LvL >= 30 and AKnightsTest ~= QUEST_COMPLETED) then
        if (AKnightsTest == 0) then
            if (player:getVar("KnightsTest_Event") == 1) then
                player:startEvent(635);
            else
                player:startEvent(627);
            end
        elseif (player:hasKeyItem(KNIGHTS_SOUL)) then
            player:startEvent(628);
        else
            player:startEvent(669);
        end
    else
        player:startEvent(667);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 616) then
        if (option == 0) then
            player:addQuest(SANDORIA,A_SQUIRE_S_TEST);
        else
            player:setVar("SquiresTest_Event",1);
        end
    elseif (csid == 631 and option == 0) then
        player:addQuest(SANDORIA,A_SQUIRE_S_TEST);
        player:setVar("SquiresTest_Event",0);
    elseif (csid == 617) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:tradeComplete();
            player:addTitle(KNIGHT_IN_TRAINING);
            player:addItem(16565);
            player:messageSpecial(ITEM_OBTAINED, 16565); -- Spatha
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,A_SQUIRE_S_TEST);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 16565); -- Spatha
        end
    elseif (csid == 625 or csid == 630) then
        player:addQuest(SANDORIA,A_SQUIRE_S_TEST_II);
    elseif (csid == 626) then
        player:tradeComplete();
        player:addTitle(SPELUNKER);
        player:delKeyItem(STALACTITE_DEW);
        player:addKeyItem(SQUIRE_CERTIFICATE);
        player:messageSpecial(KEYITEM_OBTAINED, SQUIRE_CERTIFICATE);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,A_SQUIRE_S_TEST_II);
    elseif (csid == 627) then
        if (option == 0) then
            player:addQuest(SANDORIA,A_KNIGHT_S_TEST);
            player:addKeyItem(BOOK_OF_TASKS);
            player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_TASKS);
        else
            player:setVar("KnightsTest_Event",1);
        end
    elseif (csid == 635 and option == 0) then
        player:addQuest(SANDORIA,A_KNIGHT_S_TEST);
        player:addKeyItem(BOOK_OF_TASKS);
        player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_TASKS);
        player:setVar("KnightsTest_Event",0);
    elseif (csid == 628) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addTitle(TRIED_AND_TESTED_KNIGHT);
            player:delKeyItem(KNIGHTS_SOUL);
            player:delKeyItem(BOOK_OF_TASKS);
            player:delKeyItem(BOOK_OF_THE_WEST);
            player:delKeyItem(BOOK_OF_THE_EAST);
            player:addItem(12306);
            player:messageSpecial(ITEM_OBTAINED, 12306); -- Kite Shield
            player:unlockJob(JOBS.PLD);
            player:messageSpecial(UNLOCK_PALADIN);
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,A_KNIGHT_S_TEST);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 12306); -- Kite Shield
        end
    elseif (csid == 63) then
        player:setVar("KnightStalker_Progress",3);
    end

end;
--    player:startEvent(32690)     -- starlight celebration
--    player:startEvent(10)     -- methods create madness you havent used the weapon to full extent
--    player:startEvent(8)      -- methods create madness start
--    player:startEvent(11)      -- methods create nadness menu
--    player:startEvent(9)      -- methods create madness map
--    player:startEvent(12)     -- methods create madness map reminder
--    player:startEvent(13)     -- methods create madness end