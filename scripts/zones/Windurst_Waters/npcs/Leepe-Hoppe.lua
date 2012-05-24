-----------------------------------
-- Area: Windurst Waters
-- NPC:  Leepe-Hoppe
-- Involved in Mission 1-3
-- @pos 13 -9 -197 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Check if we are on Windurst Mission 1-3
	if(player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
		MissionStatus = player:getVar("MissionStatus");
		if(MissionStatus == 0) then
			player:startEvent(0x008c);
		elseif(MissionStatus >= 1 and MissionStatus < 3) then
			player:startEvent(0x008e); -- Keep displaying the instructions
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
	
	if(csid == 0x008c) then
		player:setVar("MissionStatus",1);
		player:setVar("ohbiru_dohbiru_talk",0);
		player:addKeyItem(FOOD_OFFERINGS);
		player:messageSpecial(KEYITEM_OBTAINED,FOOD_OFFERINGS);
		player:addKeyItem(DRINK_OFFERINGS);
		player:messageSpecial(KEYITEM_OBTAINED,DRINK_OFFERINGS);
	end
	
end;