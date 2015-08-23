-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Rholont
-- @zone 80
-- @pos -168 -2 56
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 1) then
        player:startEvent(0x0017); -- Gifts of Griffon Start
        
    elseif (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 2 and player:getVar("GiftsOfGriffonPlumes") == 127) then
        player:startEvent(0x0018); -- Gifts of Griffon Quest Complete

    elseif (player:getQuestStatus(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON) == QUEST_AVAILABLE and player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_COMPLETED and player:getMainLvl() >= 15) then
        player:startEvent(0x002F) -- Claws of Griffon Start
    
    elseif (player:getVar("BoyAndTheBeast") == 1) then
        player:startEvent(0x0038);
    
    elseif (player:getVar("BoyAndTheBeast") > 1 and player:getQuestStatus(CRYSTAL_WAR,BOY_AND_THE_BEAST) ~= QUEST_COMPLETED) then
        player:startEvent(0x0039);
        
    elseif (player:getQuestStatus(CRYSTAL_WAR,BOY_AND_THE_BEAST) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON) == QUEST_AVAILABLE) then
        player:startEvent(0x003B);
    elseif (player:getQuestStatus(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON) == QUEST_ACCEPTED) then
        if (player:getVar("WrathOfTheGriffon") < 2) then
            player:startEvent(0x003D);
        elseif (player:getVar("WrathOfTheGriffon") == 2) then
            player:startEvent(0x003C);
        end
    else
        player:startEvent(0x0020); -- Default Dialogue
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
    if (csid == 0x002F) then
        player:addQuest(CRYSTAL_WAR,CLAWS_OF_THE_GRIFFON);
    elseif (csid == 0x0017) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2528);
        else
            player:setVar("GiftsOfGriffonProg",2);
            player:addItem(2528,7); -- Plume d'or
            player:messageSpecial(ITEM_OBTAINED,2528);
        end
    
    elseif (csid == 0x0018) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,812);
        else
            player:addItem(812,1)
            player:messageSpecial(ITEM_OBTAINED,812);
            player:setVar("GiftsOfGriffonProg",0);
            player:setVar("GiftsOfGriffonPlumes",0);
            player:completeQuest(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON);
        end
    elseif (csid == 0x0038) then
        player:setVar("BoyAndTheBeast",2);
    elseif (csid == 0x003B) then
        player:addQuest(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON);
    elseif (csid == 0x003C) then
        player:completeQuest(CRYSTAL_WAR,WRATH_OF_THE_GRIFFON);
        player:setVar("WrathOfTheGriffon",0);
        player:addKeyItem(MILITARY_SCRIP);
        player:messageSpecial(KEYITEM_OBTAINED,MILITARY_SCRIP);
    end

end;