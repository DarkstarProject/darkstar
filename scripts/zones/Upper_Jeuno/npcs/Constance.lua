-----------------------------------
-- Area: Upper Jeuno
-- NPC: Constance
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- @pos -48 0 4
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
        a = player:getVar("saveTheClockTowerNPCz1"); -- NPC Part1
        if (a == 0 or (a ~= 8 and a ~= 9 and a ~= 10 and a ~= 12 and a ~= 24 and a ~= 11 and a ~= 28 and a ~= 13 and 
           a ~= 26 and a ~= 14 and a ~= 25 and a ~= 15 and a ~= 27 and a ~= 29 and a ~= 30 and a ~= 31)) then 
            player:startEvent(0x00b4,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
        end
    end
end;  

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x005a);
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
    if (csid == 0x00b4) then 
        player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
        player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 8);
    end
end;



