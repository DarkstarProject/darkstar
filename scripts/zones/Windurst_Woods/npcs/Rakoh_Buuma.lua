-----------------------------------
--	Area: Windurst Woods
--	NPC:  Rakoh Buuma
--	Starts Windurst Missions
--	@pos 106 -5 -23 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getNation() ~= WINDURST) then
		player:startEvent(0x0069); -- for other nation
	else
		CurrentMission = player:getCurrentMission(WINDURST);
		MissionStatus = player:getVar("MissionStatus");
		pRank = player:getRank();
		cs, p, offset = getMissionOffset(player,1,CurrentMission,MissionStatus);
		
		if(CurrentMission <= 15 and (cs ~= 0 or offset ~= 0 or (CurrentMission == 0 and offset == 0))) then
			if(cs == 0) then
				player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
			else
				player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
			end
		elseif(CurrentMission ~= 255) then
			player:startEvent(0x0070);
		elseif(player:hasCompletedMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT) == false) then
			player:startEvent(0x0079);
		elseif(player:hasCompletedMission(WINDURST,THE_HEART_OF_THE_MATTER) == false) then
			player:startEvent(0x0084);
		elseif(player:hasCompletedMission(WINDURST,THE_PRICE_OF_PEACE) == false) then
			player:startEvent(0x0095);
		else
			flagMission, repeatMission = getMissionMask(player);
			player:startEvent(0x0072,flagMission,0,0,0,0,repeatMission);
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
	
	if(csid == 0x0079 and option == 1) then
		player:setVar("Mission_started_from",1); -- Windurst Woods Guard
	end
	
	finishMissionTimeline(player,1,csid,option);
	
end;