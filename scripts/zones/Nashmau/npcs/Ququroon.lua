-----------------------------------
--  Area: Nashmau
--  NPC:  Ququroon
--  Type: Standard NPC
--  @pos -2.400 -1 66.824 53
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

    if (player:getQuestStatus(AHT_URHGAN,RAT_RACE) == QUEST_ACCEPTED and player:getVar("ratraceCS") == 4) then
        if (trade:hasItemQty(5455,1) and trade:hasItemQty(5453,1) and trade:hasItemQty(5136,1) and trade:hasItemQty(5456,1) and trade:hasItemQty(5454,1) and trade:getItemCount() == 5) then
            player:startEvent(0x0136);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local ratRaceProg = player:getVar("ratraceCS");
    if (ratRaceProg == 3) then  
       player:startEvent(0x0135);
    elseif (ratRaceProg == 4) then  
       player:startEvent(0x00f2);
    elseif (ratRaceProg >= 5) then  
       player:startEvent(0x013b);
    else
       player:startEvent(0x00f1);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0135) then            
       player:setVar("ratraceCS",4);
    elseif (csid == 0x0136) then
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

