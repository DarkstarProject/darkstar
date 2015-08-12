-----------------------------------
-- Area: Throne Room
-- NPC:  Throne Room
-- Type: Door
-- @pos -111 -6 0 165
-------------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Throne_Room/TextIDs");

	-- events:
	-- 7D00 : BC menu
	-- Param 4 is a bitmask for the choice of battlefields in the menu:
	
	-- 0: Mission 5-2
	-- 1: 
	-- 2: 
	-- 3: 
	-- 4: 
	-- 5: 

	-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit
  
	-- 7D01 : final BC event.
	-- param 2: #time record for this mission
	-- param 3: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- 7D03 : stay/run away

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
		return;
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") == 2) then
		player:startEvent(0x0006);	
	elseif (EventTriggerBCNM(player,npc)) then
		return 1;
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if (EventUpdateBCNM(player,csid,option)) then
		return;
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if (csid == 0x0006) then
		player:setVar("MissionStatus",3);
	elseif (EventFinishBCNM(player,csid,option)) then
		return;
	end
	
end;