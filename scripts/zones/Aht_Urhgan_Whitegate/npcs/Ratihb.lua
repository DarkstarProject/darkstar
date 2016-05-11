-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Ratihb
-- Standard Info NPC
-- @pos 75.225 -6.000 -137.203 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local LuckOfTheDraw = player:getQuestStatus(AHT_URHGAN,LUCK_OF_THE_DRAW);
    local EquipedforAllOccasions = player:getQuestStatus(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS);
    
    if (LuckOfTheDraw == QUEST_AVAILABLE and player:getMainLvl() >= ADVANCED_JOB_LEVEL) then        -- corsair job quest
        player:startEvent(0x0223);    
        player:setVar("LuckOfTheDraw",1);
        player:addQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);
    elseif (player:getQuestStatus(AHT_URHGAN,LUCK_OF_THE_DRAW) == QUEST_COMPLETED and player:getVar("LuckOfTheDraw") ==5) then    -- Ending CS for Corsair Optional
        player:startEvent(0x0228);
        player:setVar("LuckOfTheDraw",6);
    elseif (player:getVar("EquipedforAllOccasions") ==4 and player:getVar("LuckOfTheDraw") ==6) then --Af1 Final CS
        player:startEvent(0x0304);
        player:setVar("EquipedforAllOccasions",5);
        player:setVar("LuckOfTheDraw",0);
    elseif (player:getQuestStatus(AHT_URHGAN,NAVIGATING_THE_UNFRIENDLY_SEAS) == QUEST_COMPLETED and player:getMainJob() == JOBS.COR and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(0x031D);
    elseif (player:getQuestStatus(AHT_URHGAN,LUCK_OF_THE_DRAW) == QUEST_COMPLETED and player:getQuestStatus(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS) == QUEST_COMPLETED) then
        player:setVar("EquipedforAllOccasions",0);
    else    
        player:startEvent(0x025B);    -- standard dialog
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

    if (csid == 0x0304) then
        local AFgun = 18702; 
        if (player:getFreeSlotsCount() >= 1) then
            player:addItem(AFgun) -- Receive Af1 Trump Gun
            player:messageSpecial(ITEM_OBTAINED,AFgun);
            player:completeQuest(AHT_URHGAN,EQUIPED_FOR_ALL_OCCASIONS);
            player:setVar("EquipedforAllOccasions",0);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,AFgun);
        end
        
    elseif (csid == 0x031D) then
        player:setVar("AgainstAllOdds",1); -- Set For Corsair BCNM
        player:setVar("AgainstAllOddsSideQuests",1); -- Set For Corsair Side Quests
        player:addQuest(AHT_URHGAN,AGAINST_ALL_ODDS); -- Start of af 3 not completed yet
        player:addKeyItem(LIFE_FLOAT); -- BCNM KEY ITEM TO ENTER BCNM
        player:messageSpecial(KEYITEM_OBTAINED, LIFE_FLOAT);
    end
end;



