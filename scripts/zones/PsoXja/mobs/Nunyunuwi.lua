-----------------------------------
-- Area: Pso'xja
-- NPC:  Nunyunuwi 
-----------------------------------


require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
 if (killer:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and killer:getVar("PromathiaStatus")==2)then
	killer:setVar("PromathiaStatus",3);	
  end
end;