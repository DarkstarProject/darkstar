-----------------------------------
-- Area: Toraimarai Canal
-- Mob: Hinge Oil
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/missions");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
local CurrentMission = killer:getCurrentMission(WINDURST);
local WindyKills = killer:getVar("Windurst_7-1Kills");
	if(CurrentMission == THE_SIXTH_MINISTRY and player:getVar("MissionStatus") == 1) then
		if(WindyKills < 4) then
			killer:setVar("Windurst_7-1Kills",WindyKills+1);
		end
	end
end;