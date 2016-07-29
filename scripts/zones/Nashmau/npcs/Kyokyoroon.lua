-----------------------------------
-- Area: Nashmau
-- NPC: Kyokyoroon
-- Standard Info NPC
-- @pos 18.020 -6.000 10.467 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_ACCEPTED and player:getVar("ratraceCS") == 5) then
        if (trade:hasItemQty(5595,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0137);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local ratRaceProg = player:getVar("ratraceCS");

    if (ratRaceProg == 5) then  
       player:startEvent(0x0107);
    elseif (ratRaceProg == 6) then  
       player:startEvent(0x0013c);
    elseif (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_COMPLETED) then  
       player:startEvent(0x013d);
    else
       player:startEvent(0x0107);
    end

end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0137) then
       player:tradeComplete();
       player:setVar("ratraceCS",6);
    end
end;



