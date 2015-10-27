-----------------------------------
-- Area: Port Jeuno
-- NPC: Sagheera
-- @pos -3 0.1 -9 246
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/armor_upgrade");

local ABreward = {15244,14812,14813,15475,15476,15477,15488,14815,15961,2127};
local ABremove = {150,75,75,75,150,75,75, 75, 75,75};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    local CurrentAFupgrade = player:getVar("AFupgrade");
    local StoreAncientBeastcoins = player:getCurrency("ancient_beastcoin");
    local AvailableCombinationDetected = 0;
    local cost = 0;
    local time = os.date("*t");

    if (CurrentAFupgrade == 0 and count == 4) then -- RELIC Armor +1 ???
        for nb = 2, table.getn(Relic_Armor_Plus_one), 2 do  --looking for the relic armor
            --trade base relic armor                                                                                    --trade temenos Item                                       --trade Apollyon item                                                          --trade craft item                                                                                     have enought ancien beastcoin ctore ?
            if (trade:hasItemQty(Relic_Armor_Plus_one[nb][2],1) and  trade:hasItemQty(Relic_Armor_Plus_one[nb][3],1) and  trade:hasItemQty(Relic_Armor_Plus_one[nb][4],1)  and  trade:hasItemQty(Relic_Armor_Plus_one[nb][5],1) and Relic_Armor_Plus_one[nb][6] <= StoreAncientBeastcoins) then 
                AvailableCombinationDetected = Relic_Armor_Plus_one[nb-1];
                cost = Relic_Armor_Plus_one[nb][6];
                printf("detect trade - available relic combination: %u", Relic_Armor_Plus_one[nb][1]);   
            end
        end
    elseif (CurrentAFupgrade == 0 and AvailableCombinationDetected == 0) then -- Artfact Armor +1 ???
        for nb = 2, table.getn(Artifact_Armor_Plus_one), 2 do  --looking for the Artifact armor
            --trade base Artfact armor                                                                  --- trade Artfact armor -1                                                                       trade craft item
            if (trade:hasItemQty(Artifact_Armor_Plus_one[nb][2],1) and  trade:hasItemQty(Artifact_Armor_Plus_one[nb][3],1) and  trade:hasItemQty(Artifact_Armor_Plus_one[nb][4],1) and trade:hasItemQty(Artifact_Armor_Plus_one[nb][5],Artifact_Armor_Plus_one[nb][6])) then 
                if (count == 3 + Artifact_Armor_Plus_one[nb][6]) then  --check the total number of item trade (base af + af-1 + craft item + number of curency)
                    AvailableCombinationDetected = Artifact_Armor_Plus_one[nb-1];
                    printf("detect trade - available Artifact combination: %u", Artifact_Armor_Plus_one[nb][1]);
                end
            end
        end
    end
    
  if (trade:hasItemQty(1875, count) and AvailableCombinationDetected == 0) then  --- AB storage
		local total = player:getCurrency("ancient_beastcoin") + count;
		player:startEvent(0x0137, count, 0, 0, 0, 0, 0, 0, total);
        if (total < 9999) then  -- store max 9999 Ancien beastcoin
            player:addCurrency("ancient_beastcoin", count);
            player:tradeComplete();
        end
    elseif (AvailableCombinationDetected ~= 0) then
        player:setVar("AFupgrade", AvailableCombinationDetected);
        player:setVar("AFupgradeDay", os.time(t) + (3600 - time.min*60)); -- Current time + Remaining minutes in the hour in seconds (Day Change)
        player:delCurrency("ancient_beastcoin", cost); -- cost is defined if the relic/af was found above
        player:tradeComplete();
        player:startEvent(0x0138);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno");
    local CurrentAFupgrade = 0;
    local StoreAB = player:getCurrency("ancient_beastcoin");
    local playergils = player:getGil();
    local CosmoWaitTime = BETWEEN_2COSMOCLEANSE_WAIT_TIME * 20 * 60 * 60;
    local lastCosmoTime = player:getVar("Cosmo_Cleanse_TIME");
    if (lastCosmoTime ~= 0) then lastCosmoTime = lastCosmoTime + CosmoWaitTime; end;
    local CosmoTime = 0;
    local hasCosmoCleanse = 0;
    
    if (player:hasKeyItem(COSMOCLEANSE)) then
        hasCosmoCleanse = 1;
    else
        if (lastCosmoTime <= os.time(t)) then
            CosmoTime = 2147483649; -- BITMASK for the purchase
            -- printf("CASE: LESSTHAN | BUY COSMOCLEANSE");
        elseif (lastCosmoTime > os.time(t)) then
            CosmoTime = (lastCosmoTime - 1009843200) - 39600; -- (os.time number - BITMASK for the event) - 11 hours in seconds. Only works in this format (strangely).
            -- printf("CASE: GREATERTHAN |  lastCosmoTime:  "..lastCosmoTime.."  |  CosmoTime:  "..CosmoTime);
        end
    end
    if (player:getVar("AFupgradeDay") <= os.time(t)) then
        CurrentAFupgrade = player:getVar("AFupgrade");
    end
    
    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno, 19) == false) then
        player:startEvent(313);
    else
        player:startEvent(0x0136, 3, CurrentAFupgrade, 0, playergils, CosmoTime, 1, hasCosmoCleanse, StoreAB); -- Standard dialog
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    local option1 = 0;
    local option2 = 0;
    local option3 = 0;
    local option4 = 0;
    local option5 = 0;
    local option6 = 0;
    local option7 = 0;
    local option8 = 0; 
    
    if (csid == 0x0136 and option > 0 and option <101) then
        for nb = 1, table.getn(Relic_Armor_Plus_one), 2 do  --looking for the  relic armor
            if (Relic_Armor_Plus_one[nb] == option) then               
                option1  =Relic_Armor_Plus_one[nb+1][1];  --relic +1
                option2 = Relic_Armor_Plus_one[nb+1][2];  --relic base
                option3 = Relic_Armor_Plus_one[nb+1][3];  --item 1
                option4 = Relic_Armor_Plus_one[nb+1][4];  --item 2
                option5 = Relic_Armor_Plus_one[nb+1][5];  --item 3
                option8 = Relic_Armor_Plus_one[nb+1][6]; -- AB cost
            end
        end
        player:updateEvent(option1, option2, option3, option4, option5, option6, option7, option8); 
        -- print("relic");
    elseif (csid == 0x0136 and option > 200) then
        for nb = 1, table.getn(Relic_Armor_Plus_one), 2 do  --looking for the  relic armor
            if (Relic_Armor_Plus_one[nb] == option) then               
                option1  =Relic_Armor_Plus_one[nb+1][1];  --relic +1
                option2 = Relic_Armor_Plus_one[nb+1][2];  --relic base
                option3 = Relic_Armor_Plus_one[nb+1][3];  --item 1
                option4 = Relic_Armor_Plus_one[nb+1][4];  --item 2
                option5 = Relic_Armor_Plus_one[nb+1][5];  --item 3
                option8 = Relic_Armor_Plus_one[nb+1][6]; -- AB cost
            end
        end
        player:updateEvent(option1, option2, option3, option4, option5, option6, option7, option8); 
        -- print("relic");
    elseif (csid == 0x0136 and option > 100 and option <201) then
        for nb = 1, table.getn(Artifact_Armor_Plus_one), 2 do  --looking for the  artifact armor
            if (Artifact_Armor_Plus_one[nb] == option) then      
                option1 = Artifact_Armor_Plus_one[nb+1][1];  --af +1
                option2 = Artifact_Armor_Plus_one[nb+1][2];  --af base    
                option3 = Artifact_Armor_Plus_one[nb+1][3];  --af -1
                option4 = Artifact_Armor_Plus_one[nb+1][4];  -- item
                option5 = Artifact_Armor_Plus_one[nb+1][5];  --curency ID 
                option6 = Artifact_Armor_Plus_one[nb+1][6];  -- currency cost
            end
        end
        player:updateEvent(option1, option2, option3, option4, option5, option6, option7, option8); 
        --   print("artifact");
    end
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    local remainingAB=player:getCurrency("ancient_beastcoin");
    local ugrade_armor_Type = 0 ;
    local ugrade_armor_ID = 0 ;
    --printf("CSID: %u",csid);
    --print("event finish");
    --printf("RESULT: %u",option);
    
    if (csid == 313) then
        player:setMaskBit(player:getVar("WildcatJeuno"), "WildcatJeuno", 19, true);
    elseif (csid == 0x0136 and option == 3) then --add keyitem for limbus
        player:setVar("Cosmo_Cleanse_TIME", os.time(t));
        player:addKeyItem(COSMOCLEANSE);
        player:messageSpecial(KEYITEM_OBTAINED, COSMOCLEANSE);
        player:delGil(15000);   
    elseif (csid == 0x0136 and  option >10 and option < 21) then  -- ancient beastcoin reward
        if (player:getFreeSlotsCount() == 0 or player:hasItem(ABreward[option-10])) then  
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ABreward[option-10]);
        else
            player:delCurrency("ancient_beastcoin", ABremove[option-10]);
            player:addItem(ABreward[option-10]);
            player:messageSpecial(ITEM_OBTAINED, ABreward[option-10]);
        end
    elseif (csid == 0x0136 and  option == 100) then  -- upgrade armor reward
        ugrade_armor_Type = player:getVar("AFupgrade");
        --printf("detect type: %u",ugrade_armor);
        if (ugrade_armor_Type < 101 or ugrade_armor_Type >200) then  
            for nb = 1, table.getn(Relic_Armor_Plus_one), 2 do  -- looking for the  relic armor 
                if (Relic_Armor_Plus_one[nb] == ugrade_armor_Type) then               
                    ugrade_armor_ID= Relic_Armor_Plus_one[nb+1][1];    
                end
            end
        else
            for nb = 1, table.getn(Artifact_Armor_Plus_one), 2 do  -- looking for the  Artifact armor
                if (Artifact_Armor_Plus_one[nb] == ugrade_armor_Type) then               
                    ugrade_armor_ID= Artifact_Armor_Plus_one[nb+1][1];   
                end
            end
        end
        if (player:getFreeSlotsCount() == 0 and ugrade_armor_ID ~= 0) then  
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ugrade_armor_ID); 
        else
            player:addItem(ugrade_armor_ID);
            player:messageSpecial(ITEM_OBTAINED, ugrade_armor_ID);
            player:setVar("AFupgrade", 0);
            player:setVar("AFupgradeDay", 0);
        end
    end
end;
