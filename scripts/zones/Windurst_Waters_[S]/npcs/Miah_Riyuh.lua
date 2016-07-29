-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Miah Riyuh
-- @pos 5.323 -2 37.462 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Windurst_Waters_[S]/TextIDs");

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
    local GreenLetter = player:hasKeyItem(GREEN_RECOMMENDATION_LETTER);

    if (SteamedRams == QUEST_ACCEPTED or TheFightingFourth == QUEST_ACCEPTED) then
        player:startEvent(122);
    elseif (SnakeOnThePlains == QUEST_AVAILABLE and GreenLetter == true) then
        player:startEvent(103);
    elseif (SnakeOnThePlains == QUEST_AVAILABLE and player:getVar("GREEN_R_LETTER_USED") == 1) then
        player:startEvent(105);
    elseif (SnakeOnThePlains == QUEST_ACCEPTED and player:isMaskFull(player:getVar("SEALED_DOORS"),3) == true) then
        player:startEvent(106);
    elseif (SnakeOnThePlains == QUEST_ACCEPTED and player:hasKeyItem(ZONPAZIPPAS_ALLPURPOSE_PUTTY)) then
        local PuttyUsed = 0;
        if (player:getMaskBit(player:getVar("SEALED_DOORS"),0)) then
            PuttyUsed = PuttyUsed +1;
        end
        if (player:getMaskBit(player:getVar("SEALED_DOORS"),1)) then
            PuttyUsed = PuttyUsed +1;
        end
        if (player:getMaskBit(player:getVar("SEALED_DOORS"),2)) then
            PuttyUsed = PuttyUsed +1;
        end
        player:startEvent(104, 0, 0, 0, 0, 0, 0, 0, PuttyUsed);
    elseif (SnakeOnThePlains == QUEST_COMPLETED and Allegiance == 3) then
        player:startEvent(107);
    else
        player:startEvent(121);
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
    if (csid == 103 and option == 0) then
        player:addQuest(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
        player:addKeyItem(ZONPAZIPPAS_ALLPURPOSE_PUTTY);
        player:setVar("GREEN_R_LETTER_USED",1);
        player:delKeyItem(GREEN_RECOMMENDATION_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED, ZONPAZIPPAS_ALLPURPOSE_PUTTY);
    elseif (csid == 103 and option == 1) then
        player:setVar("GREEN_R_LETTER_USED",1);
        player:delKeyItem(GREEN_RECOMMENDATION_LETTER);
    elseif (csid == 104 and option == 1) then
        player:delQuest(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
        player:delKeyItem(ZONPAZIPPAS_ALLPURPOSE_PUTTY);
        player:setVar("SEALED_DOORS", 0);
    elseif (csid == 105 and option == 0) then
        player:addQuest(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
        player:addKeyItem(ZONPAZIPPAS_ALLPURPOSE_PUTTY);
        player:setVar("GREEN_R_LETTER_USED",1);
        player:delKeyItem(GREEN_RECOMMENDATION_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED, ZONPAZIPPAS_ALLPURPOSE_PUTTY);
    elseif (csid == 106 and option == 0) then
        -- Is first join, so add Sprinter's Shoes and bronze medal
        if (player:getVar("Campaign_Nation") == 0) then
            if (player:getFreeSlotsCount() >= 1) then
                player:setCampaignAllegiance(3);
                player:setVar("GREEN_R_LETTER_USED",0);
                player:addTitle(COBRA_UNIT_MERCENARY);
                player:addKeyItem(BRONZE_RIBBON_OF_SERVICE);
                player:addItem(15754);
                player:completeQuest(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
                player:setVar("SEALED_DOORS", 0);
                player:messageSpecial(KEYITEM_OBTAINED, BRONZE_RIBBON_OF_SERVICE);
                player:messageSpecial(ITEM_OBTAINED, 15754);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15754);
            end
        else
            player:setCampaignAllegiance(3);
            player:setVar("GREEN_R_LETTER_USED",0);
            player:addTitle(COBRA_UNIT_MERCENARY);
            player:completeQuest(CRYSTAL_WAR,SNAKE_ON_THE_PLAINS);
            player:setVar("SEALED_DOORS", 0);
        end
    end
end;