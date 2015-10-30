-----------------------------------
-- Area: Pso'xja
-- NPC:  Nunyunuwi
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	if (killer:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and killer:getVar("PromathiaStatus")==3) then
		killer:setVar("PromathiaStatus",4);
	end
end;