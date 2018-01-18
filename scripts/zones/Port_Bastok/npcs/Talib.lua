-----------------------------------
-- Area: Port Bastok
-- NPC:  Talib
-- Starts Quest: Beauty and the Galka
-- Starts & Finishes Quest: Shady Business
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(BASTOK,SHADY_BUSINESS) >= QUEST_ACCEPTED) then
        if (trade:hasItemQty(642,4) and trade:getItemCount() == 4) then
            player:startEvent(91);
        end
    elseif (player:getQuestStatus(BASTOK,BEAUTY_AND_THE_GALKA) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(642,1) and trade:getItemCount() == 1) then
            player:startEvent(3);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    BeautyAndTheGalka = player:getQuestStatus(BASTOK,BEAUTY_AND_THE_GALKA);

    if (BeautyAndTheGalka == QUEST_COMPLETED) then
        player:startEvent(90);        
    elseif (BeautyAndTheGalka == QUEST_ACCEPTED or player:getVar("BeautyAndTheGalkaDenied") >= 1) then
        player:startEvent(4);
    else 
        player:startEvent(2);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 2 and option == 0) then
        player:addQuest(BASTOK,BEAUTY_AND_THE_GALKA);
    elseif (csid == 2 and option == 1) then
        player:setVar("BeautyAndTheGalkaDenied",1);
    elseif (csid == 3) then
        player:tradeComplete();
        player:addKeyItem(PALBOROUGH_MINES_LOGS);
        player:messageSpecial(KEYITEM_OBTAINED,PALBOROUGH_MINES_LOGS);
    elseif (csid == 90) then
        ShadyBusiness = player:getQuestStatus(BASTOK,SHADY_BUSINESS);
        
        if (ShadyBusiness == QUEST_AVAILABLE) then
            player:addQuest(BASTOK,SHADY_BUSINESS);
        end
    elseif (csid == 91) then
        ShadyBusiness = player:getQuestStatus(BASTOK,SHADY_BUSINESS);
            
        if (ShadyBusiness == QUEST_ACCEPTED) then
            player:addFame(NORG,100);
            player:completeQuest(BASTOK,SHADY_BUSINESS);
        else
            player:addFame(NORG,80);
        end
        
        player:tradeComplete();
        player:addGil(GIL_RATE*350);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*350);
    end
    
end;