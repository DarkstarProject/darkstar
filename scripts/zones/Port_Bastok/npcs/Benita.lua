-----------------------------------
-- Area: Port Bastok
--  NPC: Benita
-- Starts Quest: The Wisdom Of Elders
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
BombAsh = trade:hasItemQty(928,1);

    if (count == 1 and BombAsh == true) then
        TheWisdom = player:getQuestStatus(BASTOK,THE_WISDOM_OF_ELDERS);
        TheWisdomVar = player:getVar("TheWisdomVar");
        if (TheWisdom == 1 and TheWisdomVar == 2) then
            player:tradeComplete();
            player:startEvent(176);
        end
    end

end;

function onTrigger(player,npc)

TheWisdom = player:getQuestStatus(BASTOK,THE_WISDOM_OF_ELDERS);
pLevel = player:getMainLvl();

    if (TheWisdom == 0 and pLevel >= 6) then
        player:startEvent(174);
    else
    rand = math.random(1,2);
        if (rand ==1) then
            player:startEvent(102);
        else
            player:startEvent(103);
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 174) then
        player:addQuest(BASTOK,THE_WISDOM_OF_ELDERS);
        player:setVar("TheWisdomVar",1);
    elseif (csid == 176) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12500);
        else
            player:completeQuest(BASTOK,THE_WISDOM_OF_ELDERS);
            player:addFame(BASTOK,120);
            player:addItem(12500);
            player:messageSpecial(ITEM_OBTAINED,12500);
        end
    end

end;




