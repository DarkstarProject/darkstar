-----------------------------------
-- Area: Outer Horutoto Ruins
-- NPC:  Jack of Cups
-----------------------------------

require("scripts/globals/titles");
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
local CurrentMission = killer:getCurrentMission(WINDURST);
local MissionStatus = killer:getVar("MissionStatus");

	if (CurrentMission == FULL_MOON_FOUNTAIN and MissionStatus == 1) then
		killer:setVar("MissionStatus",2);
	end

end;