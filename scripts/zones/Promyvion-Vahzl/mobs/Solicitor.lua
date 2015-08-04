-----------------------------------
-- Area: Promyvion vahzl
-- NPC:  Solicitor
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
 if (killer:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and killer:getVar("PromathiaStatus")==3) then
	killer:setVar("PromathiaStatus",4);
  end
end;