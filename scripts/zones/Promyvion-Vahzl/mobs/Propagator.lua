-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Propagator
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
 if (killer:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and killer:getVar("PromathiaStatus")==1) then
	killer:setVar("PromathiaStatus",2);
  end
end;