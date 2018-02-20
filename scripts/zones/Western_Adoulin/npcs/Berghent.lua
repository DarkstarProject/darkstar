-----------------------------------
-- Area: Western Adoulin
--  NPC: Berghent
-- Type: Standard NPC and Quest NPC
--  Starts, Involved with, and Finishes Quest: 'Flavors of our Lives'
--  @zone 256
--  !pos 95 0 -28 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Western_Adoulin/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local FOOL = player:getQuestStatus(ADOULIN, FLAVORS_OF_OUR_LIVES);
    if (FOOL == QUEST_ACCEPTED) then
        if (player:hasKeyItem(BLIGHTBERRY)) then
            -- Finishes Quest: 'Flavors of Our Lives'
            player:startEvent(87);
        else
            -- Dialogue during Quest: 'Flavors of Our Lives'
            player:startEvent(82);
        end
    elseif (FOOL == QUEST_AVAILABLE) then
        if (player:getVar("FOOL_Refused_Once") == 1) then
            -- Starts Quest: 'Flavors of Our Lives' after player refused once
            player:startEvent(81);
        else
            -- Starts Quest: 'Flavors of Our Lives'
            player:startEvent(80);
        end
    else
        -- Dialogue after finishing  Quest: 'Flavors of Our Lives'
        player:startEvent(88);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 80) then
        if (option == 1) then
            -- Starts Quest: 'Flavors of Our Lives'
            player:addQuest(ADOULIN, FLAVORS_OF_OUR_LIVES);
            player:setVar("FOOL_Refused_Once", 0);
        else
            -- Refuses Quest: 'Flavors of Our Lives'
            player:setVar("FOOL_Refused_Once", 1);
        end
        --
    elseif (csid == 81) then
        if (option == 1) then
            -- Starts Quest: 'Flavors of Our Lives'
            player:addQuest(ADOULIN, FLAVORS_OF_OUR_LIVES);
            player:setVar("FOOL_Refused_Once", 0);
        end
    elseif (csid == 87) then
        -- Finishing Quest: 'Flavors of Our Lives'
        player:delKeyItem(BLIGHTBERRY);
        player:completeQuest(ADOULIN, FLAVORS_OF_OUR_LIVES);
        player:addExp(500 * EXP_RATE);
        player:addCurrency('bayld', 300 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 300 * BAYLD_RATE);
        player:addTitle(POTATION_PATHFINDER);
        player:addFame(ADOULIN);
    end
end;
