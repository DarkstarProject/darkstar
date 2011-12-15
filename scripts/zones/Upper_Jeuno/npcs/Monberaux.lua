-----------------------------------
-- Area: Upper Jeuno
-- NPC: Monberaux
-- Involved in Quests: Save the Clock Tower
-- @zone 244
-- @pos -43 0 -1
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
		a = player:getVar("saveTheClockTowerNPCz1"); -- NPC Part1
		if(a == 0 or (a ~= 4 and a ~= 5 and a ~= 6 and a ~= 12 and a ~= 20 and a ~= 7 and a ~= 28 and a ~= 13 and a ~= 22 and 
		   a ~= 14 and a ~= 21 and a ~= 15 and a ~= 23 and a ~= 29 and a ~= 30 and a ~= 31)) then 
			player:startEvent(0x005b,10 - player:getVar("saveTheClockTowerVar")); -- "Save the Clock Tower" Quest
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x001c);
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
	if(csid == 0x005b) then 
		player:setVar("saveTheClockTowerVar",player:getVar("saveTheClockTowerVar") + 1);
		player:setVar("saveTheClockTowerNPCz1",player:getVar("saveTheClockTowerNPCz1") + 4);
	end
end;



