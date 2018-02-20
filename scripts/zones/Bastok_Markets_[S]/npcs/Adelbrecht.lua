-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Adelbrecht
-- Starts Quests: The Fighting Fourth
-- Involved in Missions: Back to the Beginning
-- CS IDs:
-- 139 = 139 = Greetings, civilian. The Seventh Cohors of the Republican Legion's Fourth Division is currently recruiting new troops.
-- 140 = 140 = I thought you didn't have any questions...throw in the towel yes/no
-- 141 = 141 = Mid quest, after first npc in N Gust
-- 142 = 142 = Mid quest, after second npc in N Gust
-- 143 = 143 = Complete quest, get bronze ribbon
-- 162 = 162 = After cs143, before heading over to talk to next person
-- 359 = 0x0167 = A CS where player is looking for Lilisette, with flashback of Lilisette asking about player
-- 361 = 0x0169 = After asking in CS 359
-- Todo: medal loss from nation switching. Since there is no rank-up yet, this isn't so important for now.
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local Allegiance = player:getCampaignAllegiance();
    -- 0 = none, 1 = San d'Oria Iron Rams, 2 = Bastok Fighting Fourth, 3 = Windurst Cobras

    local TheFightingFourth = player:getQuestStatus(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
    local SnakeOnThePlains = player:getQuestStatus(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
    local SteamedRams = player:getQuestStatus(CRYSTAL_WAR,STEAMED_RAMS);
    local BlueLetter = player:hasKeyItem(BLUE_RECOMMENDATION_LETTER);
    local BattleRations = player:hasKeyItem(BATTLE_RATIONS);

    if (TheFightingFourth == QUEST_AVAILABLE and BlueLetter == true) then
        player:startEvent(139);
    elseif (TheFightingFourth == QUEST_AVAILABLE and player:getVar("BLUE_R_LETTER_USED") == 1) then
        player:startEvent(139);
    elseif (TheFightingFourth == QUEST_ACCEPTED and BattleRations == true) then
        player:startEvent(140);
    elseif (TheFightingFourth == QUEST_ACCEPTED and player:getVar("THE_FIGHTING_FOURTH") == 1) then
        player:startEvent(141);
    elseif (TheFightingFourth == QUEST_ACCEPTED and player:getVar("THE_FIGHTING_FOURTH") == 2) then
        player:startEvent(142);
    elseif (TheFightingFourth == QUEST_ACCEPTED and player:getVar("THE_FIGHTING_FOURTH") == 3) then
        player:startEvent(143);
    elseif (TheFightingFourth == QUEST_COMPLETED and Allegiance == 1) then
        player:startEvent(162);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 139 and option == 1) then
        player:addKeyItem(BATTLE_RATIONS);
        player:messageSpecial(KEYITEM_OBTAINED,BATTLE_RATIONS);
        player:addQuest(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
        player:setVar("BLUE_R_LETTER_USED",1);
        player:delKeyItem(BLUE_RECOMMENDATION_LETTER);
    elseif (csid == 140 and option == 1) then
        player:delKeyItem(BATTLE_RATIONS);
        player:delQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
    elseif (csid == 141 or csid == 142 and option == 1) then
        player:delQuest(CRYSTAL_WAR, THE_FIGHTING_FOURTH);
    elseif (csid == 143) then
        -- Is first join, so add Sprinter's Shoes and bronze medal
        if (player:getVar("Campaign_Nation") == 0) then
            if (player:getFreeSlotsCount() >= 1) then
                player:setCampaignAllegiance(2);
                player:setVar("BLUE_R_LETTER_USED",0);
                player:addTitle(FOURTH_DIVISION_SOLDIER);
                player:addKeyItem(BRONZE_RIBBON_OF_SERVICE);
                player:addItem(15754);
                player:completeQuest(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
                player:messageSpecial(KEYITEM_OBTAINED, BRONZE_RIBBON_OF_SERVICE);
                player:messageSpecial(ITEM_OBTAINED, 15754);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15754);
            end
        else
            player:setCampaignAllegiance(2);
            player:setVar("BLUE_R_LETTER_USED",0);
            player:addTitle(FOURTH_DIVISION_SOLDIER);
            player:completeQuest(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
        end
    end
end;