-----------------------------------
-- Area: Nashmau
--  NPC: Ququroon
-- Type: Standard NPC
-- !pos -2.400 -1 66.824 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Nashmau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_ACCEPTED and player:getVar("ratraceCS") == 4) then
        if (trade:hasItemQty(5455,1) and trade:hasItemQty(5453,1) and trade:hasItemQty(5136,1) and trade:hasItemQty(5456,1) and trade:hasItemQty(5454,1) and trade:getItemCount() == 5) then
            player:startEvent(310);
        end
    end

end;

function onTrigger(player,npc)
    local ratRaceProg = player:getVar("ratraceCS");
    if (ratRaceProg == 3) then
       player:startEvent(309);
    elseif (ratRaceProg == 4) then
       player:startEvent(242);
    elseif (ratRaceProg >= 5) then
       player:startEvent(315);
    else
       player:startEvent(241);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 309) then
       player:setVar("ratraceCS",4);
    elseif (csid == 310) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,5595);
        else
            player:tradeComplete();
            player:addItem(5595);
            player:messageSpecial(ITEM_OBTAINED,5595);
            player:setVar("ratraceCS",5);
        end
    end
end;

