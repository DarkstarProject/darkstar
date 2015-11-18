-----------------------------------
-- Area: Ghelsba Outpost
-- NPC:  Warchief Vatgit
-- Involved in Mission 2-3
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	
	if (killer:getCurrentMission(killer:getNation()) == 6) then
		if (killer:getVar("MissionStatus") == 4) then
			killer:setVar("MissionStatus",5);
		end
	end

	killer:addTitle(WARCHIEF_WRECKER);
	
end;