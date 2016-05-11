-----------------------------------
-- Area: Upper Jeuno
--   NPC: Laila
--  Type: Job Quest Giver
-- @zone: 244
--  @pos -54.045 -1 100.996
--
--TODO--
-- make sure the surrounding npcs react to the player accordingly after each quest. There are a few event IDs that I don't recall using
-- make global variables for all these event hexvalues and put them in textids
--TODO--
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local lakesideMin = player:getQuestStatus(JEUNO,LAKESIDE_MINUET);
    local lakeProg = player:getVar("Lakeside_Minuet_Progress");
    if (lakesideMin == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL and ENABLE_WOTG == 1) then
        player:startEvent(0x277f); -- Start quest csid, asks for Key Item Stardust Pebble
    elseif (lakesideMin == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(0x2787);
    elseif (player:hasKeyItem(STARDUST_PEBBLE)) then
        player:startEvent(0x2786); -- Ends Quest
    elseif (lakeProg == 3) then
        player:startEvent(0x2781);
    elseif (lakesideMin == QUEST_ACCEPTED) then
        player:startEvent(0x2780); -- After accepting, reminder
    elseif ((player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_AVAILABLE
        or (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_COMPLETED
        and player:hasItem(19203) == false))
        and player:getMainJob() == JOBS.DNC and player:getMainLvl()>=40) then

        player:startEvent(0x2791);
    elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED and player:getVar("QuestStatus_DNC_AF1") == 5 and player:seenKeyItem(THE_ESSENCE_OF_DANCE) and player:getMainJob() == JOBS.DNC) then
        player:startEvent(0x2795);
    elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_ACCEPTED) then
        player:startEvent(0x2796);

    -- Dancer AF: The Road to Divadom
    elseif (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_COMPLETED
        and player:getQuestStatus(JEUNO,THE_ROAD_TO_DIVADOM) == QUEST_AVAILABLE
        and player:getMainJob() == JOBS.DNC) then

        player:startEvent(0x2798); -- CSID 10136
    elseif (player:getVar("roadToDivadomCS") == 1) then
        player:startEvent(0x2799); --  quest chat line after the quest has been accepted
    elseif (player:getVar("roadToDivadomCS") == 4) then
        player:startEvent(0x279B); --CSID 10139
    elseif (player:getVar("roadToDivadomCS") == 5) then
        player:startEvent(0x27BA); --CSID 10170. This should only occur if the player's inventory was full during the chain of events that start in the elseif above.

    -- Dancer AF: Comeback Queen
    elseif (player:getQuestStatus(JEUNO,THE_ROAD_TO_DIVADOM) == QUEST_COMPLETED
        and player:getQuestStatus(JEUNO, COMEBACK_QUEEN) == QUEST_AVAILABLE
        and player:getMainJob() == JOBS.DNC) then

        player:startEvent(0x279F);
    elseif (player:getVar("comebackQueenCS") == 1) then
        player:startEvent(0x27A0); -- quest chat line after quest accepted Rhea and Olgald have a line as well.
    elseif (player:getVar("comebackQueenCS") == 2) then
        player:startEvent(0x27A3);
    elseif (player:getVar("comebackQueenCS") == 3 or player:getVar("comebackQueenCS") == 6) then
        local currentVanaDay = VanadielDayOfTheYear();
        if (player:getVar("comebackQueenDanceOffTimer") < currentVanaDay) then
            player:startEvent(0x27A7);  -- play laila cs 10152->10154  olgald: 1053 if they lose the minigame
        else
            player:startEvent(0x279C);
        end
    elseif (player:getVar("comebackQueenCS") == 4 or player:getVar("comebackQueenCS") == 5) then
        player:startEvent(0x27AA); -- This occurs if the player's inventory was full during the final chain of events or if the player speaks with laila afterwards.
    else
        player:startEvent(0x2788); -- Default
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
    if (csid == 0x277f and option == 1) then
        player:addQuest(JEUNO,LAKESIDE_MINUET);
    elseif (csid == 0x2786) then
        player:setVar("Lakeside_Minuet_Progress",0);
        player:completeQuest(JEUNO,LAKESIDE_MINUET);
        player:addTitle(TROUPE_BRILIOTH_DANCER);
        player:unlockJob(19);
        player:messageSpecial(UNLOCK_DANCER);
        player:addFame(JEUNO, 30);
        player:delKeyItem(STARDUST_PEBBLE);
        player:needToZone(true);
    elseif (csid== 0x2791) then
        if (player:getQuestStatus(JEUNO,THE_UNFINISHED_WALTZ) == QUEST_COMPLETED) then
            player:delQuest(JEUNO,THE_UNFINISHED_WALTZ);
            player:delKeyItem(THE_ESSENCE_OF_DANCE);
        end
        player:addQuest(JEUNO,THE_UNFINISHED_WALTZ)
        player:setVar("QuestStatus_DNC_AF1", 1);

    elseif (csid== 0x2795) then
        player:setVar("QuestStatus_DNC_AF1", 0);
        player:addItem(19203); -- war hoop
        player:messageSpecial(ITEM_OBTAINED,19203);
        player:completeQuest(JEUNO,THE_UNFINISHED_WALTZ);

    -- Dancer AF: The Road to Divadom
    elseif (csid == 0x2798) then -- Road To Divadom pt 1
        player:setVar("roadToDivadomCS", 1);
        player:addQuest(JEUNO, THE_ROAD_TO_DIVADOM);
    elseif (csid == 0x279B) then -- string of events
        player:startEvent(0x27E6);
    elseif (csid == 0x27E6) then
        player:startEvent(0x27E7);
    elseif (csid == 0x27E7) then
        player:setVar("roadToDivadomCS", 5);
        player:startEvent(0x27BA);
    elseif (csid == 0x27BA) then
        if (player:getFreeSlotsCount() == 0) then
            -- do nothing. player doesn't have room to receive the reward item.
            player:messageSpecial( ITEM_CANNOT_BE_OBTAINED, 15660); -- the names of the gender specific items are the same
        else
            player:completeQuest(JEUNO, THE_ROAD_TO_DIVADOM)
            player:setVar("roadToDivadomCS", 0);
            player:setVar("dancerTailorCS", 1); -- allows player to start dancer version of Coffer AF. check Olgald and Matthias(@Bastok Markets) for the rest of the quest line
            -- determine what gender the player is so we can give the correct item
            local playerGender = player:getGender();
            local dancersTights = 15660 - playerGender;

            player:addItem(dancersTights);
            player:messageSpecial(ITEM_OBTAINED, dancersTights);
            player:completeQuest(JEUNO, THE_ROAD_TO_DIVADOM);
            end
    -- Dancer AF: Comeback Queen
    elseif (csid == 0x279F) then
        player:setVar("comebackQueenCS", 1);
        player:addQuest(JEUNO, COMEBACK_QUEEN);
        player:addKeyItem(WYATTS_PROPOSAL);
        player:messageSpecial( KEYITEM_OBTAINED, WYATTS_PROPOSAL);
    elseif (csid == 0x27A3) then
        player:setVar("comebackQueenCS", 3);
        local danceOffTimer = VanadielDayOfTheYear();
        player:setVar("comebackQueenDanceOffTimer", danceOffTimer);
    elseif (csid == 0x27A7) then --the dance off minigame
        if (option > 0) then -- player won the minigame
            player:startEvent(0x27E0);  -- starts exhausting string of events
        else
            player:setVar("comebackQueenCS", 6); -- have surrounding npcs use losing state CS
            local danceOffTimer = VanadielDayOfTheYear();
            player:setVar("comebackQueenDanceOffTimer", danceOffTimer);
        end
    elseif (csid == 0x27E0) then
        player:startEvent(0x27E1);
    elseif (csid == 0x27E1) then
        player:startEvent(0x27E2);
    elseif (csid == 0x27E2) then
        player:setVar("comebackQueenCS", 4);
        player:startEvent(0x27E3);
    elseif (csid == 0x27E3) then -- finally reward the player
        if (player:getFreeSlotsCount() == 0) then
            -- do nothing. player doesn't have room to receive the reward item.
            player:messageSpecial( ITEM_CANNOT_BE_OBTAINED, 14578); -- the names of the gender specific items are the same
        else
            player:completeQuest(JEUNO, COMEBACK_QUEEN);
            player:setVar("comebackQueenCS", 5); -- final state for all of the surrounding NPCs
            -- determine what gender the player is so we can give the correct item
            local playerGender = player:getGender();
            local dancersCasaque = 14579 - playerGender;

            player:addItem(dancersCasaque);
            player:messageSpecial(ITEM_OBTAINED, dancersCasaque);
            player:completeQuest(JEUNO, COMEBACK_QUEEN);
        end
    elseif (csid == 0x27AA) then
        if (player:getVar("comebackQueenCS") == 4) then -- player's inventory was full at the end of the final cutscene
            if (player:getFreeSlotsCount() == 0) then
                -- do nothing. player doesn't have room to receive the reward item.
                player:messageSpecial( ITEM_CANNOT_BE_OBTAINED, 14578); -- the names of the gender specific items are the same
            else
                player:completeQuest(JEUNO, COMEBACK_QUEEN);
                player:setVar("comebackQueenCS", 5) -- final state for all of the surrounding NPCs
                -- determine what gender the player is so we can give the correct item
                local playerGender = player:getGender();
                local dancersCasaque = 14579 - playerGender;

                player:addItem(dancersCasaque);
                player:messageSpecial(ITEM_OBTAINED, dancersCasaque);
                player:completeQuest(JEUNO, COMEBACK_QUEEN);
            end
        -- the surrounding NPCs should have their dialogue check comebackqueenCS as well.
        end
    end
end;
