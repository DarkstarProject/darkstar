-----------------------------------
-- Area: Bastok Markets
--  NPC: Gwill
-- Starts & Ends Quest: The Return of the Adventurer
-- Involved in Quests: The Cold Light of Day, Riding on the Clouds
-- !pos ? ? ? 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    local returnOfAdven = player:getQuestStatus(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
    if (returnOfAdven == QUEST_ACCEPTED and trade:hasItemQty(628,1) and trade:getItemCount() == 1) then
        player:startEvent(243);
    end

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 2) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    local pFame = player:getFameLevel(BASTOK);
    local FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
    local TheReturn = player:getQuestStatus(BASTOK,THE_RETURN_OF_THE_ADVENTURER);

    if (FatherFigure == QUEST_COMPLETED and TheReturn == QUEST_AVAILABLE and pFame >= 3) then
        player:startEvent(242);
    elseif (player:getQuestStatus(BASTOK,THE_COLD_LIGHT_OF_DAY) == QUEST_ACCEPTED) then
        player:startEvent(103);
    else
        player:startEvent(113);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 242) then
        player:addQuest(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
    elseif (csid == 243) then
        if (player:getFreeSlotsCount() >= 1) then
            player:tradeComplete();
            player:addTitle(KULATZ_BRIDGE_COMPANION);
            player:addItem(12498);
            player:messageSpecial(ITEM_OBTAINED,12498);
            player:addFame(BASTOK,80);
            player:completeQuest(BASTOK,THE_RETURN_OF_THE_ADVENTURER);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12498);
        end
    end

end;