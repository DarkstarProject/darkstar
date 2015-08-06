-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Mainchelite
-- @zone 80
-- @pos -16 1 -30
-- CS IDs:
-- 0x005 = Generic Greeting for Iron Ram members
-- 0x006 = Mid Initiation of other nation
-- 0x007 = Ask player to Join Iron Rams
-- 0x008 = Ask if changed mind about joining Iron rams (after player has declined)
-- 0x009 = Mid Initiation of other nation
-- 0x00A = Player works for another nation, offer to switch +give quest
-- 0x00B = Player works for another nation, offer to switch +give quest
-- 0x00C = Complete investigation
-- 0x00D = "How fares the search, <player>?"
-- 0x00E = "How fares the search, <player>?"
-- 0x00F = No Red Recommendation Letter and has no nation affiliation
-- Todo: medal loss from nation switching. Since there is no rank-up yet, this isn't so important for now.
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Allegiance = player:getCampaignAllegiance();
    -- 0 = none, 1 = San d'Oria Iron Rams, 2 = Bastok Fighting Fourth, 3 = Windurst Cobras

    local TheFightingFourth = player:getQuestStatus(CRYSTAL_WAR,THE_FIGHTING_FOURTH);
    local SnakeOnThePlains = player:getQuestStatus(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
    local SteamedRams = player:getQuestStatus(CRYSTAL_WAR,STEAMED_RAMS);
    local RedLetter = player:hasKeyItem(RED_RECOMMENDATION_LETTER);
    local CharredPropeller = player:hasKeyItem(CHARRED_PROPELLER);
    local OxidizedPlate = player:hasKeyItem(OXIDIZED_PLATE);
    local ShatteredLumber = player:hasKeyItem(PIECE_OF_SHATTERED_LUMBER);

    if (TheFightingFourth == QUEST_ACCEPTED or SnakeOnThePlains == QUEST_ACCEPTED) then
        player:startEvent(0x009);
    elseif (SteamedRams == QUEST_AVAILABLE and RedLetter == true) then
        player:startEvent(0x007);
    elseif (SteamedRams == QUEST_AVAILABLE and player:getVar("RED_R_LETTER_USED") == 1) then
        player:startEvent(0x008);
    elseif (SteamedRams == QUEST_ACCEPTED and CharredPropeller == true and OxidizedPlate == true and ShatteredLumber == true) then
        player:startEvent(0x00C);
    elseif (SteamedRams == QUEST_ACCEPTED) then
        player:startEvent(0x00D);
    elseif (SteamedRams == QUEST_COMPLETED and Allegiance == 1) then
        player:startEvent(0x005);
    else
        player:startEvent(0x00F);
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
    if (csid == 0x007 and option == 0) then
        player:addQuest(CRYSTAL_WAR,STEAMED_RAMS);
        player:setVar("RED_R_LETTER_USED",1);
        player:delKeyItem(RED_RECOMMENDATION_LETTER);
    elseif (csid == 0x007 and option == 1) then
        player:setVar("RED_R_LETTER_USED",1);
        player:delKeyItem(RED_RECOMMENDATION_LETTER);
    elseif (csid == 0x008 and option == 0) then
        player:addQuest(CRYSTAL_WAR, STEAMED_RAMS);
    elseif (csid == 0x00A and option == 0) then
        player:addQuest(CRYSTAL_WAR, STEAMED_RAMS);
    elseif (csid == 0x00B and option == 0) then
        player:addQuest(CRYSTAL_WAR, STEAMED_RAMS);
    elseif (csid == 0x00C and option == 0) then
        -- Is first join, so add Sprinter's Shoes and bronze medal
        if (player:getVar("Campaign_Nation") == 0) then
            if (player:getFreeSlotsCount() >= 1) then
                player:setCampaignAllegiance(1);
                player:setVar("RED_R_LETTER_USED",0);
                player:addTitle(KNIGHT_OF_THE_IRON_RAM);
                player:addKeyItem(BRONZE_RIBBON_OF_SERVICE);
                player:addItem(15754);
                player:completeQuest(CRYSTAL_WAR,STEAMED_RAMS);
                player:delKeyItem(CHARRED_PROPELLER);
                player:delKeyItem(OXIDIZED_PLATE);
                player:delKeyItem(PIECE_OF_SHATTERED_LUMBER);
                player:messageSpecial(KEYITEM_OBTAINED, BRONZE_RIBBON_OF_SERVICE);
                player:messageSpecial(ITEM_OBTAINED, 15754);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15754);
            end
        else
            player:setCampaignAllegiance(1);
            player:setVar("RED_R_LETTER_USED",0);
            player:addTitle(KNIGHT_OF_THE_IRON_RAM);
            player:completeQuest(CRYSTAL_WAR,STEAMED_RAMS);
            player:delKeyItem(CHARRED_PROPELLER);
            player:delKeyItem(OXIDIZED_PLATE);
            player:delKeyItem(PIECE_OF_SHATTERED_LUMBER);
        end
    elseif (csid == 0x00D and option == 1) then
        player:delQuest(CRYSTAL_WAR,STEAMED_RAMS);
    end
end;