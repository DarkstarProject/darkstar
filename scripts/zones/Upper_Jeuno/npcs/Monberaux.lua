-----------------------------------
-- Area: Upper Jeuno
-- NPC: Monberaux
-- Starts and Finishes Quest: The Lost Cardian (finish), The kind cardian (start)
-- Involved in Quests: Save the Clock Tower
-- @pos -43 0 -1 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
        a = player:getVar("saveTheClockTowerNPCz1"); -- NPC Part1
        if (a == 0 or (a ~= 4 and a ~= 5 and a ~= 6 and a ~= 12 and a ~= 20 and a ~= 7 and a ~= 28 and a ~= 13 and a ~= 22 and 
           a ~= 14 and a ~= 21 and a ~= 15 and a ~= 23 and a ~= 29 and a ~= 30 and a ~= 31)) then 
            player:startEvent(0x005b,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TheLostCardien = player:getQuestStatus(JEUNO,THE_LOST_CARDIAN);
    local CooksPride = player:getQuestStatus(JEUNO,COOK_S_PRIDE);
    -- COP mission 1-1
    if (player:getCurrentMission(COP) == THE_RITES_OF_LIFE and  player:getVar("PromathiaStatus") == 1) then
        player:startEvent(0x000a);--10
    -- COP mission 1-2
    elseif (player:getCurrentMission(COP) == BELOW_THE_ARKS  and  player:getVar("PromathiaStatus") == 0) then
        player:startEvent(0x0009);--9
     -- COP mission 3-5
    elseif (player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 0) then
        player:startEvent(0x0052);-- 82
    elseif (player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 3) then
        player:startEvent(0x004B); --75
    elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 2) then
        player:startEvent(0x004A); --74
    elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 4) then
        player:startEvent(0x0006);  
    elseif (CooksPride == QUEST_COMPLETED and TheLostCardien == QUEST_AVAILABLE and player:getVar("theLostCardianVar") == 2) then 
        player:startEvent(0x0021); -- Long CS & Finish Quest "The Lost Cardian" 33
    elseif (CooksPride == QUEST_COMPLETED and TheLostCardien == QUEST_AVAILABLE and player:getVar("theLostCardianVar") == 3) then 
        player:startEvent(0x0022); -- Shot CS & Finish Quest "The Lost Cardian" 34
    elseif (TheLostCardien == QUEST_COMPLETED and player:getQuestStatus(JEUNO,THE_KIND_CARDIAN) == QUEST_ACCEPTED) then 
        player:startEvent(0x0020); -- 32
    else
        player:startEvent(0x001c); -- Standard dialog 28
    end
    
end;
--Door:Infirmary     2 ++
--Door:Infirmary     10 ++
--Door:Infirmary     207 ++
--Door:Infirmary     82 ++
--Door:Infirmary     10059 nonCOP
--Door:Infirmary     10060 nonCOP
--Door:Infirmary     10205 nonCOP
--Door:Infirmary     10061 nonCOP
--Door:Infirmary     10062 nonCOP
--Door:Infirmary     10207 nonCOP
--Door:Infirmary     33 ++
--Door:Infirmary     34 ++
--Door:Infirmary     2 ++
--Door:Infirmary     82 ++
--Door:Infirmary     75 ++
--Door:Infirmary     10060 nonCOP
--Door:Infirmary     10205 nonCOP

--Tenzen     10011
--Tenzen     10012 
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
    if (csid == 0x0006) then
        player:setVar("COP_Tenzen_s_Path",5);    
    elseif (csid == 0x004a) then
        player:setVar("COP_Tenzen_s_Path",3);
        player:addKeyItem(ENVELOPE_FROM_MONBERAUX);
        player:messageSpecial(KEYITEM_OBTAINED,ENVELOPE_FROM_MONBERAUX);
    elseif (csid == 0x000a) then
        player:setVar("PromathiaStatus",0);
        player:addKeyItem(MYSTERIOUS_AMULET_DRAINED);
        player:completeMission(COP,THE_RITES_OF_LIFE);
        player:addMission(COP,BELOW_THE_ARKS); -- start the mission 1-2
        player:startEvent(0x00cf);  --207
    elseif (csid == 0x0052) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 0x004B) then    
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,DARKNESS_NAMED);
        player:addMission(COP,SHELTERING_DOUBT);
    elseif (csid == 0x005b) then 
        player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
        player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 4);
    elseif (csid == 0x0021 and option == 0 or csid == 0x0022 and option == 0) then 
        player:addTitle(TWOS_COMPANY);
        player:setVar("theLostCardianVar",0);
        player:addGil(GIL_RATE*2100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2100);
        player:addKeyItem(TWO_OF_SWORDS);
        player:messageSpecial(KEYITEM_OBTAINED,TWO_OF_SWORDS); -- Two of Swords (Key Item)
        player:addFame(JEUNO,30);
        player:completeQuest(JEUNO,THE_LOST_CARDIAN);
        player:addQuest(JEUNO,THE_KIND_CARDIAN); -- Start next quest "THE_KING_CARDIAN"
    elseif (csid == 0x0021 and option == 1) then 
        player:setVar("theLostCardianVar",3);
    end
    
end;