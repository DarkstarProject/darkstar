-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Abeaule
-- Starts and Finishes Quest: The Trader in the Forest, The Medicine Woman
-- @pos -136 -2 56 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    theTraderInTheForest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
    
    if (theTraderInTheForest == QUEST_ACCEPTED) then
        if (trade:hasItemQty(4367,1) and trade:getItemCount() == 1) then -- Trade Batagreens 
            player:startEvent(0x020d);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    theTraderInTheForest = player:getQuestStatus(SANDORIA,THE_TRADER_IN_THE_FOREST);
    medicineWoman = player:getQuestStatus(SANDORIA,THE_MEDICINE_WOMAN);
    
    if (theTraderInTheForest == QUEST_AVAILABLE) then
        if (player:getVar("theTraderInTheForestCS") == 1) then
            player:startEvent(0x0250);
        else
            player:startEvent(0x020c);
            player:setVar("theTraderInTheForestCS",1);
        end
    elseif (theTraderInTheForest == QUEST_ACCEPTED) then
        player:startEvent(0x0251);
    elseif (theTraderInTheForest == QUEST_COMPLETED and medicineWoman == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
        if (player:getVar("medicineWomanCS") == 1) then 
            player:startEvent(0x0267);
        else
            player:startEvent(0x0265);
            player:setVar("medicineWomanCS",1);
        end
    elseif (player:hasKeyItem(COLD_MEDICINE)) then
        player:startEvent(0x0266);
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

    -- "The Trader in the Forest" Quest
    if (csid == 0x020c and option == 0 or csid == 0x0250 and option == 0) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,592);
        else
            player:addQuest(SANDORIA,THE_TRADER_IN_THE_FOREST);
            player:setVar("theTraderInTheForestCS",0);
            player:addItem(592);
            player:messageSpecial(ITEM_OBTAINED,592); -- Supplies Order
        end
    elseif (csid == 0x0251 and option == 1) then
        local SUPPLIES_ORDER = 592;
        if (player:getFreeSlotsCount() > 0 and player:hasItem(592) == false) then -- Supplies Order
            player:addItem(SUPPLIES_ORDER);
            player:messageSpecial(ITEM_OBTAINED, SUPPLIES_ORDER);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, SUPPLIES_ORDER);
        end
    elseif (csid == 0x020d) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12600); -- Robe
        else
            player:tradeComplete();
            player:addTitle(GREEN_GROCER);
            player:addItem(12600);
            player:messageSpecial(ITEM_OBTAINED,12600); -- Robe
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_TRADER_IN_THE_FOREST);
        end
    -- "The Medicine Woman" Quest
    elseif (csid == 0x0265 and option == 0 or csid == 0x0267 and option == 0) then
        player:addQuest(SANDORIA,THE_MEDICINE_WOMAN);
    elseif (csid == 0x0266) then
        player:addTitle(TRAVELING_MEDICINE_MAN); 
        player:delKeyItem(COLD_MEDICINE);
        player:addGil(GIL_RATE*2100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2100);    
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,THE_MEDICINE_WOMAN);
    end
    
end;