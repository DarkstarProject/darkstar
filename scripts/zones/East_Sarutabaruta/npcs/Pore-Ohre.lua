-----------------------------------
--	Area: East Sarutabaruta
-- 	NPC: Pore-Ohre
--	Working ???%
-----------------------------------

package.loaded["scripts/globals/missions"] = nil;
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/East_Sarutabaruta/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Check if we are on Windurst Mission 1-2
	if(player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
		windurst_mission_1_2 = player:getVar("windurst_mission_1_2");
		if(windurst_mission_1_2 == 2) then
			-- The mission is active
			-- Next step in the mission
			player:startEvent(0x2e);
		elseif(windurst_mission_1_2 == 3) then
			-- Already been here, small description of what to do next
			player:startEvent(0x2f);
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
	if(csid == 0x2e) then
		player:addKeyItem(SOUTHEASTERN_STAR_CHARM);
		player:messageSpecial(KEYITEM_OBTAINED,SOUTHEASTERN_STAR_CHARM);
	end
end;



