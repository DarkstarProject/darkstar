-----------------------------------
--  Area: Western Adoulin
--  NPC: Berghent
--  Type: Standard NPC and Quest NPC
--  Starts, Involved with, and Finishes Quest: 'Flavors of our Lives'
--  @zone 256
--  @pos 95 0 -28 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local FOOL = player:getQuestStatus(ADOULIN, FLAVORS_OF_OUR_LIVES);
    if (FOOL == QUEST_ACCEPTED) then
        if (player:hasKeyItem(BLIGHTBERRY)) then
            -- Finishes Quest: 'Flavors of Our Lives'
            player:startEvent(0x0057);
        else
            -- Dialogue during Quest: 'Flavors of Our Lives'
            player:startEvent(0x0052);
        end
    elseif (FOOL == QUEST_AVAILABLE) then
        if (player:getVar("FOOL_Refused_Once") == 1) then
            -- Starts Quest: 'Flavors of Our Lives' after player refused once
            player:startEvent(0x0051);
        else
            -- Starts Quest: 'Flavors of Our Lives'
            player:startEvent(0x0050);
        end
    else
        -- Dialogue after finishing  Quest: 'Flavors of Our Lives'
        player:startEvent(0x0058);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x0050) then
        if (option == 1) then
            -- Starts Quest: 'Flavors of Our Lives'
            player:addQuest(ADOULIN, FLAVORS_OF_OUR_LIVES);
            player:setVar("FOOL_Refused_Once", 0);
        else
            -- Refuses Quest: 'Flavors of Our Lives'
            player:setVar("FOOL_Refused_Once", 1);
        end
        --
    elseif (csid == 0x0051) then
        if (option == 1) then
            -- Starts Quest: 'Flavors of Our Lives'
            player:addQuest(ADOULIN, FLAVORS_OF_OUR_LIVES);
            player:setVar("FOOL_Refused_Once", 0);
        end
    elseif (csid == 0x0057) then
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
