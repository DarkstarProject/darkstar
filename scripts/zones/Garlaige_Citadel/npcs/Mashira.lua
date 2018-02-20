-----------------------------------
-- Area: Garlaige Citadel
--  NPC: Mashira
-- Involved in Quests: Rubbish day, Making Amens!
-- !pos 141 -6 138 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(JEUNO,RUBBISH_DAY) == QUEST_ACCEPTED and player:getVar("RubbishDayVar") == 0) then
        player:startEvent(11,1); -- For the quest "Rubbish day"
    elseif (player:getQuestStatus(WINDURST,MAKING_AMENS) == QUEST_ACCEPTED) then
        if (player:hasKeyItem(128) == true) then
            player:startEvent(11,3);
        else player:startEvent(11,0); -- Making Amens dialogue
        end
    else
        player:startEvent(11,3); -- Standard dialog and menu
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
RubbishDay = player:getQuestStatus(JEUNO,RUBBISH_DAY);
MakingAmens = player:getQuestStatus(WINDURST,MAKING_AMENS);
    if (csid == 11 and option == 1 and RubbishDay == QUEST_ACCEPTED) then
        player:delKeyItem(MAGIC_TRASH);
        player:setVar("RubbishDayVar",1);
    elseif (csid == 11 and option == 0 and MakingAmens == QUEST_ACCEPTED) then
        player:addKeyItem(128); --Broken Wand
        player:messageSpecial(KEYITEM_OBTAINED,128);
        player:tradeComplete();
    end
end;

