-----------------------------------
--	Area: East Sarutabaruta
-- 	NPC: Sama Gohjima
--	Working 100%
-----------------------------------

package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
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
	-- Check if we are on Windurst Mission 1-1
	if(player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT) then
		windurst_mission_1_1 = player:getVar("windurst_mission_1_1");
		if(windurst_mission_1_1 == 2) then
			-- The mission is active
			player:showText(npc,SAMA_GOHJIMA_DIALOG);
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
end;



