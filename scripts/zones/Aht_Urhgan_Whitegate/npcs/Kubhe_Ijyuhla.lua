-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Kubhe Ijyuhla
-- Standard Info NPC
-- !pos 23.257 0.000 21.532 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local threeMenProg = player:getVar("threemenandaclosetCS");
    local threeMenQuest = player:getQuestStatus(AHT_URHGAN,THREE_MEN_AND_A_CLOSET);
    if (player:getQuestStatus(AHT_URHGAN,GOT_IT_ALL) == QUEST_COMPLETED and threeMenQuest == QUEST_AVAILABLE) then
        player:startEvent(836);
    elseif (threeMenProg == 2) then
           player:startEvent(837);
    elseif (threeMenProg == 3) then
           player:startEvent(838);
    elseif (threeMenProg == 4) then
           player:startEvent(839);
    elseif (threeMenProg == 5) then
           player:startEvent(842);
    elseif (threeMenProg == 6) then
           player:startEvent(845);
    elseif (threeMenQuest == QUEST_COMPLETED) then
        player:startEvent(846);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 836) then
       player:addQuest(AHT_URHGAN,THREE_MEN_AND_A_CLOSET);
       player:setVar("threemenandaclosetCS",2);
    elseif (csid == 838) then
       player:setVar("threemenandaclosetCS",4);
    elseif (csid == 845) then
        if (player:getFreeSlotsCount() == 0) then
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2184);
        else
           player:setVar("threemenandaclosetCS",0);
           player:addItem(2184,1);
           player:messageSpecial(ITEM_OBTAINEDX,2184,1);
           player:completeQuest(AHT_URHGAN,THREE_MEN_AND_A_CLOSET);
        end
    end
end;

