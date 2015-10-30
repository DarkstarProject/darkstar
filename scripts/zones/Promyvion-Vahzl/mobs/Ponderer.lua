-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Ponderer
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
 if (killer:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and killer:getVar("PromathiaStatus")==5) then
	killer:setVar("PromathiaStatus",6);
  end
end;