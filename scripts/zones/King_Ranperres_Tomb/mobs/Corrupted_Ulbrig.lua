-----------------------------------
-- Area: King Ranperres Tomb
-- NPC:  Corrupted Ulbrig
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local currentMission = killer:getCurrentMission(SANDORIA);
	local MissionStatus = killer:getVar("MissionStatus");

	if(currentMission == RANPERRE_S_FINAL_REST and MissionStatus == 1) then
		killer:setVar("Mission6-2MobKilled",1);
	end
end;
