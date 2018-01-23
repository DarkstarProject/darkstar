-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Rholont
-- @zone 80
-- !pos -168 -2 56
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 1) then
        player:startEvent(23); -- Gifts of Griffon Start

    elseif (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 2 and player:getVar("GiftsOfGriffonPlumes") == 127) then
        player:startEvent(24); -- Gifts of Griffon Quest Complete

    elseif (player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_AVAILABLE and player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_COMPLETED and player:getMainLvl() >= 15) then
        player:startEvent(47) -- Claws of Griffon Start

    elseif (player:getVar("BoyAndTheBeast") == 1) then
        player:startEvent(56);

    elseif (player:getVar("BoyAndTheBeast") > 1 and player:getQuestStatus(CRYSTAL_WAR,BOY_AND_THE_BEAST) ~= QUEST_COMPLETED) then
        player:startEvent(57);

    elseif (player:getQuestStatus(CRYSTAL_WAR,BOY_AND_THE_BEAST) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON) == QUEST_AVAILABLE) then
        player:startEvent(59);
    elseif (player:getQuestStatus(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        if (player:getVar("WrathOfTheGriffon") < 2) then
            player:startEvent(61);
        elseif (player:getVar("WrathOfTheGriffon") == 2) then
            player:startEvent(60);
        end
    else
        player:startEvent(32); -- Default Dialogue
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 47) then
        player:addQuest(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON);
    elseif (csid == 23) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2528);
        else
            player:setVar("GiftsOfGriffonProg",2);
            player:addItem(2528,7); -- Plume d'or
            player:messageSpecial(ITEM_OBTAINED,2528);
        end

    elseif (csid == 24) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,812);
        else
            player:addItem(812,1)
            player:messageSpecial(ITEM_OBTAINED,812);
            player:setVar("GiftsOfGriffonProg",0);
            player:setVar("GiftsOfGriffonPlumes",0);
            player:completeQuest(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON);
        end
    elseif (csid == 56) then
        player:setVar("BoyAndTheBeast",2);
    elseif (csid == 59) then
        player:addQuest(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON);
    elseif (csid == 60) then
        player:completeQuest(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON);
        player:setVar("WrathOfTheGriffon",0);
        player:addKeyItem(MILITARY_SCRIP);
        player:messageSpecial(KEYITEM_OBTAINED,MILITARY_SCRIP);
    end

end;