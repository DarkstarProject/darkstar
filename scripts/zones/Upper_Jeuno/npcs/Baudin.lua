-----------------------------------
-- Area: Upper Jeuno
-- NPC: Baudin
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- @pos -75 0 80
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(trade:hasItemQty(555,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
		a = player:getVar("saveTheClockTowerNPCz2"); -- NPC Zone2
		if(a == 0 or (a ~= 32 and a ~= 96 and a ~= 160 and a ~= 288 and a ~= 544 and a ~= 224 and a ~= 800 and a ~= 352 and 
		   a ~= 672 and a ~= 416 and a ~= 608 and a ~= 480 and a ~= 736 and a ~= 864 and a ~= 928 and a ~= 992)) then 
			player:startEvent(0x00b1,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x00AC);
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
	if(csid == 0x00b1) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz2",player:getVar("saveTheClockTowerNPCz2") + 32);
	end
end;