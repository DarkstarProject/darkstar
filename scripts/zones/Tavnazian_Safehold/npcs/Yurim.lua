-----------------------------------
-- Area: Tavnazian Safehold
-- NPC: Yurim
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Tavnazian_Safehold/TextIDs");

                     --reward              tradebase   tradeChip                     tradeOrgane1          tradeOrgane2            tradeOrgane3        tradeOrgane4
--Relaxing Earring     14792; Silver Earring 13327;  Black Chip  481; Luminian Tissue x5 1783; Euvhi Organ x5  1818; 
--Sanative Earring     14791; Silver Earring 13327;  White Chip  480; Luminian Tissue x5 1783; Euvhi Organ x5  1818; 
--Karin Obi: (Fire)    15435; Silver Obi      13205;  Red Chip      474; Phuabo Organ x7    1784; Xzomit Organ x3 1785; Luminian Tissue x3 1783;
--Dorin Obi: (Earth)   15438; Silver Obi     13205;  Yellow Chip 476; Hpemde Organ x7    1787; Aern Organ x3   1786; Luminian Tissue x3 1783;
--Suirin Obi: (Water)  15440; Silver Obi     13205;  Blue Chip   475; Hpemde Organ x7    1787; Phuabo Organ x3 1784; Luminian Tissue x3 1783;
--Furin Obi: (Wind)    15437; Silver Obi     13205;  Green Chip  477; Aern Organ x7      1786; Hpemde Organ x3 1787; Luminian Tissue x3 1783;
--Hyorin Obi: (Ice)    15436; Silver Obi     13205;  Clear Chip  478; Xzomit Organ x7    1785; Phuabo Organ x3 1784; Luminian Tissue x3 1783;
--Rairin Obi: (Thunder)15439; Silver Obi     13205;  Purple Chip 479; Phuabo Organ x7    1784; Hpemde Organ x3 1787; Luminian Tissue x3 1783;
--Korin Obi: (Light)   15441; Silver Obi     13205;  White Chip  480; Xzomit Organ x7    1785; Aern Organ x3   1786; Luminian Tissue x3 1783;
--Anrin Obi: (Dark)    15442; Silver Obi     13205;  Black Chip  481; Aern Organ x7      1786; Xzomit Organ x3 1785; Luminian Tissue x3 1783;
--Flame Gorget:        15495; Gorget          13080;  Red Chip      474; Phuabo Organ x10   1784; Xzomit Organ x5 1785; Yovra Organ x1     1788;
--Soil Gorget:         15498; Gorget          13080;  Yellow Chip 476; Xzomit Organ x10   1785; Aern Organ x5   1786; Yovra Organ x1     1788;
--Aqua Gorget:         15500; Gorget          13080;  Blue Chip      475; Aern Organ x10     1786; Hpemde Organ x5 1787; Yovra Organ x1     1788;
--Breeze Gorget:       15497; Gorget          13080;  Green Chip  477; Phuabo Organ x10   1784; Hpemde Organ x5 1787; Yovra Organ x1     1788;
--Snow Gorget:         15496; Gorget          13080;  Clear Chip  478; Phuabo Organ x10   1784; Aern Organ x5   1786; Yovra Organ x1     1788;
--Thunder Gorget:      15499; Gorget          13080;  Purple Chip 479; Xzomit Organ x10   1785; Hpemde Organ x5 1787; Yovra Organ x1     1788;
--Light Gorget:        15501; Gorget          13080;  White Chip  480; Aern Organ x7      1786; Phuabo Organ x3 1784; Hpemde Organ x3    1787; Yovra Organ x2  1788;
--Shadow Gorget:       15502; Gorget          13080;  Black Chip  481; Hpemde Organ x7    1787; Phuabo Organ x3 1784; Aern Organ x3      1786; Yovra Organ x2  1788;
local LUMINIAN_TISSUE = 1783;
local PHUABOS_ORGAN = 1784;
local HPEMDE_ORGAN = 1787;
local AERN_ORGAN = 1786;
local XZOMIT_ORGAN = 1785;
local EUVHI_ORGAN = 1818;
local YOVRA_ORGAN = 1788;

local SILVER_EARRING = 13327; 
local SILVER_OBI = 13205; 
local GORGET = 13080; 

local BLACK_CHIP = 481;
local WHITE_CHIP = 480;
local RED_CHIP = 474;
local YELLOW_CHIP = 476;
local BLUE_CHIP = 475;
local GREEN_CHIP = 477;
local CLEAR_CHIP = 478;
local PURPLE_CHIP = 479;

local RELAXING_EARRING =14792;
local SANATIVE_EARRING =14791;

local KARIN_OBI = 15435; local FLAME_GORGET= 15495;
local DORIN_OBI =15438; local SOIL_GORGET= 15498;
local SUIRIN_OBI =15440; local AQUA_GORGET= 15500;
local FURIN_OBI =15437; local BREEZE_GORGET= 15497;
local HYORIN_OBI =15436; local SNOW_GORGET= 15496;
local RAIRIN_OBI =15439; local THUNDER_GORGET= 15499;
local KORIN_OBI =15441; local LIGHT_GORGET= 15501;
local ANRIN_OBI =15442; local SHADOW_GORGET= 15502;

local APPLE_PIE = 4413;

function getNOS(itemtarget,item)
    local returnITEM;
    if (itemtarget == RELAXING_EARRING) then 
        returnITEM={SILVER_EARRING,BLACK_CHIP};
    elseif (itemtarget == SANATIVE_EARRING) then 
        returnITEM={SILVER_EARRING,WHITE_CHIP};
    elseif (itemtarget == KARIN_OBI) then 
        returnITEM={SILVER_OBI,RED_CHIP};
    elseif (itemtarget == DORIN_OBI) then 
        returnITEM={SILVER_OBI,YELLOW_CHIP};
    elseif (itemtarget == SUIRIN_OBI) then 
        returnITEM={SILVER_OBI,BLUE_CHIP};
    elseif (itemtarget == FURIN_OBI) then 
        returnITEM={SILVER_OBI,GREEN_CHIP};
    elseif (itemtarget == HYORIN_OBI) then 
        returnITEM={SILVER_OBI,CLEAR_CHIP};
    elseif (itemtarget == RAIRIN_OBI) then 
        returnITEM={SILVER_OBI,PURPLE_CHIP}; 
    elseif (itemtarget == KORIN_OBI) then 
        returnITEM={SILVER_OBI,WHITE_CHIP};
    elseif (itemtarget == ANRIN_OBI) then 
        returnITEM={SILVER_OBI,BLACK_CHIP};
    elseif (itemtarget == FLAME_GORGET) then 
        returnITEM={GORGET,RED_CHIP};
    elseif (itemtarget == SOIL_GORGET) then 
        returnITEM={GORGET,YELLOW_CHIP};
    elseif (itemtarget == AQUA_GORGET) then 
        returnITEM={GORGET,BLUE_CHIP};
    elseif (itemtarget == BREEZE_GORGET) then 
        returnITEM={GORGET,GREEN_CHIP}; 
    elseif (itemtarget == SNOW_GORGET) then 
        returnITEM={GORGET,CLEAR_CHIP};
    elseif (itemtarget == THUNDER_GORGET) then 
        returnITEM={GORGET,PURPLE_CHIP};
    elseif (itemtarget == LIGHT_GORGET) then 
        returnITEM={GORGET,WHITE_CHIP};
    elseif (itemtarget == SHADOW_GORGET) then 
        returnITEM={GORGET,BLACK_CHIP};
    end

    return returnITEM[item];
end;
----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
    local NameOfScience = player:getQuestStatus(OTHER_AREAS,IN_THE_NAME_OF_SCIENCE); 
    local count = trade:getItemCount(); --nombre d'objet total
    local itemtarget = player:getVar("NAME_OF_SCIENCE_target");
    local reward = false;
-- printf("count: %u",count);
-----------------------------------------trade the chip and the base item---------------------------------------------------------------------
    if ((NameOfScience == QUEST_ACCEPTED or NameOfScience == QUEST_COMPLETED) and count == 2 and itemtarget == 0) then  
        if (trade:hasItemQty(SILVER_EARRING,1)) then 
            if (trade:hasItemQty(BLACK_CHIP,1) and player:hasItem(RELAXING_EARRING)==false) then 
                player:setVar("NAME_OF_SCIENCE_target",RELAXING_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,BLACK_CHIP);
            elseif (trade:hasItemQty(WHITE_CHIP,1) and player:hasItem(SANATIVE_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SANATIVE_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,WHITE_CHIP);
            elseif (trade:hasItemQty(RED_CHIP,1) and player:hasItem(SANATIVE_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SANATIVE_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,RED_CHIP);
            elseif (trade:hasItemQty(YELLOW_CHIP,1) and player:hasItem(RELAXING_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",RELAXING_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,YELLOW_CHIP);
            elseif (trade:hasItemQty(BLUE_CHIP,1) and player:hasItem(RELAXING_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",RELAXING_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,BLUE_CHIP);
            elseif (trade:hasItemQty(GREEN_CHIP,1) and player:hasItem(SANATIVE_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SANATIVE_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,GREEN_CHIP);
            elseif (trade:hasItemQty(CLEAR_CHIP,1) and player:hasItem(RELAXING_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",RELAXING_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,CLEAR_CHIP);
            elseif (trade:hasItemQty(PURPLE_CHIP,1) and player:hasItem(SANATIVE_EARRING)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SANATIVE_EARRING); player:tradeComplete(); player:startEvent(0x020E,SILVER_EARRING,PURPLE_CHIP);
            end
        elseif (trade:hasItemQty(SILVER_OBI,1)) then       
            if (trade:hasItemQty(BLACK_CHIP,1) and player:hasItem(ANRIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",ANRIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,BLACK_CHIP);
            elseif (trade:hasItemQty(WHITE_CHIP,1) and player:hasItem(KORIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",KORIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,WHITE_CHIP);
            elseif (trade:hasItemQty(RED_CHIP,1) and player:hasItem(KARIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",KARIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,RED_CHIP);
            elseif (trade:hasItemQty(YELLOW_CHIP,1) and player:hasItem(DORIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",DORIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,YELLOW_CHIP);
            elseif (trade:hasItemQty(BLUE_CHIP,1) and player:hasItem(SUIRIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SUIRIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,BLUE_CHIP);
            elseif (trade:hasItemQty(GREEN_CHIP,1) and player:hasItem(FURIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",FURIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,GREEN_CHIP);
            elseif (trade:hasItemQty(CLEAR_CHIP,1) and player:hasItem(HYORIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",HYORIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,CLEAR_CHIP);
            elseif (trade:hasItemQty(PURPLE_CHIP,1) and player:hasItem(RAIRIN_OBI)==false) then
                player:setVar("NAME_OF_SCIENCE_target",RAIRIN_OBI); player:tradeComplete(); player:startEvent(0x020E,SILVER_OBI,PURPLE_CHIP);
            end
        elseif (trade:hasItemQty(GORGET,1)) then 
            if (trade:hasItemQty(BLACK_CHIP,1) and player:hasItem(SHADOW_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SHADOW_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,BLACK_CHIP);
            elseif (trade:hasItemQty(WHITE_CHIP,1) and player:hasItem(LIGHT_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",LIGHT_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,WHITE_CHIP);
            elseif (trade:hasItemQty(RED_CHIP,1) and player:hasItem(FLAME_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",FLAME_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,RED_CHIP);
            elseif (trade:hasItemQty(YELLOW_CHIP,1) and player:hasItem(SOIL_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SOIL_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,YELLOW_CHIP);
            elseif (trade:hasItemQty(BLUE_CHIP,1) and player:hasItem(AQUA_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",AQUA_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,BLUE_CHIP);
            elseif (trade:hasItemQty(GREEN_CHIP,1) and player:hasItem(BREEZE_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",BREEZE_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,GREEN_CHIP);
            elseif (trade:hasItemQty(CLEAR_CHIP,1) and player:hasItem(SNOW_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",SNOW_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,CLEAR_CHIP);
            elseif (trade:hasItemQty(PURPLE_CHIP,1) and player:hasItem(THUNDER_GORGET)==false) then
                player:setVar("NAME_OF_SCIENCE_target",THUNDER_GORGET); player:tradeComplete(); player:startEvent(0x020E,GORGET,PURPLE_CHIP);
            end  
        end
--------------------------------------------------apple pie trade-------------------------------------------------------------------------------          
    elseif ((NameOfScience == QUEST_ACCEPTED or NameOfScience == QUEST_COMPLETED) and count == 1 and itemtarget > 0 and trade:hasItemQty(APPLE_PIE,1) ) then 
        player:startEvent(0x0213,APPLE_PIE); player:tradeComplete();
--------------------------------------------------trade  organe-----------------------------------------------------------------------------------------------    
    elseif ((NameOfScience == QUEST_ACCEPTED or NameOfScience == QUEST_COMPLETED) and itemtarget > 0  ) then    
        if (itemtarget == RELAXING_EARRING and count == 10) then     
            if (trade:hasItemQty(LUMINIAN_TISSUE,5)and trade:hasItemQty(EUVHI_ORGAN,5)) then
                reward = true;
            end
        elseif (itemtarget == SANATIVE_EARRING and count == 10) then
            if (trade:hasItemQty(LUMINIAN_TISSUE,5)and trade:hasItemQty(EUVHI_ORGAN,5)) then
                reward = true;              
            end
        elseif (itemtarget == KARIN_OBI and count == 13) then
            if (trade:hasItemQty(PHUABOS_ORGAN,7)and trade:hasItemQty(XZOMIT_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then
                reward = true;              
            end
        elseif (itemtarget == DORIN_OBI and count == 13) then
            if (trade:hasItemQty(HPEMDE_ORGAN,7)and trade:hasItemQty(AERN_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then
                reward = true;
            end              
        elseif (itemtarget == SUIRIN_OBI and count == 13) then
            if (trade:hasItemQty(HPEMDE_ORGAN,7)and trade:hasItemQty(PHUABOS_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then    
                reward = true;
            end              
        elseif (itemtarget == FURIN_OBI and count == 13) then
            if (trade:hasItemQty(AERN_ORGAN,7)and trade:hasItemQty(HPEMDE_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then    
                reward = true;
            end              
        elseif (itemtarget == HYORIN_OBI and count == 13) then
            if (trade:hasItemQty(XZOMIT_ORGAN,7)and trade:hasItemQty(PHUABOS_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then
                reward = true;
            end              
        elseif (itemtarget == RAIRIN_OBI and count == 13) then
            if (trade:hasItemQty(PHUABOS_ORGAN,7)and trade:hasItemQty(HPEMDE_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then
                reward = true;
            end              
        elseif (itemtarget == KORIN_OBI and count == 13) then
            if (trade:hasItemQty(XZOMIT_ORGAN,7)and trade:hasItemQty(AERN_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then
                reward = true;
            end              
        elseif (itemtarget == ANRIN_OBI and count == 13) then
            if (trade:hasItemQty(AERN_ORGAN,7)and trade:hasItemQty(XZOMIT_ORGAN,3)and trade:hasItemQty(LUMINIAN_TISSUE,3)) then
                reward = true;              
            end              
        elseif (itemtarget == SHADOW_GORGET and count == 15) then
            if (trade:hasItemQty(HPEMDE_ORGAN,7)and trade:hasItemQty(PHUABOS_ORGAN,3)and trade:hasItemQty(AERN_ORGAN,3)and trade:hasItemQty(YOVRA_ORGAN,2)) then     
                reward = true;
            end
        elseif (itemtarget == LIGHT_GORGET and count == 15) then
            if (trade:hasItemQty(AERN_ORGAN,7)and trade:hasItemQty(PHUABOS_ORGAN,3)and trade:hasItemQty(HPEMDE_ORGAN,3)and trade:hasItemQty(YOVRA_ORGAN,2)) then
                reward = true;
            end
        elseif (itemtarget == FLAME_GORGET and count == 16) then
            if (trade:hasItemQty(PHUABOS_ORGAN,10)and trade:hasItemQty(XZOMIT_ORGAN,5)and trade:hasItemQty(YOVRA_ORGAN,1)) then    
                reward = true;
            end              
        elseif (itemtarget == SOIL_GORGET and count == 16) then
            if (trade:hasItemQty(XZOMIT_ORGAN,10)and trade:hasItemQty(AERN_ORGAN,5)and trade:hasItemQty(YOVRA_ORGAN,1)) then
                reward = true;          
            end              
        elseif (itemtarget == AQUA_GORGET and count == 16) then
            if (trade:hasItemQty(AERN_ORGAN,10)and trade:hasItemQty(HPEMDE_ORGAN,5)and trade:hasItemQty(YOVRA_ORGAN,1)) then
                reward = true;
            end              
        elseif (itemtarget == BREEZE_GORGET and count == 16) then
            if (trade:hasItemQty(PHUABOS_ORGAN,10)and trade:hasItemQty(HPEMDE_ORGAN,5)and trade:hasItemQty(YOVRA_ORGAN,1)) then    
                reward = true;
            end              
        elseif (itemtarget == SNOW_GORGET and count == 16) then
            if (trade:hasItemQty(PHUABOS_ORGAN,10)and trade:hasItemQty(AERN_ORGAN,5)and trade:hasItemQty(YOVRA_ORGAN,1)) then
                reward = true;              
            end
        elseif (itemtarget == THUNDER_GORGET and count == 16) then
            if (trade:hasItemQty(XZOMIT_ORGAN,10)and trade:hasItemQty(HPEMDE_ORGAN,5)and trade:hasItemQty(YOVRA_ORGAN,1)) then
                reward = true;              
            end              
        end    
    end       
    --------------------------------------------------------------------------------------------------------------------
    if (reward == true) then
        player:startEvent(0x0211, GORGET, SILVER_EARRING, SILVER_OBI);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local NameOfScience = player:getQuestStatus(OTHER_AREAS,IN_THE_NAME_OF_SCIENCE);
    local itemtarget = player:getVar("NAME_OF_SCIENCE_target");
    local rnd= math.random();

    if (player:getCurrentMission(COP) > THE_WARRIOR_S_PATH) then   --have SEA acces
        if (NameOfScience == QUEST_AVAILABLE) then         
            player:startEvent(0x020C,13205,13327,13080);
            player:addQuest(OTHER_AREAS,IN_THE_NAME_OF_SCIENCE);
        elseif (NameOfScience == QUEST_ACCEPTED or NameOfScience ==QUEST_COMPLETED  and itemtarget == 0) then         
            player:startEvent(0x020D,13205,13327,13080);
        elseif (NameOfScience == QUEST_ACCEPTED or NameOfScience ==QUEST_COMPLETED and itemtarget > 0) then                
            if (rnd < 0.3) then
                player:startEvent(0x0214,getNOS(itemtarget,1),getNOS(itemtarget,2));
            else
                player:startEvent(0x0210,getNOS(itemtarget,1),getNOS(itemtarget,2));
            end
        end         
    else 
        if (rnd < 0.5) then
            player:startEvent(0x020F); --no quest
        else
            player:startEvent(0x0207); --no quest
        end
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
    if (csid == 0x0211) then
        local itemtarget = player:getVar("NAME_OF_SCIENCE_target");
        if (player:getFreeSlotsCount()==0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,itemtarget);
        else
            player:tradeComplete();
            player:completeQuest(OTHER_AREAS,IN_THE_NAME_OF_SCIENCE);
            player:addItem(itemtarget);
            player:messageSpecial(ITEM_OBTAINED,itemtarget); -- Item
            player:setVar("NAME_OF_SCIENCE_target",0);
        end
    end
end;