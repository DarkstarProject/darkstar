-----------------------------------
-- Area: Nashmau
--  NPC: Kyokyoroon
-- Standard Info NPC
-- !pos 18.020 -6.000 10.467 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Nashmau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_ACCEPTED and player:getVar("ratraceCS") == 5) then
        if (trade:hasItemQty(5595,1) and trade:getItemCount() == 1) then
            player:startEvent(311);
        end
    end
end;

function onTrigger(player,npc)
    local ratRaceProg = player:getVar("ratraceCS");

    if (ratRaceProg == 5) then
       player:startEvent(263);
    elseif (ratRaceProg == 6) then
       player:startEvent(316);
    elseif (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_COMPLETED) then
       player:startEvent(317);
    else
       player:startEvent(263);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 311) then
       player:tradeComplete();
       player:setVar("ratraceCS",6);
    end
end;

