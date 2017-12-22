-----------------------------------
-- Area: Windurst Woods
-- NPC:  Apururu
-- Involved in Quests: The Kind Cardian, Can Cardians Cry?
-- @zone 241
-- !pos -11 -2 13
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
package.loaded["scripts/globals/quests"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------


require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local TKC = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);
local C3 = player:getQuestStatus(WINDURST,CAN_CARDIANS_CRY);


    -- The Kind Cardian
    if (TKC == QUEST_ACCEPTED) then
        if (trade:hasItemQty(969,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then
            player:startEvent(397);
        end

    -- Can Cardians Cry?
    elseif (C3 == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        if (trade:hasItemQty(551,1) and count == 1) then
            player:startEvent(325,0,20000,5000); -- finish C3
        end

    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

local ANC3K = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_3000); -- previous quest in line
local C3 = player:getQuestStatus(WINDURST,CAN_CARDIANS_CRY);
local TKC = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);
local MissionStatus = player:getVar("MissionStatus");

    -- Windurst Mission 8-2
    if (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING) then
        if (MissionStatus == 0) then
            player:startEvent(588);
        elseif (MissionStatus == 2) then
            player:startEvent(601);
        elseif (MissionStatus == 6) then
            player:startEvent(590);
        elseif (MissionStatus == 7) then
            player:startEvent(589);
        elseif (MissionStatus == 8) then
            player:startEvent(592);
        elseif (MissionStatus == 10) then
            player:startEvent(609);
        end

        --Windurst Mission 9-1-2
    elseif (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD) then
        if (MissionStatus == 0) then
            player:startEvent(619);
        elseif (MissionStatus == 3) then
            player:startEvent(620);
        elseif (MissionStatus == 6) then --need to change satus
            player:startEvent(621);
        end

    -- Windurst Mission 1-2
    elseif (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
        if (MissionStatus == 0) then
            player:startEvent(137);
        elseif (MissionStatus < 4) then
            player:startEvent(138);
        elseif (MissionStatus == 6) then -- Cardinals encountered, no orbs
            -- Mission's over - Bad end (ish anyway, you lost the orbs)
            player:startEvent(143);
        elseif (MissionStatus == 5) then -- Cardinals not encountered
            -- Mission's over - Good end (you came back with the orbs)
            player:startEvent(145);
        end

    -- The Kind Cardian
    elseif (TKC == QUEST_ACCEPTED) then
            if (player:getVar("theKindCardianVar") == 0) then
                player:startEvent(392);
            elseif (player:getVar("theKindCardianVar") == 1) then
                player:startEvent(393);
            elseif (player:getVar("theKindCardianVar") == 2) then
                player:startEvent(398);
            end

    -- Can Cardians Cry?
    elseif (ANC3K == QUEST_COMPLETED and C3 == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 5) then
        player:startEvent(319,0,20000); -- start C3
    elseif (C3 == QUEST_ACCEPTED) then
        player:startEvent(320,0,20000); -- C3 reminder
    elseif (C3 == QUEST_COMPLETED) then
        player:startEvent(330); -- new dialog after C3

    -- standard dialog
    else
            player:startEvent(274);
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

    -- Windurst mission 1-2 start
    if (csid == 137) then
        player:setVar("MissionStatus",1);

        player:addKeyItem(FIRST_DARK_MANA_ORB);    -- Give the player the key items
        player:addKeyItem(SECOND_DARK_MANA_ORB);
        player:addKeyItem(THIRD_DARK_MANA_ORB);
        player:addKeyItem(FOURTH_DARK_MANA_ORB);
        player:addKeyItem(FIFTH_DARK_MANA_ORB);
        player:addKeyItem(SIXTH_DARK_MANA_ORB);

        player:messageSpecial(KEYITEM_OBTAINED,FIRST_DARK_MANA_ORB);    -- Display the key item messages
        player:messageSpecial(KEYITEM_OBTAINED,SECOND_DARK_MANA_ORB);
        player:messageSpecial(KEYITEM_OBTAINED,THIRD_DARK_MANA_ORB);
        player:messageSpecial(KEYITEM_OBTAINED,FOURTH_DARK_MANA_ORB);
        player:messageSpecial(KEYITEM_OBTAINED,FIFTH_DARK_MANA_ORB);
        player:messageSpecial(KEYITEM_OBTAINED,SIXTH_DARK_MANA_ORB);

        player:setVar("MissionStatus_orb1",1);    -- Set the orb variables; 1 = not handled; 2 = handled;
        player:setVar("MissionStatus_orb2",1);
        player:setVar("MissionStatus_orb3",1);
        player:setVar("MissionStatus_orb4",1);
        player:setVar("MissionStatus_orb5",1);
        player:setVar("MissionStatus_orb6",1);
    elseif (csid == 143 or csid == 145) then

        finishMissionTimeline(player,1,csid,option);

        player:setVar("MissionStatus_orb1",0);
        player:setVar("MissionStatus_orb2",0);
        player:setVar("MissionStatus_orb3",0);
        player:setVar("MissionStatus_orb4",0);
        player:setVar("MissionStatus_orb5",0);
        player:setVar("MissionStatus_orb6",0);


        player:delKeyItem(FIRST_GLOWING_MANA_ORB);    -- Remove the glowing orb key items
        player:delKeyItem(SECOND_GLOWING_MANA_ORB);
        player:delKeyItem(THIRD_GLOWING_MANA_ORB);
        player:delKeyItem(FOURTH_GLOWING_MANA_ORB);
        player:delKeyItem(FIFTH_GLOWING_MANA_ORB);
        player:delKeyItem(SIXTH_GLOWING_MANA_ORB);

    -- The Kind Cardian
    elseif (csid == 392 and option == 1) then
        player:setVar("theKindCardianVar",1);
    elseif (csid == 397) then
        player:delKeyItem(TWO_OF_SWORDS);
        player:setVar("theKindCardianVar",2);
        player:addFame(WINDURST,30);
        player:tradeComplete();

    -- Windurst 8-2
    elseif (csid == 588) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(MANUSTERY_RING);
    elseif (csid == 601) then
        player:setVar("MissionStatus",3);
    elseif (csid == 590) then
        player:setVar("MissionStatus",7);
    elseif (csid == 592) then
        player:setVar("MissionStatus",9);
    elseif (csid == 609) then
        player:setVar("ShantottoCS",1)
        finishMissionTimeline(player,3,csid,option);

    --Windurst 9-1
    elseif (csid == 619) then
        player:setVar("MissionStatus",1);
    elseif (csid == 620) then
        player:setVar("MissionStatus",4);
    elseif (csid == 621) then
        player:setVar("MissionStatus",7);
        player:messageSpecial(KEYITEM_LOST,LETTER_FROM_ZONPAZIPPA);
        player:delKeyItem(LETTER_FROM_ZONPAZIPPA);

    -- Can Cardians Cry
    elseif (csid == 319) then
        player:addQuest(WINDURST,CAN_CARDIANS_CRY);
    elseif (csid == 325) then
        player:completeQuest(WINDURST,CAN_CARDIANS_CRY);
        player:addGil(GIL_RATE*5000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*5000);
        player:tradeComplete();
    end
end;