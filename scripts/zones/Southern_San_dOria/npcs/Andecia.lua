-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Andecia
-- Starts and Finishes Quest: Grave Concerns
-- @zone 230
-- !pos 167 0 45
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,GRAVE_CONCERNS) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(547, 1) and trade:getItemCount() == 1 and player:getVar("OfferingWaterOK") == 1) then
            player:startEvent(624);
        end
    end

        -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    Tomb = player:getQuestStatus(SANDORIA,GRAVE_CONCERNS);
    WellWater = player:hasItem(567); -- Well Water
    Waterskin = player:hasItem(547); -- Tomb Waterskin

    if (Tomb == QUEST_AVAILABLE) then
        player:startEvent(541);
    elseif (Tomb == QUEST_ACCEPTED and WellWater == false and player:getVar("OfferingWaterOK") == 0) then
        player:startEvent(622);
    elseif (Tomb == QUEST_ACCEPTED and Waterskin == true and player:getVar("OfferingWaterOK") == 0) then
        player:startEvent(623);
    elseif (Tomb == QUEST_COMPLETED) then
        player:startEvent(558);
    else
        player:startEvent(540);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 541 and option == 0) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,567); -- Well Water
        else
            player:addQuest(SANDORIA,GRAVE_CONCERNS);
            player:setVar("graveConcernsVar",0);
            player:addItem(567);
            player:messageSpecial(ITEM_OBTAINED,567); -- Well Water
        end
    elseif (csid == 624) then
        player:tradeComplete();
        player:setVar("OfferingWaterOK",0);
        player:addTitle(ROYAL_GRAVE_KEEPER);
        player:addGil(GIL_RATE*560);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*560)
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,GRAVE_CONCERNS);
    end

end;