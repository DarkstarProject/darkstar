-----------------------------------
-- Area: Port Jeuno
-- NPC: Pitantimand
-- Involved in Quests: Save the Clock Tower
-- @zone 246
-- @pos -63 8 46
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(555,1) == true and trade:getItemCount() == 1) then 
        a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
        if (a == 0 or (a ~= 512 and a ~= 544 and a ~= 576 and a ~= 640 and a ~= 768 and a ~= 608 and a ~= 896 and a ~= 672 and 
           a ~= 832 and a ~= 704 and a ~= 800 and a ~= 736 and a ~= 864 and a ~= 928 and a ~= 960 and a ~= 992)) then 
            player:startEvent(0x0040,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x003f);
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
    if (csid == 0x0040) then 
        player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
        player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 512);
    end
end;