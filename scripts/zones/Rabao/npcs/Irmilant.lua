-----------------------------------
-- Area: Rabao
-- NPC: Irmilant
-- Starts and Ends Quests: The Immortal Lu Shang and Indomitable Spirit
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    Indomitable = player:getQuestStatus(OUTLANDS,INDOMITABLE_SPIRIT);
    ImmortalLuShang = player:getQuestStatus(OUTLANDS,THE_IMMORTAL_LU_SHANG);
    
    if ((ImmortalLuShang == QUEST_ACCEPTED or ImmortalLuShang == QUEST_COMPLETED) and trade:hasItemQty(720,1) and trade:hasItemQty(489,1) and trade:hasItemQty(4102,2) and trade:getItemCount() == 4) then
        player:startEvent(0x004e); 
    elseif ((Indomitable == QUEST_ACCEPTED or Indomitable == QUEST_COMPLETED) and trade:hasItemQty(1837,1) and trade:hasItemQty(1826,1) and trade:getItemCount() == 2) then    
        player:startEvent(0x0084);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    Indomitable = player:getQuestStatus(OUTLANDS,INDOMITABLE_SPIRIT);
    ImmortalLuShang = player:getQuestStatus(OUTLANDS,THE_IMMORTAL_LU_SHANG);
    realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day

    if (player:hasItem(489) == true and (ImmortalLuShang == QUEST_AVAILABLE or ImmortalLuShang == QUEST_COMPLETED)) then
        player:startEvent(0x004d); --Offer the quest if the player has the broken rod
    elseif (player:hasKeyItem(1977) == true and (Indomitable == QUEST_AVAILABLE or Indomitable == QUEST_COMPLETED)) then
        player:startEvent(0x0083); --Begins Indomitable Spirit
    elseif ((Indomitable == QUEST_ACCEPTED or Indomitable == QUEST_COMPLETED) and realday == player:getVar("IndomitableSpiritVar")) then
        player:startEvent(0x0085); --Asks the player to wait
    elseif ((Indomitable == QUEST_ACCEPTED or Indomitable == QUEST_COMPLETED) and realday ~= player:getVar("IndomitableSpiritVar")) then
        player:startEvent(0x0086); --Ends the Quest
    elseif (Indomitable == QUEST_COMPLETED) then
        player:startEvent(0x0087); --Dialogue for those who have completed Indomitable Spirit
    else
        player:startEvent(0x004C); --Standard Dialogue
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
    if (csid == 0x004d) then
        player:addQuest(OUTLANDS,THE_IMMORTAL_LU_SHANG);
    elseif (csid == 0x004e) then
        player:tradeComplete();
        player:addTitle(265);
        player:addItem(17386); -- Lu Shang's Fishing Rod
        player:messageSpecial(ITEM_OBTAINED, 17386); 
        player:completeQuest(OUTLANDS,THE_IMMORTAL_LU_SHANG);
        player:addFame(OUTLANDS,60);  
    elseif (csid == 0x0083) then
        player:addQuest(OUTLANDS,201);
    elseif (csid == 0x0084) then
        player:tradeComplete();
        player:setVar("IndomitableSpiritVar", os.date("%j")); -- %M for next minute, %j for next day
    elseif (csid == 0x0086) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17011); 
        else
            player:addTitle(265);
            player:addItem(17011); -- Ebisu Fishing Rod
            player:messageSpecial(ITEM_OBTAINED, 17011); 
            player:completeQuest(OUTLANDS,201);
            player:addFame(OUTLANDS,100);  
        end
    end
end;



