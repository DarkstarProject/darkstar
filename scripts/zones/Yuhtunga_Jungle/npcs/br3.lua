-----------------------------------
-- Area: Yuhtunga Jungle
-- NPC: Blue Rafflesia
-- Used in quest Even More Gullible Travels
-- @pos -468.876 -1 220.247 170
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Yuhtunga_Jungle/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local evenmoreTravelsStatus = player:getQuestStatus(OUTLANDS, EVEN_MORE_GULLIBLES_TRAVELS)
    local scentDay = player:getVar("RafflesiaScentDay");
    local currentDay = VanadielDayOfTheYear();
    local scentReady = ((scentDay < currentDay) or (scentDay > currentDay and player:getVar("RafflesiaScentYear") < VanadielYear()));
    
    if (evenmoreTravelsStatus == QUEST_ACCEPTED and player:getVar("EVEN_MORE_GULLIBLES_PROGRESS") == 1 and player:getVar("ThirdBlueRafflesiaCS") == 0) then
        player:startEvent(0x0017);
    elseif (evenmoreTravelsStatus == QUEST_COMPLETED and scentReady == true and player:getVar("BathedInScent") == 0 and player:getVar("ThirdBlueRafflesiaCS") == 0) then
        player:startEvent(0x0017);
    else
        player:messageSpecial(FLOWER_BLOOMING);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("OPTION: %u",option);

-- Set BathedInScent to 1 if they touched all 3 Rafflesia for EVEN_MORE_GULLIBLES_TRAVELS which opens the quest The Opo-Opo and I
    if (csid == 0x0017 and option == 1) then
        if (player:getVar("FirstBlueRafflesiaCS") == 1 and player:getVar("SecondBlueRafflesiaCS") == 1) then
            player:setVar("FirstBlueRafflesiaCS", 0);
            player:setVar("SecondBlueRafflesiaCS", 0);
            player:setVar("BathedInScent", 1);
            player:setVar("RafflesiaScentDay",VanadielDayOfTheYear());
            player:setVar("RafflesiaScentYear",VanadielYear());
            player:setVar("EVEN_MORE_GULLIBLES_PROGRESS", 2);
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
            player:messageSpecial(FEEL_DIZZY); -- You feel slightly dizzy. You must have breathed in too much of the pollen.
        else
            player:setVar("ThirdBlueRafflesiaCS", 1);
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
        end
    end
end;