-----------------------------------
-- Area: Yuhtunga Jungle
-- NPC: Blue Rafflesia
-- Used in quest Even More Gullible Travels
-- @pos -468.876 -1 220.247 123 <many>
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
    local questprogress = player:getVar("EVEN_MORE_GULLIBLES_PROGRESS");
    local scentDay = player:getVar("RafflesiaScentDay");
    local currentDay = VanadielDayOfTheYear();
    local scentReady = ((scentDay < currentDay) or (scentDay > currentDay and player:getVar("RafflesiaScentYear") < VanadielYear()));
    local npcId = npc:getID();
    
    if (npcId == 17281586) then
        if (evenmoreTravelsStatus == QUEST_ACCEPTED and questprogress == 1 and player:getVar("FirstBlueRafflesiaCS") == 0) then -- Player is on quest, first time.
            player:startEvent(0x0015);
        elseif (evenmoreTravelsStatus == QUEST_COMPLETED and scentReady == true and player:getVar("BathedInScent") == 0 and player:getVar("FirstBlueRafflesiaCS") == 0) then -- Repeating
            player:startEvent(0x0015);
        else
            player:messageSpecial(FLOWER_BLOOMING);
        end
    elseif (npcId == 17281587) then
        if (evenmoreTravelsStatus == QUEST_ACCEPTED and questprogress == 1 and player:getVar("SecondBlueRafflesiaCS") == 0) then
            player:startEvent(0x0016);
        elseif (evenmoreTravelsStatus == QUEST_COMPLETED and scentReady == true and player:getVar("BathedInScent") == 0 and player:getVar("SecondBlueRafflesiaCS") == 0) then
            player:startEvent(0x0016);
        else
            player:messageSpecial(FLOWER_BLOOMING);
        end
    elseif (npcId == 17281588) then
        if (evenmoreTravelsStatus == QUEST_ACCEPTED and questprogress == 1 and player:getVar("ThirdBlueRafflesiaCS") == 0) then
            player:startEvent(0x0017);
        elseif (evenmoreTravelsStatus == QUEST_COMPLETED and scentReady == true and player:getVar("BathedInScent") == 0 and player:getVar("ThirdBlueRafflesiaCS") == 0) then
            player:startEvent(0x0017);
        else
            player:messageSpecial(FLOWER_BLOOMING);
        end
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
    local evenmoreTravelsStatus = player:getQuestStatus(OUTLANDS, EVEN_MORE_GULLIBLES_TRAVELS)

-- Set BathedInScent to 1 if they touched all 3 Rafflesia for EVEN_MORE_GULLIBLES_TRAVELS which opens the quest The Opo-Opo and I
    if (csid == 0x0015 and option == 1) then
        if (player:getVar("SecondBlueRafflesiaCS") == 1 and player:getVar("ThirdBlueRafflesiaCS") == 1) then -- This is 3rd Rafflessia clicked, progressing.
            player:setVar("SecondBlueRafflesiaCS", 0);
            player:setVar("ThirdBlueRafflesiaCS", 0);
            player:setVar("BathedInScent", 1);
            player:setVar("RafflesiaScentDay",VanadielDayOfTheYear());
            player:setVar("RafflesiaScentYear",VanadielYear());
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
            player:messageSpecial(FEEL_DIZZY); -- You feel slightly dizzy. You must have breathed in too much of the pollen.
            if (evenmoreTravelsStatus == QUEST_ACCEPTED) then
                player:setVar("EVEN_MORE_GULLIBLES_PROGRESS", 2);
            end
        else
            player:setVar("FirstBlueRafflesiaCS", 1);
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
        end
    elseif (csid == 0x0016 and option == 1) then
        if (player:getVar("FirstBlueRafflesiaCS") == 1 and player:getVar("ThirdBlueRafflesiaCS") == 1) then
            player:setVar("FirstBlueRafflesiaCS", 0);
            player:setVar("ThirdBlueRafflesiaCS", 0);
            player:setVar("BathedInScent", 1);
            player:setVar("RafflesiaScentDay",VanadielDayOfTheYear());
            player:setVar("RafflesiaScentYear",VanadielYear());
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
            player:messageSpecial(FEEL_DIZZY); -- You feel slightly dizzy. You must have breathed in too much of the pollen.
            if (evenmoreTravelsStatus == QUEST_ACCEPTED) then
                player:setVar("EVEN_MORE_GULLIBLES_PROGRESS", 2);
            end
        else
            player:setVar("SecondBlueRafflesiaCS", 1);
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
        end
    elseif (csid == 0x0017 and option == 1) then
        if (player:getVar("FirstBlueRafflesiaCS") == 1 and player:getVar("SecondBlueRafflesiaCS") == 1) then
            player:setVar("FirstBlueRafflesiaCS", 0);
            player:setVar("SecondBlueRafflesiaCS", 0);
            player:setVar("BathedInScent", 1);
            player:setVar("RafflesiaScentDay",VanadielDayOfTheYear());
            player:setVar("RafflesiaScentYear",VanadielYear());
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
            player:messageSpecial(FEEL_DIZZY); -- You feel slightly dizzy. You must have breathed in too much of the pollen.
            if (evenmoreTravelsStatus == QUEST_ACCEPTED) then
                player:setVar("EVEN_MORE_GULLIBLES_PROGRESS", 2);
            end
        else
            player:setVar("ThirdBlueRafflesiaCS", 1);
            player:addItem(1144);        -- Rafflesia Nectar
            player:messageSpecial(ITEM_OBTAINED,1144);
        end
    end
end;