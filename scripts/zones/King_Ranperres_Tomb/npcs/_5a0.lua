-----------------------------------
-- Area: King Ranperre's Tomb
-- DOOR: Heavy Stone Door
-- @pos -39.000 4.823 20.000
-----------------------------------
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/King_Ranperres_Tomb/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc) 
	local currentMission = player:getCurrentMission(SANDORIA);
	      MissionStatus = player:getVar("MissionStatus");
	
	if(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1) then
		if(GetMobAction(17555898) == 0 and GetMobAction(17555899) == 0 and GetMobAction(17555900) == 0) then
			if(player:getVar("Mission6-2MobKilled") == 1) then
				player:setVar("Mission6-2MobKilled",0);
				player:setVar("MissionStatus",2);
			else
				SpawnMob(17555898):updateEnmity(player);
				SpawnMob(17555899):updateEnmity(player);
				SpawnMob(17555900):updateEnmity(player);
			end
		end
	elseif(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 2) then
	     player:startEvent(0x0006);
    elseif(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 3) then
	     player:startEvent(0x0007);
	elseif(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 8) then
	     player:startEvent(0x0005);
	else
			 player:messageSpecial(HEAVY_DOOR);
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
    if(csid == 0x0005) then
	   player:setVar("MissionStatus",9);
	end
end;
