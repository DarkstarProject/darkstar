-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Nio A
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	if (killer:getCurrentMission(SANDORIA) == LIGHTBRINGER and killer:getVar("Mission8-2Kills") < 2) then
		local kills = killer:getVar("Mission8-2Kills");
		killer:setVar("Mission8-2Kills",kills + 1);
	end
end;