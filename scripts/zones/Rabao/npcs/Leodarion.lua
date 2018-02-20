-----------------------------------
-- Area: Rabao
--  NPC: Leodarion
-- Involved in Quest: 20 in Pirate Years, I'll Take the Big Box, True Will
-- !pos -50 8 40 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX) == QUEST_ACCEPTED and player:getVar("illTakeTheBigBoxCS") == 2) then
        if (trade:hasItemQty(17098,1) and trade:getItemCount() == 1) then -- Trade Oak Pole
            player:startEvent(92);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX) == QUEST_ACCEPTED) then
        illTakeTheBigBoxCS = player:getVar("illTakeTheBigBoxCS");

        if (illTakeTheBigBoxCS == 1) then
            player:startEvent(90);
        elseif (illTakeTheBigBoxCS == 2) then
            player:startEvent(91);
        elseif (illTakeTheBigBoxCS == 3 and VanadielDayOfTheYear() == player:getVar("illTakeTheBigBox_Timer")) then
            player:startEvent(93);
        elseif (illTakeTheBigBoxCS == 3) then
            player:startEvent(94);
        elseif (illTakeTheBigBoxCS == 4) then
            player:startEvent(95);
        end
    elseif (player:getQuestStatus(OUTLANDS,TRUE_WILL) == QUEST_ACCEPTED) then
        trueWillCS = player:getVar("trueWillCS");

        if (trueWillCS == 1) then
            player:startEvent(97);
        elseif (trueWillCS == 2 and player:hasKeyItem(LARGE_TRICK_BOX) == false) then
            player:startEvent(98);
        elseif (player:hasKeyItem(LARGE_TRICK_BOX)) then
            player:startEvent(99);
        end
    else
        player:startEvent(89);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 90) then
        player:setVar("illTakeTheBigBoxCS",2);
    elseif (csid == 92) then
        player:tradeComplete();
        player:setVar("illTakeTheBigBox_Timer",VanadielDayOfTheYear());
        player:setVar("illTakeTheBigBoxCS",3);
    elseif (csid == 94) then
        player:setVar("illTakeTheBigBox_Timer",0);
        player:setVar("illTakeTheBigBoxCS",4);
        player:addKeyItem(SEANCE_STAFF);
        player:messageSpecial(KEYITEM_OBTAINED,SEANCE_STAFF);
    elseif (csid == 97) then
        player:delKeyItem(OLD_TRICK_BOX);
        player:setVar("trueWillCS",2);
    elseif (csid == 99) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13782);
        else
            player:delKeyItem(LARGE_TRICK_BOX);
            player:addItem(13782);
            player:messageSpecial(ITEM_OBTAINED,13782); -- Ninja Chainmail
            player:setVar("trueWillCS",0);
            player:addFame(NORG,30);
            player:completeQuest(OUTLANDS,TRUE_WILL);
        end
    end

end;