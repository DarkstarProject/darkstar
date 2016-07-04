-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Derrick
-- Involved in Quests and finish : Save the Clock Tower
-- @zone 245
-- @pos -32 -1 -7
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    TotalNPC = player:getVar("saveTheClockTowerNPCz1") + player:getVar("saveTheClockTowerNPCz2");
    if (TotalNPC == 1023 and trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
        player:startEvent(0x00e7); -- Ending quest "save the clock tower"
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    AirshipKI = player:hasKeyItem(AIRSHIP_PASS);
    saveTheClockTower = player:getQuestStatus(JEUNO,SAVE_THE_CLOCK_TOWER);
    NPCNumber = player:getVar("saveTheClockTowerVar"); -- Quest step & number of npc
    AgreeSignPetition = player:getVar("saveTheClockTowerVar2"); -- Sum of all NPC
    
    if (AirshipKI == false and saveTheClockTower == QUEST_ACCEPTED and NPCNumber >= 1 and NPCNumber <= 11) then
        player:startEvent(0x00e6,4,10); -- airship + petition help/restart
    elseif (AirshipKI == true and saveTheClockTower == QUEST_ACCEPTED and NPCNumber >= 1 and NPCNumber <= 11) then
        player:startEvent(0x00e6,6,10); -- petition help/restart
    elseif (AirshipKI == false and saveTheClockTower == QUEST_ACCEPTED and NPCNumber == 0) then
        player:startEvent(0x00e6,8,10); -- airship + petition
    elseif (AirshipKI == true and saveTheClockTower == QUEST_ACCEPTED and NPCNumber == 0) then
        player:startEvent(0x00e6,10,10); -- petition
    elseif (AirshipKI == false) then
        player:startEvent(0x00e6,12); -- airship
    else
        player:startEvent(0x00e6,14); -- rien
    end
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00e6 and option == 10) then
        if (player:delGil(500000)) then
            player:addKeyItem(AIRSHIP_PASS);
            player:updateEvent(0, 1);
        else
            player:updateEvent(0, 0);
        end
    end

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00e6 and option == 10) then
        if (player:hasKeyItem(AIRSHIP_PASS) == true) then
            player:messageSpecial(KEYITEM_OBTAINED,AIRSHIP_PASS);
        end
    elseif (csid == 0x00e6 and option == 20) then 
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,555);
        else 
            player:addItem(555);
            player:messageSpecial(ITEM_OBTAINED,555);
            player:setVar("saveTheClockTowerVar",1);
            player:setVar("saveTheClockTowerNPCz1",0);
            player:setVar("saveTheClockTowerNPCz2",0);
        end
    elseif (csid == 0x00e6 and option == 30) then 
        if (player:hasItem(555) == true) then 
            player:messageSpecial(ITEM_OBTAINED,555);
            player:setVar("saveTheClockTowerVar",1);
            player:setVar("saveTheClockTowerNPCz1",0);
            player:setVar("saveTheClockTowerNPCz2",0);
        else 
            if (player:getFreeSlotsCount() == 0) then 
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,555);
            else
                player:addItem(555);
                player:messageSpecial(ITEM_OBTAINED,555);
                player:setVar("saveTheClockTowerVar",1);
                player:setVar("saveTheClockTowerNPCz1",0);
                player:setVar("saveTheClockTowerNPCz2",0);
            end
        end
    elseif (csid == 0x00e7) then 
        player:setVar("saveTheClockTowerVar",0);
        player:setVar("saveTheClockTowerNPCz1",0);
        player:setVar("saveTheClockTowerNPCz2",0);
        player:addTitle(CLOCK_TOWER_PRESERVATIONIST);
        player:addFame(JEUNO, 30);
        player:tradeComplete(trade);
        player:completeQuest(JEUNO,SAVE_THE_CLOCK_TOWER);
    end
end;



