-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Balasiel
-- Starts and Finishes: A Squire's Test, A Squire's Test II, A Knight's Test
-- @zone 230
-- @pos -136 -11 64
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(940,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0269);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local LvL = player:getMainLvl();
    local ASquiresTest = player:getQuestStatus(SANDORIA, A_SQUIRE_S_TEST);
    local ASquiresTestII = player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST_II);
    local AKnightsTest = player:getQuestStatus(SANDORIA, A_KNIGHT_S_TEST);

    if (player:getQuestStatus(SANDORIA,KNIGHT_STALKER) == QUEST_ACCEPTED and player:getVar("KnightStalker_Progress") == 2) then
        player:startEvent(63); -- DRG AF3 cutscene, doesn't appear to have a follow up.
    elseif (LvL < 7) then
        player:startEvent(0x029c);
    elseif (LvL >= 7 and ASquiresTest ~= QUEST_COMPLETED) then
        if (ASquiresTest == 0) then
            if (player:getVar("SquiresTest") == 1) then
                player:startEvent(0x0277);
            else
                player:startEvent(0x0268);
            end
        elseif (ASquiresTest == QUEST_ACCEPTED) then
            player:startEvent(0x029b);
        end
    elseif (LvL >= 7 and LvL < 15) then
        player:startEvent(0x029f);
    elseif (LvL >= 15 and ASquiresTestII ~= QUEST_COMPLETED) then
        local StalactiteDew = player:hasKeyItem(STALACTITE_DEW)
        
        if (ASquiresTestII == QUEST_AVAILABLE) then
            player:startEvent(0x0271);
        elseif (ASquiresTestII == QUEST_ACCEPTED and StalactiteDew == false) then
            player:startEvent(0x0276);
        elseif (StalactiteDew) then
            player:startEvent(0x0272);
        else
            player:startEvent(0x029b);
        end
    elseif (LvL >= 15 and LvL < 30) then
        player:startEvent(0x029e);
    elseif (LvL >= 30 and AKnightsTest ~= QUEST_COMPLETED) then
        if (AKnightsTest == 0) then
            if (player:getVar("KnightsTest_Event") == 1) then
                player:startEvent(0x027b);
            else
                player:startEvent(0x0273);
            end
        elseif (player:hasKeyItem(KNIGHTS_SOUL)) then
            player:startEvent(0x0274);
        else
            player:startEvent(0x029d);
        end
    else
        player:startEvent(0x029b);
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

    if (csid == 0x0268) then
        if (option == 0) then
            player:addQuest(SANDORIA,A_SQUIRE_S_TEST);
        else
            player:setVar("SquiresTest_Event",1);
        end 
    elseif (csid == 0x0277 and option == 0) then
        player:addQuest(SANDORIA,A_SQUIRE_S_TEST);
        player:setVar("SquiresTest_Event",0);
    elseif (csid == 0x0269) then
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
    elseif (csid == 0x0271 or csid == 0x0276) then
        player:addQuest(SANDORIA,A_SQUIRE_S_TEST_II);
    elseif (csid == 0x0272) then
        player:tradeComplete();
        player:addTitle(SPELUNKER);
        player:delKeyItem(STALACTITE_DEW);
        player:addKeyItem(SQUIRE_CERTIFICATE);
        player:messageSpecial(KEYITEM_OBTAINED, SQUIRE_CERTIFICATE);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,A_SQUIRE_S_TEST_II);
    elseif (csid == 0x0273) then
        if (option == 0) then
            player:addQuest(SANDORIA,A_KNIGHT_S_TEST);
            player:addKeyItem(BOOK_OF_TASKS);
            player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_TASKS);
        else
            player:setVar("KnightsTest_Event",1);
        end
    elseif (csid == 0x027b and option == 0) then
        player:addQuest(SANDORIA,A_KNIGHT_S_TEST);
        player:addKeyItem(BOOK_OF_TASKS);
        player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_TASKS);
        player:setVar("KnightsTest_Event",0);
    elseif (csid == 0x0274) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addTitle(TRIED_AND_TESTED_KNIGHT);
            player:delKeyItem(KNIGHTS_SOUL);
            player:delKeyItem(BOOK_OF_TASKS);
            player:delKeyItem(BOOK_OF_THE_WEST);
            player:delKeyItem(BOOK_OF_THE_EAST);
            player:addItem(12306);
            player:messageSpecial(ITEM_OBTAINED, 12306); -- Kite Shield
            player:unlockJob(7); --Paladin
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
--    player:startEvent(0x7fb2)     -- starlight celebration
--    player:startEvent(0x000a)     -- methods create madness you havent used the weapon to full extent 
--    player:startEvent(0x0008)      -- methods create madness start
--    player:startEvent(0x000b)      -- methods create nadness menu
--    player:startEvent(0x0009)      -- methods create madness map 
--    player:startEvent(0x000c)     -- methods create madness map reminder  
--    player:startEvent(0x000d)     -- methods create madness end